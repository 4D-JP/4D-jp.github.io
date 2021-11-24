---
layout: post
title: "WP NewでインポートできないHTML"
date: 2021-11-24 11:31:00
categories: 仕様
tags: writepro
version: 19
---

Write Proの`WP New`または`WP EXPORT VARIABLE`コマンドは，どんなHTMLでもインポートできるわけではありません。Write Proでインポートできるのは，4DがサポートしているXHTMLのサブセットに限られている点が4D Writeプラグインの`WR OPEN DOCUMENT`とは違います。ただし，シンプルなHTMLスニペットであれば，`<body>`タグで囲うことにより，インポートできるかもしれません。これは仕様です。

データクラスのエンティティセレクション実装を拡張し，クラス関数を追加した場合，`Null`との比較演算でクラスメソッドの有無をテストすることはできません。これは仕様です。
