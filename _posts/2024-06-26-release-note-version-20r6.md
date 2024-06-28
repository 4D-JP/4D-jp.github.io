---
layout: fix
title: "4D 20r6 修正リスト"
date: 2024-06-27 08:00:00
categories: 修正リスト
tags: 20r6
build: 100037
version: "20r6"
permalink: /2024/178/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104905 [`$limit`](https://developer.4d.com/docs/ja/REST/top_$limit/)を指定せずにREST APIでテーブルのレコード全件をリクエストした場合，デフォルトの上限である`100`件ではなく，エンティティセレクション全件がレスポンスとして返されました。

* ACI0104893 QUICレイヤーのみ。クライアントがテーブルリストだけを表示した状態でスリープモードに移行した場合，スリープ解除時にアプリケーションがハングしました。新ネットワークレイヤーでは「接続済みソケットの作成に失敗しました。」エラーが返されることがあります。

* ACI0104881 リモートデータストアに対して`dataStore.authentify()`を実行した場合，エラーが返されました。

* ACI0104655 Apple Siliconターゲットのみ。特定のプロセス変数名を使用してコンパイルを実行した場合，「変数の再定義」エラーが返されました。

```
param:=1
Global:=1
local:=1
artyp:=1
aratt:=1
irgule:=1
ariab:=1
```

* ACI0104883 Intelコンパイルモードのみ。`Case of`構文の条件に`Try`式を使用した場合，アプリケーションがクラッシュしました。
