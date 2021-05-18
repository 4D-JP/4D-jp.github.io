---
layout: post
title: "SET WINDOW RECTのシンタックス"
date: 2021-05-18 12:00:00
categories: 仕様
tags: mac userinterface
version: 19.x
---

[`SET WINDOW RECT`](https://doc.4d.com/4Dv18/4D/18.4/SET-WINDOW-RECT.301-5233349.ja.html)のパラメーターは，`left;top;right;bottom` です。`x;y;width;height` ではない点に留意してください。Mac版のv18r6では，`left > right` または `top > bottom` の場合，`left` および `top` の位置にウィンドウが表示されました。v19ではこの問題が是正されています。`right` `bottom` 座標以外の値を指定しているコードは，アップグレード後に振る舞いが変わるかもしれません。これは仕様です。
