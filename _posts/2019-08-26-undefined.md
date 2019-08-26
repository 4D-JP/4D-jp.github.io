---
layout: post
title: "Undefinedでエラー"
date: 2019-08-26 00:00:00
categories: 仕様
tags: migration
---

16r4以降，``Undefined``は「参照」ではなく「値」を受け取るように改定されました。下記のようなコードをコンパイルモードで実行した場合，「ポインターの使用法が正しくないか，不明な変数へのポインターです」というエラーが返されます。

```
C_POINTER($W)
$W:=Get pointer("toto")
If (Undefined($W->))
	ALERT("undefined")
End if 
```

未定義のプロセス変数に対するポインターを検出したいのであれば，``Undefined($W->))``ではなく，``Type($W->)=Is undefined``のようなコードを記述することができます。
