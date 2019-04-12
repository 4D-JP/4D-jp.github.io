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
{: .sub3}
- Protects binary from being manipulated
- Proves the application has not been tampered with
- Proves the application is coming from a trusted source
- Gets rid of the “Unknown Publisher” message when running on Windows
{: .sub3}

### Disadvantages of signing an app
There are a few potential disadvantages to signing an application. Here are some examples of things to consider:
{: .sub3}
- It is an additional step in the process or preparing the application
  - The development process will become slightly longer
- It requires a certificate from a trusted Certificate Authority ($$$)
  - The development cost will be slightly more
- The first time the application is launched the signature is verified
{: .sub3}

## Obtaining a signing certificate
---
Before an application can be signed, the developer must obtain a signing certificate. There are some differences in how to obtain the certificate for Mac and Windows so this section of the document is broken into two sections, one specific to Windows and one specific to Mac.

### Windows
The signing certificate can be obtained from numerous online SSL Certificate vendors. For this tech note a self-signed certificate is used; if this were for production then it would be recommended to use a certificate from a trusted source instead of a self-signed certificate.
{: .sub4}
#### Create a Self-Signed Certificate
The following command and parameters will be used to create a self-signed certificate on Windows:
{: .sub4}
```
Command: **New-SelfSignedCertificate**
Parameter 1: **-Type** Custom
Parameter 2: **-Subject** "CN=4D, O=4D Inc, C=US"
Parameter 3: **-KeyUsage** DigitalSignature
Parameter 4: **-FriendlyName** "4D, Inc" 
Parameter 5: **-CertStoreLocation** "Cert:\LocalMachine\My"
```
{: .sub4}
The values used for this tech note are filled in but the developer will want to use custom data for the **Subject** and **FriendlyName** parameters. The **CertStoreLocation** parameter can also use custom data but this location is used later on so if using something other than what is listed above, it will need to be substituted in later on.  
  
Once the values are updates, put it all together on a single line and run it from an Elevated PowerShell window like this:
{: .sub4}
```shell
New-SelfSignedCertificate -Type Custom -Subject "CN=4D, O=4D Inc, C=US" -KeyUsage DigitalSignature -FriendlyName "4D, Inc" -CertStoreLocation "Cert:\LocalMachine\My"
```
{: .sub4}
If the command is executed properly the output may look like this:
PSParentPath: Microsoft.PowerShell.Security\Certificate::LocalMachine\My
Thumbprint Subject
---------- -------
A6B2B0B3FECC6E4E1A3B562118F18BC82B63F304 CN=4D, O=4D Inc, C=US
The thumbprint of the certificate is important and will be used later on. In this example the thumbprint is A6B2B0B3FECC6E4E1A3B562118F18BC82B63F304 but the thumbprint for

![screenshot1](/images/AppSign-1.png){: .align-center}

画像左周りこみテキストテスト

![screenshot1](/images/AppSign-1.png){: .align-left}**Lorem ipsum** dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in [reprehenderit](#) in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

画像右周りこみテキストテスト

![My helpful screenshot-2](/images/AppSign-2.png){: .align-right}Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
{: .text-center}

**Lorem ipsum** dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse [cillum dolore](#) eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
{: .text-justify .notice--warning}

