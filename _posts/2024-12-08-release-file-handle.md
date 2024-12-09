---
layout: fix
title: "ファイルハンドルの解放"
date: 2024-12-01 08:00:00
categories: 仕様
tags: programming filehandle
---

Mac/Linuxでは，開いているファイルをそのまま削除したり移動したりすることができますが，Windowsでは，まずファイルを閉じなければなりません。`4D.File`オブジェクトに対する[`4D.FileHandle`](https://developer.4d.com/docs/ja/API/FileHandleClass)をインスタンス化している場合，`4D.FileHandle`の参照が代入されたローカル変数に`Null`を代入する必要があります。`Null`を代入してもファイルハンドルが，すぐには解放されず，メソッドを終了するまでファイルを動かせないようであれば，別のローカル変数が同じ`4D.FileHandle`を参照していることが原因です。

```4d
$f:=$file.open()
...
$f2:=$f // 参照を別のローカル変数に代入
...
$f:=Null // この時点でファイルハンドルは解放されない。$f2にNullを代入するかメソッドを終了する必要がある
```