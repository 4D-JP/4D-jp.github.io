---
layout: fix
title: "#DECLARE構文でパラメーターを宣言"
date: 2024-02-28 08:00:00
categories: 仕様
tags: 20r4 programming
---

20r4では，`#DECLARE`構文で宣言したパラメーターを`Compiler_`メソッドで宣言する必要がなくなりました。つまり，`#DECLARE`構文でパラメーターを宣言していれば

> パラメーター$1がメソッド（Compiler...）の中で明確に定義されていません。

というシンタックスエラーが返されないようになりました。

<i class="fa fa-external-link" aria-hidden="true"></i> [合理化されたメソッドの引数宣言](https://blog.4d.com/ja/streamlined-method-parameter-declarations/)