---
layout: post
title: "文字列の比較"
date: 2021-08-23 00:46:00
categories: 仕様 
tags: 19.x unicode
version: 19.x
---

v19では，[Compare strings](https://doc.4d.com/4Dv19/4D/19/Compare-strings.301-5392237.ja.html)という関数が追加されています。既存の[Position](https://doc.4d.com/4Dv19/4D/19/Position.301-5392252.ja.html)も拡張されました。両コマンドには[Stringsデーマの定数](https://doc.4d.com/4Dv19/4D/19/Strings.302-5393273.ja.html)を組み合わせて渡すことができます。ただし，どんな組み合わせでも良いわけではありません。また，Compare stringsとPositionとでは，定数の有効な組み合わせが異なります。
