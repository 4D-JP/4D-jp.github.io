---
layout: fix
title: "4D v18r5 Hotfix 2 修正リスト"
date: 2021-02-10 08:00:00
categories: 修正リスト
tags: 18r5 hotfix
build: 261565
version: 18r5
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0101637 macOS Big Surのみ。`DELAY PROCESS(Current process;1)`をループ処理の中で実行した場合，CPU使用率がほぼ`100%`になりました。

* ACI0101640 macOS Big Surのみ。`TCP_Listen`を実行した場合，CPU使用率が`25%`に跳ね上がりました。

* ACI0101487 Windows版のコンパイルモードのみ。`DIALOG`コマンドでアプリケーション全体がフリーズすることがありました。
