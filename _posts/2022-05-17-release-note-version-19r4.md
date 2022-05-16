---
layout: fix
title: "4D v19r4 Hotfix 1 修正リスト"
date: 2022-05-17 08:00:00
categories: 修正リスト
tags: 19r4
build: 279334
version: 19r4
permalink: /138/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0102896 Windows版のみ。クライアント/サーバー接続に新ネットワークレイヤーを使用しており，TLSが有効にされている場合，4D Remoteから別の4D Remoteに対してSOAPリクエストを送信するとサーバーとの接続が切断されました。

* ACI0102143 `Get process activity`または`OB Get`（テキスト型のプロパティを参照した場合）を実行するたびにメモリーリークが発生しました。

* ACI0102857 View Proスプレッドシートの`printInfo.paperSize.kind`が`A4`のように文字列ではなく`9`のように数値で返されました。

* ACI0102521 コンパイルモードのみ。`SET DATABASE PARAMETER`でデバッグログ（`Debug log recording`）を実行した場合，メソッドのパラメーターが正しく記録されませんでした。

* ACI0102193 View Proスプレッドシートの`printInfo.paperSize.kind`を`a4`のように小文字で指定する必要がありました。

* ACI0102768 Mac版のみ。macOS 10.14.6 Mojaveで起動した場合，アプリケーションがクラッシュしました。
