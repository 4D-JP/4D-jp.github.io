---
layout: fix
title: "4D v19.2 修正リスト"
date: 2022-05-11 08:00:00
categories: 修正リスト
tags: 19.2
build: 279271
version: "19.2"
permalink: /126/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0102434 コンパイル実行中にアプリケーションを終了した場合，クラッシュすることがありました。

* ACI0102842 `VP SET CELL STYLE`でセルの`backColor`を設定した場合，指定したレンジだけでなく，周囲のレンジにも背景色が適用されることがありました。

* ACI0102193 View Proスプレッドシートの`printInfo.paperSize.kind`を`a4`のように小文字で指定する必要がありました。

* ACI0102825 Webサーバーの「セッションなし」オプションが外部ファイルのユーザー設定に保存されませんでした。v19にアップグレードしたプロジェクトで問題が再現します。v19で作成したプロジェクトでは問題ありません。一旦「旧式セッション管理」などの新しいオプションを選択し，設定を保存した後であれば，問題ありません。