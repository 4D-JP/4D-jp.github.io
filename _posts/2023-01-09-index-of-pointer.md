---
layout: post
title: "ポインターのサーチ"
date: 2023-01-09 12:00:00
categories: 仕様
tags: collection
---

コレクション型はポインターをサポートしていますが，[`Find in array`](https://doc.4d.com/4Dv19/4D/19.5/Find-in-array.301-6137694.ja.html)とは違い，`collection.indexOf()`はポインターのサーチをサポートしていないことに留意が必要です。位置をサーチできるのは下記のデータ型です。

* テキスト
* 数値
* ブール
* 日付
* Null
* オブジェクト参照
* コレクション参照
