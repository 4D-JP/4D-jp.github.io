---
layout: fix
title: "4D 20r5 修正リスト"
date: 2024-08-27 08:00:00
categories: 修正リスト
tags: 20r5
build: 100276
version: "20r5"
permalink: /2024/195/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105041 `SET AUTOMATIC RELATIONS(False; False)`で自動リレーションを無効化した後に項目選択が設定されたフィールドにワイルドカード値を入力した場合，リレーションフィールドの項目リストが表示されました。

* ACI0105003 ピクチャ型の属性に対して[`entity.diff()`](https://developer.4d.com/docs/ja/API/EntityClass/#diff)を使用することができませんでした。

* ACI0104936 プロジェクトを開いていない状態でツールバーの「クエリ」ボタンをクリックすることができました。

* ACI0105032 過去バージョンのデータファイルを20 R5で開いた場合，アプリケーションがクラッシュすることがありました。データファイルをR3またはR4で開いた後であれば問題ありません。