---
layout: fix
title: "4D v19 修正リスト"
date: 2022-01-20 08:00:00
categories: 修正リスト
tags: "19.1"
build: 275195
version: 19.1
permalink: /20/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0102290 空のコレクションに対して`IN`比較演算子を使用して`collection.query()`を実行した場合，アプリケーションがクラッシュしました。

* ACI0102313 日本語のテーブルタイトルを*VP SET FIELDS*で登録した場合，テーブル名の濁点や半濁点が除去されました。

* ACI0102578 `WP Get position`から返される`bounds.left`の値が正しくないことがありました。段落の直後にある空行にカーソルを置いた場合，`WP Text range`はカーソルの位置ではなく段落の最終位置を返すようです。
