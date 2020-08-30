---
layout: post
title: "ポインターを返すコマンドの逆参照"
date: 2020-08-31 12:00:00
categories: 仕様
tags: 18.x programming 
---

コンパイラー設計上の制約により，下記のようなコードはコンパイルモードで動作しません。

```
GET LISTBOX CELL POSITION(Self->;col;row;var)
```

問題を回避するためには，ポインターの逆参照をローカル変数に代入した上で，パラメーターとして渡すことができます。

```
$ptr:=Self
GET LISTBOX CELL POSITION($ptr->;col;row;var)
```

``Self``だけでなく，ポインターを返すコマンドの逆参照を直接パラメーターとして渡した場合，正しいコードがコンパイルされません。これは仕様です。
