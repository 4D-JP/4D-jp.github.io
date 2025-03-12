---
layout: fix
title: "4D 20 修正リスト"
date: 2025-03-11 08:00:00
categories: 修正リスト
tags: "20.6"
build: 101748
version: "20.6"
permalink: /2025/66/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105476 データファイルの外にピクチャ型またはBLOB型のフィールドを保存できなかった場合，アプリケーションがクラッシュしました。ACI0105050が修正されたことによる副作用のようです。

* ACI0105472 `VP Convert from 4D View`で大量の4D ViewスプレッドシートをView Proに変換したり，`VP IMPORT FROM OBJECT`でオブジェクトから展開した場合，かなりの時間がかかりました）。

* ACI0105467 View Proエリアのツールバーまたはリボンで罫線を除去することができませんでした。

**注記**: [SpreadJS `16.2.6`の不具合](https://developer.mescius.com/spreadjs/docs/rnotes/release-notes-for-version-1700)です。SpreadJSをアップデートする代わりにJavaScriptをバッチすることで問題が修正されました。

* ACI0105434 クイックレポートのステータスエディターに同じＮ対１リレーションフィールドが繰り返し表示されました。

* ACI0105463 サーバー管理画面を閉じた後に再び表示した場合，「モニター」ページにハードドライブの情報が表示されませんでした。

* ACI0104382 指定したパスの`4D.WebSocket`オブジェクトがすでに存在し，`terminated`プロパティが`True`ではなかった場合，新しい`4D.WebSocket`オブジェクトは作成されずにエラーが返されますが，同時に既存の`4D.WebSocket`オブジェクトがクリアされました。

* ACI0105300 Windows版のみ。クライアント自動アップデート中に*update.win.4darchive* ファイルが書き換わりました。ACI0104623が修正されたことによる副作用のようです。
