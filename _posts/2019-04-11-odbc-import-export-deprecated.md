---
layout: post
title: "64ビット版はODBCソースの読み書きを非サポート"
date: 2019-04-10 11:41:00
categories: 注意点 
tags: mac 17r5 odbc
version: 17r5
---

ユーザーモードのメニュー項目「ファイル > 読み込み > ODBCソースから読み込み」および「ファイル > 書き出し > データをODBCソースに書き出し」は，64ビット版で``disabled``状態となっています。``IMPORT ODBC`` ``EXPORT ODBC`` も64ビット版では使用できません。これは仕様です。ODBC経由でデータの読み書きをするのであれば，標準のSQLコマンドを使用してください。

<i class="fa fa-external-link" aria-hidden="true"></i> [64-bit版アプリケーション特定の機能 ](https://doc.4d.com/4Dv17R4/4D/17-R4/Specific-features-of-64-bit-applications.300-4085812.ja.html)

**注記**: 32ビット版アプリケーションは，17r4が最後のリリースとなります。17r5以降，4Dおよび4D Serverは64ビット版アプリケーションのみのリリースとなり，32ビット版は提供されません。
