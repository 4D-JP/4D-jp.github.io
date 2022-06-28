---
layout: fix
title: "4D v19.3 修正リスト"
date: 2022-06-28 08:00:00
categories: 修正リスト
tags: "19.3"
build: 280596
version: "19.3"
permalink: /153/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0103046 Mac版のみ。タブコントロールの上下どこをクリックしてもイベントが発生しました。

* ACI0101062 `CONFIRM`ダイアログの高さに余裕がありませんでした。

* ACI0100583 HTTPサーバーの停止と開始を繰り返した場合，TLSの証明書チェーンに同一の証明書が何度も追加されました。
