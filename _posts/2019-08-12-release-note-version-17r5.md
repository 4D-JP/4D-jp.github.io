---
layout: fix
title: "4D v17r5 Hotfix 1 修正リスト"
date: 2019-08-12 -08:00:00
categories: 修正リスト
tags: 17r5 hotfix
build: 240287
version: 17r5
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0099844 クライアント/サーバー版のみ。ループ処理でエンティティのリレーション属性にアクセスした場合，２巡目以降の処理で第２階層以降の値が返されませんでした。17r5で実施されたORDA最適化の副作用です。
