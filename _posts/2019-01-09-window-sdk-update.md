---
layout: post
title: "4D ODBC DriverをWindows 7で使用するにはKB2999226が必要"
date: 2019-01-09 12:43:54
categories: セットアップ
tags: 17r3 windows
version: 17r3
---

17r3（32および64ビット版）の4D ODBC DriverをWindows 7 SP1にインストールした後，データソース名を登録しようとすると，エラー``126``が返されることがあります。これは，4D ODBC Driverが新しいWindows SDKでビルドされているためです。

Windows 7をアップデート（``KB2999226``）することにより，問題を解消することができます。Windows 10，あるいは17r2以前のバージョンでは問題ありません。
