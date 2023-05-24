---
layout: fix
title: "リクエストログに記録される情報"
date: 2023-05-23 08:00:00
categories: 仕様
tags: debugging server
---

特定のデータベース処理がボトルネットとなっているように思われる場合，クライアント側の[リクエストログ](https://doc.4d.com/4Dv19/4D/19.6/SET-DATABASE-PARAMETER.301-6270038.ja.html)を活用できるかもしれません。このログファイルは，クライアントからサーバーに送信されたリクエスト情報が記録されています。

```4d
SET DATABASE PARAMETER(Client log recording;1)
```

リクエストログには，さまざまな事例に基づき，パフォーマンスと関係のあることが実証されている情報が記録されています。

v19の時点でリクエストログに含まれているのは下記の情報です。

|フィールド名|詳細|
|:-|:-|
|sequence_number|オペレーション番号|
|time|タイムスタンプ|
|systemID|システム識別子|
|component|モジュール識別子|
|process_info_index|プロセス識別子|
|request|リクエスト識別子|
|bytes_in|受信バイト数|
|bytes_out|送信バイト数|
|duration|オペレーション全体に要した時間 `ms`|
|server_duration|サーバーがリクエストの処理に要した時間 `μs`|
|write_duration|クライアントがリクエストの送信に要した時間 `μs`|
|task_kind|プリエンプティブスレッドかどうか|
|rtt|ネットワーク通信そのものに要した時間 `μs`|

* リクエスト識別子のニーモニックは[GitHub](https://raw.githubusercontent.com/4D/request-log-definitions/master/RequestIDs.txt)で公開されています。v20では`14000`番台にRESTリクエストが追加されました。

* リクエストログのファイルサイズは，クライアント/サーバー間のネットワークトラフィックが妥当な範囲に収まっているかどうかのバロメーターとみなすことができます。

* わずかなバイト数のリクエストが大量に送受信されている場合，通信の回数をもっと抑えるよう，プログラムを見直すことが必要かもしれません。

* リクエストの処理に要した時間と通信そのものに要した時間を突き合わせることにより，通信設備やハードウェアのスペックが充分かどうかを見定めることができます。

* コオペラティブスレッドのリクエストが相当な割合を占めている場合，プリエンプティブスレッドをもっと活用することでパフォーマンスを向上できる見込みがあります。

<i class="fa fa-external-link" aria-hidden="true"></i> [ログファイルの詳細](https://developer.4d.com/docs/ja/Debugging/debugLogFiles/)

<i class="fa fa-external-link" aria-hidden="true"></i> [4D/request-log-definitions](https://github.com/4d/request-log-definitions)

リクエストログはサーバー側で記録することもできます。

```4d
SET DATABASE PARAMETER(4D Server log recording;1)
```

v19r5 Hotfix 2では，サーバー側のリクエストログがテーブルに関わるものだった場合，`extra`項目にテーブル名が記録されるようになりました。

|-|-|-|component|-|request|bytes_out|bytes_in|-|-|-|rtt|extra|
|-|-|-|-|-|-|-|-|-|-|-|-|-|
|60|-|-|'srv4'|5|71|11|4|1127|34|c|1000||
|61|-|-|'INFO'|5|TTF/i|0||||||
|62|-|-|'dbmg'|5|11041|362|62|1132|65|c|1000|Table_1|

上記の例では，`[Table_1]`のトリガがコオペレティブモードで実行されていることが確認できます。

リクエストログは，クライアント/サーバーのネットワーク通信に焦点をあてたログファイルです。4Dには，他にもさまざまなデバッグツールが用意されています。

* [DataStore.startRequestLog()](https://developer.4d.com/docs/ja/API/DataStoreClass/#startrequestlog)
* [START MONITORING ACTIVITY](https://doc.4d.com/4Dv19/4D/19.6/START-MONITORING-ACTIVITY.301-6270447.ja.html)
* [GET ACTIVITY SNAPSHOT](https://doc.4d.com/4Dv19/4D/19.6/GET-ACTIVITY-SNAPSHOT.301-6270439.ja.html)
* [Get database measures](https://doc.4d.com/4Dv19/4D/19.6/Get-database-measures.301-6270039.ja.html)
* [Get process activity](https://doc.4d.com/4Dv19/4D/19.6/Get-process-activity.301-6270070.ja.html)
* [Cache info](https://doc.4d.com/4Dv19/4D/19.6/Cache-info.301-6269604.ja.html)
* [Diagnostic log recording](https://doc.4d.com/4Dv19/4D/19.6/SET-DATABASE-PARAMETER.301-6270038.ja.html)
* [Debug log recording](https://doc.4d.com/4Dv19/4D/19.6/SET-DATABASE-PARAMETER.301-6270038.ja.html)
