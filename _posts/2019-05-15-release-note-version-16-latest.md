---
layout: fix
title: "4D v16 修正リスト"
date: 2019-05-15 07:12:00
categories: 修正リスト
tags: "16.6"
build: 237452
version: 16.6

---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0099524 サーバー管理画面のプロセスベージにプリエンプティブワーカーのプロセス名が正しく表示されませんでした。ローカライズされてない文字列リソース（``:xliff:MONI_PROCESS_Type39 - (process name)``）が表示されました。
