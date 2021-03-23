---
layout: post
title: "Webエリアを使用したGoogleサインインのセキュリティ強化"
date: 2021-03-24 12:00:00
categories: 仕様
tags: cef webarea 
---

<i class="fa fa-external-link" aria-hidden="true"></i> [Googleのブログ](https://developers.googleblog.com/2020/08/guidance-for-our-effort-to-block-less-secure-browser-and-apps.html)で説明されているように，組み込みレンダリングエンジンにブラウザの操作を模倣させてGoogleサービスにログインすることはできなくなりました。Googleユーザー認証には，実際のブラウザを使用するか，OAuth 2.0の手順を踏む必要があります。WebエリアでGmailなどのサービスにログインを試みた場合，「このブラウザまたはアプリケーションは安全ではない可能性があります」というエラーメッセージが表示され，先に進むことができません。これは仕様です。
