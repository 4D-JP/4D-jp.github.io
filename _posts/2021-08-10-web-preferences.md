---
layout: post
title: "WebエリアのJavaScriptは常に有効"
date: 2021-08-10 12:48:00
categories: 仕様
tags: v19 webarea
---

v19では，[WA SET PREFERENCE](https://doc.4d.com/4Dv19/4D/19/WA-SET-PREFERENCE.301-5393011.ja.html)の定数[\_o_WA enable JavaScript](https://doc.4d.com/4Dv19/4D/19/Web-Area.302-5393313.ja.html)が廃止され，WebエリアのJavaScriptを無効にすることはできないように仕様が変更されました。

以前のバージョンでは，システム版のWebエリアであれば，コマンドでWebエリアのJavaScriptを無効にすることができました。CEF版のWebエリアは，常にJavaScriptが有効でした。

v19では，macOS Big Surに対応するため，システム版のWebエリアがmacOS 10.10の[WKWebView](https://developer.apple.com/documentation/webkit/wkwebview)にアップデートされました。[WA Get page content](https://doc.4d.com/4Dv19/4D/19/WA-Get-page-content.301-5393009.ja.html)に相当するシステムAPIが廃止されているため，内部的にJavaScriptが使用されています。また，フォントサイズを増減するAPIはBig Sur以降でなければ使用できないため，Catalina以前では内部的にJavaScriptが使用されています。いずれにしても，WKWebViewをインスタンス化した後に当該設定を変更することはできないため，下記のオプションは廃止されました。

* _o_WA enable plugins 
* _o_WA enable JavaScript
* _o_WA enable Java applets
