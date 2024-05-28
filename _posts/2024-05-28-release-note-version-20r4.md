---
layout: fix
title: "4D 20r4 修正リスト"
date: 2024-05-27 08:00:00
categories: 修正リスト
tags: 20r4
build: 100356
version: "20r4"
permalink: /2024/147/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104406 テーブルに複合インデックスが設定されている場合，`QUIT 4D`の実行後にアプリケーションがフリーズすることがありました。