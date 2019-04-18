---
layout: technote
original_title: Application Signing with 4D
title: "ビルドアプリケーションのコード署名"
author: Timothy Aaron Penner
position: Senior Technical Services Engineer, 4D Inc.
date: 2019-04-01 00:00:00
categories: アプリケーションビルド
tags: mac windows deployment
version: 17
---

テクニカルノートは現在準備中です。
<!--more-->

## Introduction
---
Application signing is an integral part of distribution cycle of applications. It is sort of like a tamper-resistant bottles or a ‘void if removed’ sticker – it serves as a way for the consumer to identify if the item has been tampered with. The signed application is only valid if application has not been tampered with. In contrast, making changes to the binary file after signing the application will invalidate the signature. Although this is an extra step in the in final stages of development, the added development time equates to better peace of mind for the end users.

## Why sign an application?
---
There are many advantages to signing an application before distributing it to customers, and possibly only a few disadvantages. Generally speaking, the advantages outweigh the disadvantages; but it is up to the developer to decide what is right for their own development and deployment practice. For example, a developer providing in-house development work for internal database may not find this to be as important as it would be for someone developing a vertical market application. Although, application signing could actually be beneficial in both situations. Let’s explore the pros and cons.

### Advantages of signing an app
Signing the application can be advantageous for both the developer and the end user. Here are a few examples of the advantages:

- Protects binary from being manipulated
- Proves the application has not been tampered with
- Proves the application is coming from a trusted source
- Gets rid of the “Unknown Publisher” message when running on Windows


### Disadvantages of signing an app
There are a few potential disadvantages to signing an application. Here are some examples of things to consider:

- It is an additional step in the process or preparing the application
  - The development process will become slightly longer
- It requires a certificate from a trusted Certificate Authority ($$$)
  - The development cost will be slightly more
- The first time the application is launched the signature is verified


## Obtaining a signing certificate
---
Before an application can be signed, the developer must obtain a signing certificate. There are some differences in how to obtain the certificate for Mac and Windows so this section of the document is broken into two sections, one specific to Windows and one specific to Mac.

### Windows
The signing certificate can be obtained from numerous online SSL Certificate vendors. For this tech note a self-signed certificate is used; if this were for production then it would be recommended to use a certificate from a trusted source instead of a self-signed certificate.

#### Create a Self-Signed Certificate
The following command and parameters will be used to create a self-signed certificate on Windows:

Command: **New-SelfSignedCertificate**  
Parameter 1: **-Type** Custom  
Parameter 2: **-Subject** "CN=4D, O=4D Inc, C=US"  
Parameter 3: **-KeyUsage** DigitalSignature  
Parameter 4: **-FriendlyName** "4D, Inc"  
Parameter 5: **-CertStoreLocation** "Cert:\LocalMachine\My"

The values used for this tech note are filled in but the developer will want to use custom data for the **Subject** and **FriendlyName** parameters. The **CertStoreLocation** parameter can also use custom data but this location is used later on so if using something other than what is listed above, it will need to be substituted in later on.  

Once the values are updates, put it all together on a single line and run it from an Elevated PowerShell window like this:

```powershell
New-SelfSignedCertificate -Type Custom -Subject "CN=4D, O=4D Inc, C=US" -KeyUsage DigitalSignature -FriendlyName "4D, Inc" -CertStoreLocation "Cert:\LocalMachine\My"
```

If the command is executed properly the output may look like this:

```powershell
PSParentPath: Microsoft.PowerShell.Security\Certificate::LocalMachine\My
Thumbprint Subject
---------- -------
A6B2B0B3FECC6E4E1A3B562118F18BC82B63F304 CN=4D, O=4D Inc, C=US
```

The thumbprint of the certificate is important and will be used later on. In this example the thumbprint is A6B2B0B3FECC6E4E1A3B562118F18BC82B63F304 but the thumbprint for those that are following along at home will be different. Be sure to include the correct thumbprint for the examples in the following sections.

Note: This process needs to be done from a PowerShell window with Elevated Privileges.
{: .notice--info}
#### Export the certificate to PFX
The next step is to export the certificate to a PFX file, but in order to do this a password must be set. The PowerShell command ConvertTo-SecureString is used to create the secure password and store it into a session variable ($pwd). The PowerShell command ExportPfxCertificate is used to export the certificate in PFX format using the $pwd session variable.

The following 2 lines PowerShell code will create a password in the $pwd session variable and then use the $pwd session variable in the exporting of the certificate.

```powershell
$pwd = ConvertTo-SecureString -String "thePassword" -Force -AsPlainText
Export-PfxCertificate -cert Cert:\LocalMachine\My\A6B2B0B3FECC6E4E1A3B562118F18BC82B63F304 -FilePath C:\signing\cert.pfx -Password $pwd
```

Here is the breakdown of the first command and parameters used:

Return value stored in: $pwd  
Command 1: ConvertToSecureString  
Parameter 1: -String “thePassword” Parameter  
2: -Force Parameter  
3: -AsPlainText

The first command written out in the terminal looks like this:

```powershell
$pwd = ConvertTo-SecureString -String "thePassword" -Force -AsPlainText
```

This stores the password (“thePassword”) as a secure string within the $pwd session variable to be used in the next line of PowerShell code. The developer will want to modify the value in the password parameter and then substitute the correct password in for the following examples.

Here is the breakdown of the second command and parameters used:

Command 2: ExportPfxCertificate  
Parameter 1: -cert Cert:\LocalMachine\My\A6B2B0B3FECC6E4E1A3B562118F18BC82B63F304  
Parameter 2: -FilePath C:\signing\cert.pfx  
Parameter 3: -Password $pwd

The second command written out in the terminal looks like this (due to the length of the line and the width of this document, the single line is depicted on multiple lines):

```powershell
Export-PfxCertificate -cert Cert:\LocalMachine\My\A6B2B0B3FECC6E4E1A3B562118F18BC82B63F304 -FilePath C:\signing\cert.pfx -Password $pwd
```

This exports the certificate iditified by the thumbprint and exports it to the path specified by the FilePath parameter, using the password defined in the $pwd session variable. The developer will need to substitute the correct thumbprint when running this command.

Once all of the data points have been updated the developer can run the two commands like this:

```powershell
$pwd = ConvertTo-SecureString -String "thePassword" -Force -AsPlainText
Export-PfxCertificate -cert Cert:\LocalMachine\My\A6B2B0B3FECC6E4E1A3B562118F18BC82B63F304 -FilePath C:\signing\cert.pfx -Password $pwd
```

This will place the password protected PFX certificate into the location specified. This PFX file will be used later for signing the 
application, and the password is required to use the PFX file.

The output observed in PowerShell may look like this:

```powershell
Directory: C:\signing
Mode LastWriteTime Length Name
---- ------------- ------ ----
-a---- 8/9/2018 3:06 PM 2701 cert.pfx
```

This indicates that the file has been exported and provides a short summary.

### MacOS
Signing Certificates for the MacOS platform can be created from either inside of XCode or from the Apple Developer website. In both cases, an active membership to the Apple Developer Program is required.

#### Obtaining the certificate from Apple’s website
The Apple Developer website is available from the following URL: https://developer.apple.com/account/

The steps for obtaining the certificate from Apple’s website have changed over the years. Currently, the developer needs to use the iTunes connect portal to obtain the certificate.

#### Obtaining the certificate using XCode
To create the certificate from within XCode, first launch XCode.

From the XCode drop down menu choose the Preferences menu item:
![screenshot1](/images/app-1.png){: .align-right}
**Lorem ipsum** dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostru

Choose the Accounts tab.
![screenshot1](/images/app-2.png)

If the AppleID account is not already added, click on the + button to add the account (this account must have an active membership to the Apple Developer Program).

Once the Apple ID account is added, select the account from the left side of the accounts window,. Then click on the Manage Certificates button.

From the manage certificates dialog, click on the + and choose “Developer ID Application”.
![screenshot1](/images/app-3.png)

Follow the prompts to complete the process.

#### Locating the certificate in Keychain Access

Once complete, the certificate should be listed in the Keychain Access application under the certificates section.

![screenshot1](/images/app-4.png){: .align-left}
**Lorem ipsum** dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostru

The name listed here is the name that should be used when identifying the certificate. For example, the name to be used for the certificate depicted in this screenshot is “Developer ID Application: 4D Inc (Q2R63U84YG)”

## How to sign an app on MacOS
---
On MacOS a merged 4D application can be signed from within the BUILD APPLICATION process, or afterwards from the Terminal application. It is usually preferred to sign the application from within the BUILD APPLICATION process, however, if an error occurs during the signing process it is suggested to switch the process and perform the signing from Terminal in order to obtain more information about the failure.

### Sign the application from 4D during BUILD APPLICATION
The Build Application dialog in 4D provides the developer the option of Code Signing their application during the build process. This feature is only available on the MacOS operating system. This option is exposed at the bottom of the License tab of the Build Application dialog:

**Lorem ipsum** dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse [cillum dolore](#) eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
{: .text-justify .notice--warning}

