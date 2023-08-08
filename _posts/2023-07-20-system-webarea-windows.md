---
layout: fix
title: "デフォルトブラウザとWebエリア"
date: 2023-07-19 08:00:00
categories: 仕様
tags: userinterface 19.x webarea
---

v19 LTSのシステム版の[Webエリア](https://doc.4d.com/4Dv19/4D/19/Web-areas.300-5416743.ja.html#946269)は，[Web view](https://learn.microsoft.com/en-us/windows/apps/design/controls/web-view)を採用しているため，オペレーションシステムのデフォルトブラウザがEdgeであっても，JavaScriptの[`window.navigator.userAgent`](https://developer.mozilla.org/en-US/docs/Web/API/Navigator)は"Microsoft Edge Legacy"を返します。つまりブラウザ名でWindows 11検出することはできません。これはMicrosoft EdgeをInternet Explorer互換モードで実行したときと同じ動作であり，仕様です。v19r5以降は[Microsoft Edge WebView2](https://learn.microsoft.com/en-us/microsoft-edge/webview2/)を採用しているため，"Edge on Windows 11"が返されます。
