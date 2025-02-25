---
layout: fix
title: "4D 20r7 修正リスト"
date: 2025-02-24 08:00:00
categories: 修正リスト
tags: 20r7
build: 100360
version: "20r7"
permalink: /2025/55/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105413 Mac版Apple Siliconターゲットのコンパイルモードのみ。	`Try(expression)`でコード実行がアボートされました。

**注記**: ランタイムが修正されました。再コンパイルの必要はありません。

* ACI0105382 バイナリモードのみ。チェックボックスのタイトルをスペース（` `）に設定した場合，代わりにコロン記号（`:`）が表示されました。
