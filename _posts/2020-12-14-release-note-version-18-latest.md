---
layout: fix
title: "4D v18 修正リスト"
date: 2020-12-15 08:00:00
categories: 修正リスト
tags: "18.3"
build: 259580
version: 18.3
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0101521 Write Proドキュメントのインデント（`wk text indent`）が負の値に設定されている場合，MIMEフォーマットでHTMLエクスポートすると，行の先頭部分が切り捨てられました。webフォーマットでHTMLエクスポートすれば問題ありません。HTMLエクスポートでは，逆インデントが無視されるべきです。

* ACI0100969 4D for iOSのカスタムデータフォーマッターがＮ対１リレーションフィールドに適用されませんでした。

* ACI0101447 コレクションメソッドのコールバックがバリアント型でパラメーターを宣言している場合，コンパイルモードでは`2`巡目以降のパラメーターが未定義になりました。

* ACI0101374 View Proスプレッドシートのセルに「2020年10月26日」を入力すると「2020年10月2**5**日」に変換されました。

* ACI0101323 `WEB Get server info`のプロパティ`webInactiveProcessTimeout`および`webMaxConcurrentProcesses`には，デフォルト値が常に返されました。データベース設定または`WEB SET OPTION`で変更した値が返されるべきです。

* ACI0099000 `4DLOOP`ブロックの中に`4DIF` `4DELSE` `4DELSEIF` `4DENDIF`ブロックが`3`回記述されている場合，２巡目のループで`PROCESS 4D TAGS`がエラー（`4DENDIF`がありません）を返しました。`3`回の`4DIF` `4DELSE` `4DELSEIF` `4DENDIF`ブロック全体を`4DIF True` `4DELSEIF`で囲えば問題ありません。

* ACI0101013 Mac版のみ。View ProエリアのツールバーからPDF形式でエクスポート使用とした場合，テンポラリフォルダーがデフォルトの書き出しフォルダーとして表示されました。
