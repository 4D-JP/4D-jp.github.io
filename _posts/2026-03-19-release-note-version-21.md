---
layout: fix
title: "4D 21 修正リスト"
date: 2026-03-26 08:00:00
categories: 修正リスト
tags: "21.0"
build: 100434
version: "21.0"
permalink: /2026/78/:slug/
---

* ACI0106206 [`License usage`](https://developer.4d.com/docs/ja/commands/license-usage)の`session.userName`プロパティが空でした。

* ACI0105732 クライアント/サーバー版のみ。データストアクラスのコンストラクターをトレースした場合，当該クライアントのプロセスが終了するまで，サーバー側のデバッガ画面が閉じられませんでした。コンストラクターを抜けた時点で閉じられるべきです。

* ACI0106261 エンティティクラスのオートコンプリート候補リストに`afterSave`イベントが表示されませんでした。他のORDAイベントは表示されます。

* ACI0106237 `OBJECT SET LIST BY REFERENCE`で同一の選択リストを複数の階層リストに設定した場合，フォーム終了時にアプリケーションがクラッシュしました。