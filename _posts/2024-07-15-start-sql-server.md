---
layout: fix
title: "SQLサーバーの起動"
date: 2024-07-15 08:00:00
categories: 仕様
tags: sql
---

4D Serverを起動すると「開始時にSQLサーバーを起動する」の設定に関係なく，自動的にSQLサーバーも起動します。内部SQLリクエストを処理するためです。

ドキュメントには明記されているように，SQLサーバーの「開始/停止」設定は外部からのSQLリクエストに影響します。

> 注: SQLサーバの停止は，4D SQLエンジンの内部動作に影響しません。SQLエンジンは内部クエリに対し常に有効です。

<i class="fa fa-external-link" aria-hidden="true"></i> [4D SQLサーバの設定](https://doc.4d.com/4Dv20R5/4D/20-R5/Configuration-of-4D-SQL-Server.300-6857187.ja.html)