---
layout: post
title: "非表示オブジェクトを移動すると増殖する"
date: 2020-01-22 08:00:00
categories: 仕様
tags: 17.x windows userinterface
---

Windows版でフォームオブジェクトを同一メソッド内で非表示に設定し，移動してから非表示を解除した場合，画面上ではオブジェクトが以前の位置と新しい位置の両方に表示されます。これはAPIの特性に由来する振る舞いであり，現状では仕様です。オブジェクトの「増殖」を防止するためには，下記のようなコードを避けてくだだい。

```
OBJECT SET VISIBLE (*;"object";False)
OBJECT SET COORDINATES*;"object";$left;$top;$right;$bottom)
OBJECT SET VISIBLE (*;"object";True)
