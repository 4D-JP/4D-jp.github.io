---
layout: post
title: "OBコマンドとオブジェクト記法"
date: 2019-03-09 07:33:00
categories: 仕様
tags: 17.x ORDA 
---

オブジェクト記法およびコレクション型がランゲージに追加されるまで，オブジェクト型の読み書きには``OB``で名前が始まるコマンドが使用されていました。``OB``コマンドは廃止予定ではありませんが，オブジェクト記法（ドット記法とブラケット記法）をサポートしていないことに留意する必要があります。たとえば，下記の例で``[Person]family``はオブジェクト型のフィールドですが，コードを実行するとエラーが返されます。これは仕様です。

```
OB SET ARRAY([Person]family.children[0];"ID";$IDs)
```
