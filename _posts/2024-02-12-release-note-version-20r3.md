---
layout: fix
title: "4D 20r3 修正リスト"
date: 2024-02-19 08:00:00
categories: 修正リスト
tags: 20r3
build: 100341
version: "20r3"
permalink: /2024/43/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104562 メソッドエディターのコンテキストメニューでローカル変数の名称を変更した場合，複数行にわたって記述されたコードに看過されることがありました。

* ACI0104558 フォームに２個の統合Webエリアを配置し，`WA SET PAGE CONTENT`で空のページを表示しようとした場合，アプリケーションがクラッシュしました。URLを`about:blank`に設定すれば問題ありません。いずれかのWebエリアをシステム版に変更すれば問題ありません。

* ACI0104341 ORDAの`entity.clone()`を実行した場合，エンティティがロックされました。

* ACI0104533 *Client Web Application Expansion* ライセンスがインストールされていないクライアントで*NetKit* を使用することができませんでした。4D 20 LTSでは問題ありません。
