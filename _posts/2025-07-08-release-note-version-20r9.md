---
layout: fix
title: "4D 20r9 修正リスト"
date: 2025-07-08 08:00:00
categories: 修正リスト
tags: 20r9
build: 100179
version: "20r9"
permalink: /2025/190/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105670 オブジェクト型フィールドに保存されたコレクション型のプロパティを`[]`シンタックスと`eval`でクエリした場合，正しい結果が返されませんでした。インデックスが設定されていなければ問題ありません。

* ACI0105651 *roles.json* で設定した`promote`アクションが適用されませんでした。

* ACI0105540 クライアント/サーバー版のみ。クライアント側では`DataClass.getInfo().exposed`が常に`True`を返しました。
