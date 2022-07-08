---
layout: post
title: "Oracleデータベースにアクセスするには"
date: 2022-07-07 08:00:00
categories: 仕様
tags: 18.x odbc sql
---

ODBCドライバー経由でOracleデータベースにアクセスする場合，文字セットの設定をUnicodeにする必要があります。

環境変数`NLS_LANG`は`<LANG>_<SUBLANG>.AL32UTF8`というフォーマットで設定することができます。区切り文字がアンダースコアとピリオドであることに留意してください。デフォルトは`WE8MSWIN1252`のように特定の文字セットとなっています。多言語のデータを扱うためには，`SUBLANG`に加えて`AL32UTF8`も設定する必要があるかもしれません。たとえば，下記のように設定することができます。

```
NLS_LANG=JAPANESE_JAPAN.AL32UTF8
```
