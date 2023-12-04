---
layout: fix
title: "4D v20 修正リスト"
date: 2023-12-03 08:00:00
categories: 修正リスト
tags: "20.2" 
build: 100959
version: "20.2"
permalink: /2023/331/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104409 チェックボックスに対して`OBJECT SET ENTERABLE`を使用した場合の動作が過去のバージョンと違いました。コマンドを実行しても，チェックボックスの外観が変化せず，クリックすることができました。
