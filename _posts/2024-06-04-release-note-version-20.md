---
layout: fix
title: "4D 20 修正リスト"
date: 2024-06-05 08:00:00
categories: 修正リスト
tags: "20.3"
build: 101313
version: "20.3"
permalink: /2024/158/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0102583 フランス語版のみ。*Write Pro Toolbar* のスペルチェックボタンのヘルプTipsがローカライズされていませんでした。

* ACI0104716 BLOB・ピクチャ・テキスト型フィールドの保存オプションを「データファイルの外」から「レコード内」に切り替えた場合，カタロクの`outside_blob`属性が更新されませんでした。