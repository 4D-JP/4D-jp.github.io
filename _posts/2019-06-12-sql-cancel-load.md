---
layout: post
title: "SQL EXECUTEを続けて実行する"
date: 2019-06-12 10:25:00
categories: 仕様
tags: odbc
---

外部ODBCデータベースに対し，``SQL LOGIN``でログインした場合，``Begin SQL`` ``End SQL``ブロックであれば，１回のセッション内で何度でも使用することができますが，``SQL EXECUTE``のほうは，２回目のコールでエラー``1412``（SQL文がすでに開かれている）が返されます。これは仕様です。

ODBCデータソースに対して``SQL EXECUTE``を続けて実行するのであれば，まず<i class="fa fa-external-link" aria-hidden="true"></i> [``SQL CANCEL LOAD``](https://docs.4d.com/4Dv17/4D/17.2/SQL-CANCEL-LOAD.301-4387293.ja.html)で前のSQLステートメントを閉じる必要があります。
