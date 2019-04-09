---
layout: post
title: "Write Proテーブルのボーダーを設定する"
date: 2019-03-28 11:15:00
categories: 注意点 
tags: writepro
version: 17.x
---

Write Pro文書・画像・セクション・段落のボーダー（罫線）は，コンテキストメニュー，または``WP SET ATTRIBUTES``と``wk border style`` ``wk border width``の組み合わせで設定することができますが，テーブル全体や特定の行列のボーダーは設定することができません。これは仕様です。

ボーダーは，テーブル・行・列ではなく，セルの属性です。テーブル全体や特定の行列のボーダーする場合，下記のようにセルの集合を取得した上で``WP SET ATTRIBUTES``を使用します。

```
$table:=WP Get element by ID($wp;"t1")
$cells:=WP Table get cells($table;1;1;MAXLONG;MAXLONG)
WP SET ATTRIBUTES($cells;wk border style;wk none)
```

<i class="fa fa-external-link" aria-hidden="true"></i> [WP Table get cells](https://doc.4d.com/4Dv17/4D/17/WP-Table-get-cells.301-3726294.ja.html)

<i class="fa fa-external-link" aria-hidden="true"></i> [WP Table get columns](https://doc.4d.com/4Dv17/4D/17/WP-Table-get-columns.301-3726293.ja.html)

<i class="fa fa-external-link" aria-hidden="true"></i> [WP Table get rows](https://doc.4d.com/4Dv17/4D/17/WP-Table-get-rows.301-3726292.ja.html)

<i class="fa fa-external-link" aria-hidden="true"></i> [4D Write Pro属性](https://doc.4d.com/4Dv17/4D/17/4D-Write-Pro-Attributes.300-3726323.ja.html)
