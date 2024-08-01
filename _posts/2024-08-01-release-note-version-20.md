---
layout: fix
title: "4D 20 修正リスト"
date: 2024-08-01 08:00:00
categories: 修正リスト
tags: "20.4"
build: 101410
version: "20.4"
permalink: /2024/214/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104971 統合Webエリアでクロスドメインリソース共有をした場合，*Access-Control-Allow-Origin* ヘッダーに`*`が設定してもCORSエラーが返されました。

**注記**: CEFの*Access-Control-Request-Headers* に`accept-language`が含まれていることが関係しています。正しいキーワードは`accept_language`（ハイフンではなく[アンダースコア](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language)）です。