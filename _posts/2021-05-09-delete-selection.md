---
layout: post
title: "DELETE SELECTIONは中断しない"
date: 2021-05-09 12:00:00
categories: 注意点
tags: database 
---

`DELETE RECORD`と`DELETE SELECTION`では，レコードロックの仕組みが異なるため，トリガの振る舞いに違いが存在します。後者の場合，複数のレコードがロックされている可能性があるため，`LockedSet`システムセットに削除できなかったレコードの情報が記録され，**レコード毎にエラー処理メソッドが実行されることはありません**。これは仕様です（v2004以降）。v2003では，削除できなかった最初のレコードで`ON ERR CALL`メソッドが実行され，`DELETE SELECTION`の処理は中止され，以降のレコードすべてが`LockedSet`システムセットに追加されました。現行バージョンでは，レコードが削除できなかった場合，`ON ERR CALL`メソッドは実行されず，`LockedSet`システムセットが更新されるだけで，`DELETE SELECTION`の処理は継続されます。これにはトリガで削除が防止されたレコードも含まれます。

下記の記述（「コマンドの実行は即座に停止し・・・」）はv2003の振る舞いを説明しています。

> レコードのセレクションで動作しているコマンドのフレームワーク内のトリガーによってエラーが生成されると (DELETE SELECTIONのような) ，コマンドの実行は即座に停止し，セレクションは必ずしも完全に処理されません。この場合は，デベロッパーによる適切な処理が必要となります。例えばセレクションを一時的に保存したり，トリガーの実行前にエラーを取り除くなどの処理が必要です。

<i class="fa fa-external-link" aria-hidden="true"></i> https://doc.4d.com/4Dv15/4D/15.6/Triggers.300-3817569.ja.html

現バージョンの振る舞いは下記のとおりです。

> レコードのセレクションで動作しているコマンドのフレームワーク内のトリガーによってエラーが生成されると (DELETE SELECTION，APPLY TO SELECTION，ARRAY TO SELECTIONなど)レコードは処理されず，自動的にLockedSet に登録されます(セット 参照)。コマンドは終わりまで実行が続けられ，このときエラーはキャッチされません。つまりエラーハンドリングメソッドは(あったとしても)呼び出されません。このコンテキストにおいて，エラーが生成されたかどうかを確認するためには，コマンドの呼び出しの直後にLockedSet をテストする必要があります。また，トリガでは，エラーをあとで適切に管理するためには，エラーコードを例えばコレクションなどに保存する必要があります。

<i class="fa fa-external-link" aria-hidden="true"></i> https://doc.4d.com/4Dv18R6/4D/18-R6/Triggers.300-5199080.ja.html
