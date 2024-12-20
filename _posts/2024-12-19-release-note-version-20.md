---
layout: fix
title: "4D 20 修正リスト"
date: 2024-12-18 08:00:00
categories: 修正リスト
tags: "20.5"
build: 101642
version: "20.5"
permalink: /2024/335/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105287 Mac版のみ。`SET WINDOW RECT`でウィンドウを別のモニターに移動した場合，ウィンドウがフォーカスを失い，非アクティブになりました。ACI0099153が修正されたことによる副作用です。
