---
layout: fix
title: "自動リレーションの変更はサーバー側と同期しない"
date: 2024-01-16 08:00:00
categories: 仕様
tags: database
---

[`SET AUTOMATIC RELATIONS`](https://doc.4d.com/4Dv20R3/4D/20-R3/SET-AUTOMATIC-RELATIONS.301-6532368.ja.html)のスコープは「カレントプロセス」です。クライアント側でリレーション設定を変更した場合，その絵設定は「サーバー上で実行」メソッドを実行するサーバー側の同期プロセスには継承されません。これは仕様です。

> （このコマンド）**カレントプロセス**で，データベース全体のマニュアルリレートを一時的に自動リレートに変更します。

サーバー側の同期プロセスに継承され，「サーバー上で実行」メソッドやトリガで暗黙的に使用できるのは，[セットと命名セレクション](https://doc.4d.com/4Dv20R3/4D/20-R3/4D-Server-Sets-and-Named-Selections.300-6612802.ja.html)，[ロックされたレコードやトランザクションの状態](https://doc.4d.com/4Dv20R3/4D/20-R3/Triggers.300-6531551.ja.html)です。その他の情報（カレントセレクションなど）は，クライアント側とサーバー側で別々に管理されている点に留意してください。

* [命名セレクション](https://doc.4d.com/4Dv20R3/4D/20-R3/Named-Selections.300-6531964.ja.html)
* [セット](https://doc.4d.com/4Dv20R3/4D/20-R3/Sets.300-6531764.ja.html)

