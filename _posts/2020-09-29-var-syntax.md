---
layout: post
title: "暗黙的なパラメーター宣言"
date: 2020-09-29 12:00:00
categories: 仕様
tags: 18.x programming 
---

パラメーター型を宣言する新しい``var``シンタックスでは，暗黙的に任意のパラメーターを宣言することができません。つまり，``C_VARIANT($0;${1})"``のようなことができません。これは仕様です。パラメーター数が事前に決まっていない場合，コレクション側を使用することを検討してください。

<i class="fa fa-external-link" aria-hidden="true"></i> [プロジェクトメソッド](https://doc.4d.com/4Dv18R3/4D/18-R3/Project-Methods.300-4901178.ja.html)
