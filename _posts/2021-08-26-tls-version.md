---
layout: post
title: "TLSのバージョン"
date: 2021-08-26 12:00:00
categories: 注意点
tags: 18.0 http
version: 18
---

v17以降，ネットワークレイヤーのセキュリティが強化され，TLSの最低バージョンが`TLS_1.2`に引き上がられました。`TLS_1.2`に対応していないサーバーに対して`HTTP Request`を使用した場合，エラー`30`が返されます。これは仕様です。必要に応じ，[`SET DATABASE PARAMETER`](https://doc.4d.com/4Dv19/4D/19/SET-DATABASE-PARAMETER.301-5392530.ja.html)でTLSのバージョンを変更してください。

v18以降，4Dが使用しているOpenSSLのバージョンは`1.1.1`にアップデートされました。必要に応じ，TLSのバージョンを`1.3`に設定することもできます。v18には`TLSv1_3`という定数がないため，値の`4`を渡してください。
