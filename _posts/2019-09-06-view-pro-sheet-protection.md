---
layout: post
title: "シートの保護とセルのロック"
date: 2019-09-06 12:00:00
categories: 注意点
version: 17r5
tags: viewpro migration
---

一部のセルがロックされた4D ViewスプレッドシートをView Proに変換した場合，シートはデフォルトで「保護」された設定になります。これは仕様です。

4D Viewにシートを「保護」するという概念はなく，個別にセルがロックできるようになっています。View Pro（SpreadJS）でユーザーに特定のセルだけの編集を許可する場合，シートを保護してから，ユーザーに編集を許可するセルだけをロック解除します。

<i class="fa fa-external-link" aria-hidden="true"></i> https://docs.grapecity.com/help/spread-js-9/celllock.html

一部のセルがロックされた4D Viewスプレッドシートを変換した場合，シート全体が保護された上で，特定のセルだけがロックされるようになっています。その他のセルはデフォルトでアンロックされています。これにより，ロックされたセルの設定は継承されますが，１点，問題があります。デフォルトですべてのセルがアンロックされているため，ユーザーに編集を許可するセルを除き，シート全体を保護することができない，という問題です。

SpreadJSのシステム，つまり，特定のセルをロックするのではなく，特定のセルを除いて入力を禁止する方式に移行したいのであれば，デフォルトのスタイルシートから``"locked":false``の指定を取り除ことができます。

```js
$defaultStyle:=$spreadDocument.spreadJS.namedStyle[1]
OB REMOVE($defaultStyle;"locked")
```
