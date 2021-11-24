---
layout: post
title: "エンティティセレクションのメンバー関数"
date: 2021-11-24 11:31:00
categories: 仕様
tags: orda class
version: 19
---

データクラスのエンティティセレクション実装を拡張し，クラス関数を追加した場合，`Null`との比較演算でクラスメソッドの有無をテストすることはできません。これは仕様です。

```
var $es : cs.myTableSelection

$es:=ds.myTable.all()
If ($es.myMethod#Null) //エラー
	$es.myMethod()
End if 
```

`entitySelection.attr`というオブジェクト記法は，指定した属性のコレクションを作成するという既定の振る舞いが定義されているため，データクラスやエンティティのように「メソッドが存在しなければ`Null`」というコーディングはできないことに留意してください。
