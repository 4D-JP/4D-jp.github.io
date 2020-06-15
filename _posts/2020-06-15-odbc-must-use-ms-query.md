---
layout: post
title: "ODBC接続にはMS Queryを使用する"
date: 2020-06-15 12:00:00
categories: 仕様
tags: odbc connectivity network sql
version: 17.x
---

Excel 2016の「データ > 取得 > ODBCから > 他のソースから > ODBCから」を選択した時に表示される**ナビゲーター**，あるいは以前のバージョンに付属している**ODBCデータ接続ウィザード**は，``2``個以上のテーブルが存在する場合，データソース（4DのSQLサーバー）に対し，SQLのカタログをリクエストするようになっています。しかし，4DのODBCドライバーにはこの処理が実装されていません。これは仕様です。

4DのSQLサーバーに対し，Microsoft社製品（たとえばExcel）からODBCで接続する場合，**ナビゲーター**や**ODBCデータ接続ウィザード**ではなく，**MS Query**を使用してください。
