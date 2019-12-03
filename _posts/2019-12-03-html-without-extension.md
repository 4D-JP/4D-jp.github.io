---
layout: post
title: "HTMLファイルの拡張子"
date: 2019-12-03 10:00:00
categories: 仕様
tags: webarea
---

64ビット版の統合Webエリアは，レンダリングエンジンにCEF（Chrome Embedded Framework）を採用しているため，32ビット版（WebKit）とは振る舞いが違っていることがあります。一例として，``.license4D``ファイルは，内容的にはHTMLですが，特殊な拡張子が付けれらたファイルなので，ソースコードがそのまま画面に表示されます。これは仕様です。拡張子が付いていないHTMLファイルも，同様にHTMLコードがそのまま表示されます。
