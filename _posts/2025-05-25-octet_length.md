---
layout: fix
title: "OCTET_LENGTH"
date: 2025-05-22 08:00:00
categories: 仕様
version: 20r8
tags: sql programming
---

SQL関数の[`OCTET_LENGTH`](https://doc.4d.com/4Dv20/4D/20/OCTET-LENGTH.300-6342086.ja.html)は，暗黙的に値を文字列に変換してからバイト数を返します（*MySQL* と同じ）。倍長整数の`OCTET_LENGTH`は`4`ではなく，符合を含む整数値の桁数です。オブジェクト型の`OCTET_LENGTH`を求める場合，明示的に文字列に変換する必要があります。これは仕様です。

```sql
SELECT OCTET_LENGTH(CAST(MyField as VARCHAR)) FROM MyTable INTO :$length;
```

<i class="fa fa-external-link" aria-hidden="true"></i> [SQL Engineで4Dオブジェクトのフィールドを読み込む](https://blog.4d.com/ja/read-4d-object-fields-with-sql-engine/)