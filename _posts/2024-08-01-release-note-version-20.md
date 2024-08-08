---
layout: fix
title: "4D 20 修正リスト"
date: 2024-08-07 08:00:00
categories: 修正リスト
tags: "20.4"
build: 101414
version: "20.4"
permalink: /2024/214/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104966 計算属性が定義されたクラスのインスタンスをHTTPリクエストで送信した場合，ランゲージコンテキストが不足しているという` -10754`シンタックスエラーが返されました。

* ACI0104996 Mac版バイナリモードのみ。システム言語に応じてスタイルシートのシステムフォント名がローカライズされました。

* ACI0104858 4Dのバージョンやビルドアプリケーション名に関係なく，同じ*CEF_cache* が常に使用されているため，統合Webエリアに表示したHTMLアプリケーションが正しく動作しないことがありました。

**注記**: キャッシュの`max_age`が`5`分に設定されました。

* ACI0104971 統合Webエリアでクロスドメインリソース共有をした場合，*Access-Control-Allow-Origin* ヘッダーに`*`が設定してもCORSエラーが返されました。

**注記**: CEFの*Access-Control-Request-Headers* に`accept-language`が含まれていることが関係しています。正しいキーワードは`accept_language`（ハイフンではなく[アンダースコア](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language)）です。