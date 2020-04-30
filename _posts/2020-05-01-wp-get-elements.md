---
layout: post
title: "Write Proドキュメントの要素リストを取得する"
date: 2020-05-01 12:00:00
categories: 仕様
tags: write-pro
version: 18.x
---

``WP Get elements``にWrite Proドキュメントを渡した場合，要素の``id``順にソートされたコレクションが返されます。本文に出現する順序ではない点に留意してください。これは仕様です。本文に出現する順序で要素を取得したいのであれば，Write Proドキュメント本文のレンジオブジェクトを渡してください。

```
$Paragraphs:=WP Get elements(WParea;wk type paragraph) //ID順
$Paragraphs:=WP Get elements(WP Get body(WParea);wk type paragraph) //出現順
```
