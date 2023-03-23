---
layout: post
title: "リストボックスのリサイズとOn Display Detail"
date: 2023-03-22 09:00:00
categories: 仕様
tags: programming userinterface listbox
---

リストボックスをリサイズしている間は*On Display Detail* イベントが継続的に発生します。これは仕様です。[ACI0102316](https://4d-jp.github.io/285/release-note-version-19/)の不完全な修正により，リサイズ中に*On Display Detail* イベントが発生しなくなりましたが，リサイズ中は継続的に行の値を再評価する必要があり，イベントが発生するというのが本来の動作です（ACI0103725）。なお，イベントが発生しないバージョンでは，下記の回避策により，リストボックス全体のリドローを強制することができます。

* リアルタイムに再描画

```4d
Case of
: (Form event code=On Resize) 
  REDRAW(OBJECT Get pointer(Object named; "ListBox")->)
End case
```

* リサイズ後に再描画

```4d
Case of
: (Form event code=On Resize)
  SET TIMER(-1)
: (Form event code=On Timer)
  REDRAW(OBJECT Get pointer(Object named; "ListBox")->)
  SET TIMER(0)
End case
```
