---
layout: fix
title: "4D v19r7 Hotfix 2 修正リスト"
date: 2023-03-03 08:00:00
categories: 修正リスト
tags: 19r7 hotfix
build: 100278
version: 19r7
permalink: /2023/63/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0103638 Write Proエリアの垂直スクロールバーを末尾行まで移動した場合，先頭行までスクロール位置が戻りました。初回の操作で問題が発生します。

* ACI0103689 共有オブジェクトである`Signal`オブジェクトを非共有オブジェクトのプロパティに代入することができました。そのようなそのようなオブジェクトを`OB Copy`の`ck shared`オプションでコピーしようとするとエラー`-10719`が返されました。`Signal`オブジェクトに対して`Use`を使用すれば問題ありません。

* ACI0103697 コンパイルモードのみ。レイジー演算子（`||`および`&&`）とマイナス数値リテラルの比較が間違っていました。`5 || -1`が`5`ではなく`4`を返しました。明示的にカッコを挿入すれば（`5 || (-1)`）問題ありません。

* ACI0103711 ピクチャ入力オブジェクトに設定したボーダースタイルがフォーム実行時に反映されきませんでした。フォームエディターには正しく表示されます。

* ACI0103721 CEF版Webエリアにカメラおよびマイクのアクセスが許可されていませんでした。

* ACI0103740 デザインモードのエクスプローラーを閉じた後にメソッドメニューの「エクスプローラーに表示…」を実行した場合，アプリケーションがフリーズしました。

* ACI0103749 新ネットワークレイヤーのみ。新規クライアント接続を拒否した後に許可した場合，サーバーのアプリケーション名がUDPでブロードキャストされませんでした。UDPを再開するためには，サーバーを再起動する必要がありました。旧式ネットワークレイヤーでは問題ありません。