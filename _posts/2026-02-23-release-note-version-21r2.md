---
layout: fix
title: "4D 21 修正リスト"
date: 2026-02-23 08:00:00
categories: 修正リスト
tags: 21r2
build: 100143
version: "21r2"
permalink: /2026/54/:slug/
---

* ACI0106145 Windows版のクライアントからMac版のサーバーに接続し，自動アップデートを実行した場合，一部のユーザーインタフェースにビルドで設定したカスタムアイコンではなく，4D Volume Desktopのアイコンが表示されました。自動アップデートクライアントに`.ico`ファイルがコピーされていないようです。

* ACI0106217 フランス語版のみ。定数の`Chemin est système`に余計なスペースが含まれていました。

* ACI0106180 エクスポートダイアログでレコードの書き出しに使用するフォームを変更した場合，アプリケーションがクラッシュしました。

* ACI0106146 ORDAの[restrictedByDefault](https://developer.4d.com/docs/ja/ORDA/privileges)が有効に設定されている場合，エンティティを削除することができませんでした。