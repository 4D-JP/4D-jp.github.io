---
layout: fix
title: "4D 20 修正リスト"
date: 2025-03-09 08:00:00
categories: 修正リスト
tags: "20.6"
build: 101742
version: "20.6"
permalink: /2025/66/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105463 サーバー管理画面を閉じた後に再び表示した場合，「モニター」ページにハードドライブの情報が表示されませんでした。

* ACI0104382 指定したパスの`4D.WebSocket`オブジェクトがすでに存在し，`terminated`プロパティが`True`ではなかった場合，新しい`4D.WebSocket`オブジェクトは作成されずにエラーが返されますが，同時に既存の`4D.WebSocket`オブジェクトがクリアされました。

* ACI0105300 Windows版のみ。クライアント自動アップデート中に*update.win.4darchive* ファイルが書き換わりました。ACI0104623が修正されたことによる副作用のようです。
