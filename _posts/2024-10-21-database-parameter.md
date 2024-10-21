---
layout: fix
title: "データベースパラメーターとプリエンプティブモード"
date: 2024-10-20 08:00:00
categories: 仕様
tags: preemptive programming
---

標準コマンドは，スレッドセーフ（プリエンプティブモードで実行できる）あるいはアンセーフ（できない）のどちらかなので，スレッドセーフではないコマンドをプリエンプティブプロセスから呼び出そうとしているようなメソッドは，コンパイル時にエラーが返されます。ただし，`Get database parameter`と`SET DATABASE PARAMETER`は例外です。これらのコマンドはスレッドセーフですが，実際にプリエンプティブプロセスから呼び出せるかどうかはセレクター値に左右されます。スレッドセーフなセレクターは以下のとおりです。挙げられていないセレクターをプリエンプティブプロセスで指定した場合，ランタイムエラー「スレッドセーフではないコマンドをプリエンプティブプロセスから呼び出せません。」が返されます。

|値|定数|get|set|
|:-:|:-:|:-:|:-:|
|28|4D Server log recording|✅|✅|
|34|Debug log recording|✅|✅|
|65|(undocumented)|✅|✅|
|79|Diagnostic log recording|✅|✅|
|80|Log command list|✅||
|86|Diagnostic log level|✅|✅|
|90|Circular log limitation|✅|✅|
|95|Cache flush periodicity|✅|✅|
|108|User param value|✅||
|110|SMTP Log|✅|✅|
|111|Current process debug log recording|✅|✅|
|112|Is current database a project|✅|✅|
|113|Is host database a project|✅|✅|
|116|POP3 Log|✅|✅|
|119|IMAP Log|✅|✅|
|121|Pause logging|✅|✅|

