---
layout: post
title: "２次元配列の要素をクリアするには"
date: 2020-05-20 12:00:00
categories: 仕様
tags: programming
version: 18.x
---

``CLEAR VARIABLE``は，**変数**または**配列**をクリアするコマンドです。インタープリターモードでは，２次元配列の要素もクリアできるかもしれませんが，これは従来の振る舞いを変えないための特別な措置であり，コマンドに２次元配列の要素を渡すことは想定されていない点に留意してください。

コンパイルモードで配列の要素を``CLEAR VARIABLE``でクリアすることはできません。２次元配列の要素は，変数（配列）とは違います。``DELETE FROM ARRAY``を使用してください。
