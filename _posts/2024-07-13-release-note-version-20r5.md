---
layout: fix
title: "4D 20r5 修正リスト"
date: 2024-07-13 08:00:00
categories: 修正リスト
tags: 20r5
build: 100222
version: "20r5"
permalink: /2024/195/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104948 Windows版のみ。地域と言語の設定に対応する*.lproj* が存在しない場合，ストラクチャエディターのコンテキストメニューにXLIFFリソースが表示されませんでした。デフォルトで英語のXLIFFリソースがロードされるべきです。
