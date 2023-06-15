---
layout: fix
title: "URLフィルターとHTTP GET"
date: 2023-06-06 08:00:00
categories: 仕様
tags: webarea windows userinterface
---

Windows版のシステムWebエリアはMicrosoftのレンダリングエンジンを使用しており，その挙動を踏襲します。コマンドの`WA SET URL FILTER`はナビゲーションをフィルターするコマンドですが，HTTPリクエストの送信をブロックすると保証されているわけではないことに留意してください。[Microsoft Edge WebView2](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/icorewebview2navigationstartingeventargs?view=webview2-1.0.1823.32#get_cancel
)のドキュメントに述べられているとおり，`NavigationStarting`イベントでフラグをセットしてGETをキャンセルした場合，ページは遷移せず，ナビゲーションが中止されて`NavigationCompleted`イベントにステータスコードが返されますが，`GET`リクエストはすでに送信された後かもしれません。これは仕様です。