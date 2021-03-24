--- 
layout: fix
title: "4D v18 Hotfix 2 修正リスト"
date: 2021-03-24 08:00:00
categories: 修正リスト
tags: 18.4 hotfix
build: 236387
version: 18.4
--- 

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0101683 `METHOD SET CODE`でテーブルフォームのメソッドをセットした場合，定数の`On Load`が当該テーブルの１番フィールドの名前にトークナイズされました。テーブルフォームのメソッドでなければ，問題ありません。
