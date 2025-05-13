---
layout: fix
title: "クライアント接続数"
date: 2025-05-12 08:00:00
categories: 仕様
version: 20r8
tags: clientserver programming
---

20r8以降，[`GET SERIAL INFORMATION`](https://doc.4d.com/4Dv20/4D/20.6/GET-SERIAL-INFORMATION.301-7487077.ja.html)は廃止予定（`_O_`）コマンドに類別されています。コマンドから返されるシリアル情報は，4Dのライセンスに固有の識別子なので，4Dのライセンスに紐づいたプラグインやコンポーネントのライセンスを発行するために利用できます。

より一般的な使い道として，サーバーに接続しているクライアント数や接続数の上限をコマンドから取得することができます。コマンドは引き続き機能しますが，今後は後継の[License info](https://developer.4d.com/docs/ja/commands/license-info)を使用することが勧められています。

旧コマンドはクライアント側でも情報を返しますが，スレッドセーフではありません。新コマンドはサーバー側で実行する必要がありますが，スレッドセーフです。また，旧コマンドよりも詳細な情報が返されます。

新旧コマンドの対比については，下記の表を参考にしてください。

|_O_GET SERIAL INFORMATION|License info|
|:-:|:-:|
|key|`info.key`|
|user|`info.userName`|
|company|`info.companyName`|
|connected|`1` (4D Local mode)<br />`info.products.query("name == :1"; "4D Client").first().usedCount`|
|maxUser|`1` (4D Local mode)<br />`products.query("name == :1"; "4D Client").first().allowedCount`|

`product`に返されるライセンス名とシリアル情報は下記のとおりです。サーバー（4D Server）のユーザー数は，クライアント数ではなく，サーバー本体の情報（常に`1`）です。

|name| id |
|:-:|:-:|
|4D|808464433|
|4D Volume Desktop|808464437|
|4D Server|808464440|
|4D Client|808464441|
|Compiler|808464692|
|Qodly Studio|808465458|
|Internal ODBC Commands|808465720|
|4D Write Pro|808464697|
|4D View Pro|808465207|
|4D for OCI|808465208|
|4D ODBC Pro|808464946|
|4D SQL Server|808464949|
|4D SQL Server - Local|808530485|
|4D SQL Server - 1 Connection|825242165|
|4D Web Application|808464945|
|4D Web Application for 4D Client|808465209|
|4D Web Application - 1 Connection|825242161|
|4D Web Services|808465464|
|4D Web Services for 4D Client|808465465|
|4D Web Services - 1 Connection|825242680|
|4D REST Only|808464439|
|4D REST - Test (3 Clients)|808465719|

シリアル情報よりもクライアント接続数に関心がある場合，ユーザーの種別（RESTまたは4D Client）やセッション情報，経過時間などを返す[License usage](https://developer.4d.com/docs/ja/commands/license-usage)のほうが便利です。こちらもサーバー側で実行する必要がある点に留意してください。