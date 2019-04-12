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

## Introduction<hr>
Application signing is an integral part of distribution cycle of applications. It is sort of like a tamper-resistant bottles or a ‘void if removed’ sticker – it serves as a way for the consumer to identify if the item has been tampered with. The signed application is only valid if application has not been tampered with. In contrast, making changes to the binary file after signing the application will invalidate the signature. Although this is an extra step in the in final stages of development, the added development time equates to better peace of mind for the end users.

## Why sign an application?<hr>
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

![screenshot1](/images/AppSign-1.png){: .align-center}

画像左周りこみテキストテスト

![screenshot1](/images/AppSign-1.png){: .align-left}**Lorem ipsum** dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in [reprehenderit](#) in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

画像右周りこみテキストテスト

![My helpful screenshot-2](/images/AppSign-2.png){: .align-right}Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 

Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.{: .text-center}

**Lorem ipsum** dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse [cillum dolore](#) eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
{: .text-justify .notice--warning}

