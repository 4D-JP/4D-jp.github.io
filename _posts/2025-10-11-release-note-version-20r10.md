---
layout: fix
title: "4D 20r10 修正リスト"
date: 2025-10-15 08:00:00
categories: 修正リスト
tags: 20r10
build: 100268
version: "20r10"
permalink: /2025/284/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105908 `Choose`コマンドの引数としてクラスのプロパティを記述した場合，メソッドエディターのヘルプTipsに間違った型が表示されました。

* ACI0105901 エクスプローラーでテーブルを選択した場合，すぐにプレビューが表示されませんでした。エクスプローラーのウィンドウを背面に移動してから再び最前面に移動すれば，プレビューが表示されます。

* ACI0105850 メールに特定の文字が含まれる場合，[`MAIL Convert to MIME`](https://developer.4d.com/docs/ja/commands/mail-convert-to-mime)または[`MAIL Convert from MIME`](https://developer.4d.com/docs/ja/commands/mail-convert-from-mime)で本文を正しく変換できないことがありました。

* ACI0105946 ASTインタープリターモードでは，コンパイル済みコンポーネントメソッドに対して`Call chain`を使用した場合，正しい呼び出し連鎖が返されないことがありました。

* ACI0105944 ASTインタープリターモードでは，`Call chain`から`formula`プロパティが返されないことがありました。