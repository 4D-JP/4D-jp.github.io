---
layout: post
title: "WP NewでインポートできないHTML"
date: 2021-11-24 11:31:00
categories: 仕様
tags: writepro
version: 19
---

Write Proの`WP New`または`WP Import document`コマンドは，どんなHTMLでもインポートできるわけではありません。Write Proでインポートできるのは，4DがサポートしているXHTMLのサブセットに限られている点が4D Writeプラグインの`WR OPEN DOCUMENT`とは違います。ただし，シンプルなHTMLスニペットであれば，`<body>`タグで囲うことにより，インポートできるかもしれません。これは仕様です。
