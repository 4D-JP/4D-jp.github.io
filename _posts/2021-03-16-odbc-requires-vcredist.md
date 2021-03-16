---
layout: post
title: "ODBCドライバーのインストール中にエラー"
date: 2021-03-14 12:00:00
categories: 仕様
tags: windows odbc
---

18r4以降，ODBCドライバーのインストール中にシステムエラー`126`が返されるかもしれません。エラーの内容は「4DODBC.dllがみつかりません」というものです。そのような場合，Visual Studio 2019の再配布パッケージ（`vcredist`）をインストールしてみてください。
