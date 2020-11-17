---
layout: fix
title: "4D v18 修正リスト"
date: 2020-11-17 08:00:00
categories: 修正リスト
tags: "18.3"
build: 258305
version: 18.3
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0101414 `MAIL Convert from MIME`でMIMEを処理した場合，``Content-Disposition``ヘッダーの``name``パラメーターが正しく解析されませんでした。通常，`name`は`Content-Type`ヘッダーに記述されますが，Thunderbirdのようなメールクライアントはどちらに記述されていたとしても添付ファイル名を表示することができます。
