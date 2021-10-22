---
layout: post
title: "ODBCでOracleに接続できない"
date: 2021-10-22 11:31:00
categories: 仕様
tags: oracle odbc mac
version: 17
---

Mac版の[Oracle Instant Client ODBC](https://www.oracle.com/database/technologies/releasenote-odbc-ic.html)と[unixODBC](http://www.unixodbc.org/)で登録したOracleのDSNには，4DのODBCで接続することができません。これは仕様です。4Dおよび4D ServerはunixODBCではなく，[iODBC](http://www.iodbc.org/)を使用していますが，Oracle ODBC DriverはiODBCのサポートを中止したようです。
