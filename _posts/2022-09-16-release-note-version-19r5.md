---
layout: fix
title: "4D v19r5 Hotfix 2 修正リスト"
date: 2022-09-16 08:00:00
categories: 修正リスト
tags: 19r5
build: 282219
version: 19r5 hotfix
permalink: /260/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0102928 クライアント/サーバー版のみ。インスタンス化したクラスオブジェクトをフィールドに保存した後，データストアから取り出して計算属性を評価した場合，ランゲージの実行コンテキストが不足しているというエラーが返されました。
