---
layout: fix
title: "var宣言のシンタックス"
date: 2023-10-11 08:00:00
categories: 仕様
tags: programming 19.x
---

変数宣言の`var`シンタックスにおいて型指定は任意です。型指定を省略した場合は`Variant`となります。

```4d
var $myText : Text  //テキスト型
var myDate1; myDate2 : Date  //日付型
var $myFile : 4D.File  //オブジェクト型4D.Fileクラス
var $myVar //バリアント型
```
