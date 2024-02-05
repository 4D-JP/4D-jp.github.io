---
layout: fix
title: "WebSocketと動画のストリーミング"
date: 2024-02-04 08:00:00
categories: 仕様
tags: devcon24 programming language websocket
---

# 4D Developer Conference 2024・質疑応答より

> **WebSocketServer**を使用すれば，リアルタイムで音声や動画をストリーミング配信することができますか

`4D.WebSocketServer`には，[WebSocketStream](https://developer.chrome.com/docs/capabilities/web-apis/websocketstream?hl=ja)のように**バックプレッシャー**を適用する仕組みがないので，動画のライブ配信やビデオ会議システムのようなアプリケーションを構築する用途には向いていません。

ブラウザからJavaScriptで定期的に送信されるフレーム画像を扱うだけの**防犯カメラ**アプリケーションであれば，WebSocketServerだけで簡単に構築することができます。

<i class="fa fa-external-link" aria-hidden="true"></i> https://github.com/miyako/4d-class-websocket-server-video
