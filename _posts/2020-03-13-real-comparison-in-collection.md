---
layout: post
title: "collection.equalのイプシロン値"
date: 2020-03-13 08:00:00
categories: 仕様
tags: 17.x 18.x collection
---

コレクションメソッドの``collection.equal()``は，オプションの``ck diacritical``が渡されなかった場合，``1e10-6``というイプシロン値を内部的に使用します。この値は，``SET REAL COMPARISON LEVEL``で設定したイプシロン値には影響されません（非ドキュメント）。実数型が格納されたコレクション型の比較をする場合，オプションの``ck diacritical``は渡さないようにしてください。

例：

```
$a:=New collection(1/Log(10))  //0.43429448190325...
$b:=New collection(0.4342944819033)

$test:=$a[0]=$b[0]  //true
$test:=$a.equal($b)  //true
$test:=$a.equal($b;ck diacritical)  //false
```
