---
layout: post
title: "スカラーとアグリゲートは混在できない"
date: 2023-03-08 09:00:00
categories: 仕様
tags: development sql
---

4DのSQLでは，スカラー列（フィールドまたは変数）と`AVG`などのアグリゲート関数を`SELECT`文に混ぜることができません。下記のSQLステートメントは，MySQLでは問題なく処理できますが，4Dでは`1704`エラーになります。これは仕様です。

```sql
SELECT [numField], Count([numField]) FROM [Table_1]
```
