---
layout: post
title: "PROCESS 4D TAGSが入力値をそのまま返す条件"
date: 2020-06-05 12:00:00
categories: 仕様
tags: programming
version: 18.x
---

[``PROCESS 4D TAGS``](https://doc.4d.com/4Dv18/4D/18/PROCESS-4D-TAGS.301-4504927.ja.html)は，テンプレートを評価した結果が空の文字列になった場合，テンプレートの出力値，つまり空の文字列ではなく，テンプレートをそのまま返します。これは仕様です。ドキュメントは入力値が「4Dタグを含まない場合」にテンプレートがそのまま返される，と述べられていますが，「タグが何も出力しない場合」も入力値がそのまま返される条件となります。

例：

```4d

$in:="<!--#4dif false-->abc<!--#4dendif-->"
PROCESS 4D TAGS($in;$out)
```

``$out``には``$in``の内容がそのまま返されます。

```4d
$in:="<!--#4dif false-->abc<!--#4dendif-->\r"
PROCESS 4D TAGS($in;$out)
```

``$out``には``"\r"``が返されます。
