---
layout: fix
title: "4D v18 修正リスト"
date: 2021-04-27 08:00:00
categories: 修正リスト
tags: "18.4"
build: 265289
version: 18.4
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0101766 Windows版のみ。Write Proドキュメントから生成したマルチスタイルテキストに標準テキストを連結してテキスト入力エリアに表示した場合，アプリケーションがクラッシュすることがありました。

**注記**: 問題は修正されましたが，フォントファミリー名「Helvetica Neue LT Std 57 Condensed」はGDIの制限を超えているため，Windows版ではサポートされません。
