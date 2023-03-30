---
layout: fix
title: "4D v19.6 修正リスト"
date: 2023-03-29 08:00:00
categories: 修正リスト
tags: v19 
build: 285842
version: "19.6"
permalink: /2023/79/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0103758 リストボックスを垂直方向にリサイズした場合，*On Display Detail* イベントが過剰に発生しました。

* ACI0103725 リストボックスを垂直方向にリサイズした場合，出現した行で追加の*On Display Detail* イベントが発生せず，リストボックスが完全に再描画されませんでした。垂直スクロールバーを操作してリストボックスを再描画すれば，出現した行の内容が表示されます。
