---
layout: fix
title: "4D v19r7 修正リスト"
date: 2022-10-10 08:00:00
categories: 修正リスト
tags: 19r7
build: 100046
version: 19r7
permalink: /283/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0103363 4D Go MobileでビルドしたAndroidアプリでHTTPSサーバーに接続することができませんでした。

* ACI0103241 Application Support (Mac) またはApp Data/Roaming (Windows) に作成される*dataCollection.json* ファイルにデータベースの`databases`コレクションの内容が正しくありませんでした。

* ACI0103354 クライアント/サーバー版のみ。データベースフォルダーではなく，プロジェクトフォルダーだけを共有した場合，開発モードでサーバーに接続するとクライアントがクラッシュしました。

* ACI0103243 Internet Commandsのメール送受信コマンドがエラーを返すことがありました。

* ACI0103344 Windows版のみ。システムワーカーのインスタンスが解放されても，システムハンドルが解放されませんでした。`LAUNCH EXTERNAL PROCESS`を使用すれば問題ありません。

* ACI0103343 クライアント/サーバー版のみ。「データベースが壊れていたら最新のバックアップから復元する」が有効にされており，起動時に自動復元が作動した場合，ジャーナルの復元中にサーバーがクラッシュしました。
