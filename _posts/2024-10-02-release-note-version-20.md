---
layout: fix
title: "4D 20 修正リスト"
date: 2024-10-07 08:00:00
categories: 修正リスト
tags: "20.5"
build: 101481
version: "20.5"
permalink: /2024/276/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105108 `Get monitored activity`から`message`プロパティを持たない（したがって調査の助けにならない）統計情報が返されることがありました。
