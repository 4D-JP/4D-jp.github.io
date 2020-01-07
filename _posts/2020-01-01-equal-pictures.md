---
layout: post
title: "ベクトル画像のピクチャサイズ"
date: 2020-01-01 12:00:00
categories: 仕様 
tags: 18.x picture mac
version: 18.x
---

[``Equal pictures``](https://doc.4d.com/4Dv17/4D/17.3/Equal-pictures.301-4621229.ja.html)でピクチャを比較した場合，v17では一致と判定された画像がv18では不一致と判定されることがあります。

ピクチャに対して[``PICTURE PROPERTIES``](https://doc.4d.com/4Dv17/4D/17.3/PICTURE-PROPERTIES.301-4621222.ja.html)を実行した場合，PDFやSVGのようなベクトル画像であれば，v18以降，実数型でサイズを求めることができます。

A4縦のPDFは，約``594.35``×``841.99``ポイントなので，v17で作成したビットマップをv18でレンダリングしたピクチャと比較した場合，わずかにマスク画像が出力されることになります。これは仕様です。
