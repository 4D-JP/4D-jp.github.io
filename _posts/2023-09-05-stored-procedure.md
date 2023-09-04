---
layout: fix
title: "ストアドプロシージャで使用できないコマンド"
date: 2023-09-04 08:00:00
categories: 仕様
tags: printing 19.x 20.x
---

ドキュメントには「サーバー上で禁止されるコマンド」および「サーバー上で使用すべきでないコマンド」が列挙されています。過去バージョンのドキュメントでは，下記の印刷関係コマンドも「サーバー上で禁止されるコマンド」として挙げられていました。現行バージョンにそのような制約はありません。見直されたリストはv20のドキュメントに掲載されています。

* ACCUMULATE
* BREAK LEVEL
* Level
* PAGE BREAK
* _o_PAGE SETUP
* PRINT SETTINGS
* Printing page

<i class="fa fa-external-link" aria-hidden="true"></i> [ストアドプロシージャ v20](https://doc.4d.com/4Dv20/4D/20/Stored-Procedures.300-6330553.ja.html)