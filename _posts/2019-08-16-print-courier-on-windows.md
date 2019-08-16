---
layout: post
title: "WindowsでCourierは印刷できない"
date: 2019-08-16 12:00:00
categories: 仕様
tags: windows printing
---

[Courier](https://en.wikipedia.org/wiki/Courier_(typeface))は，定番のクロスプラットフォーム等幅フォントですが，Windows版はビットマップフォントであることに注意する必要があります。Mac版であれば，Courierフォントが設定されたフォームオブジェクトを印刷することができますが，Windows版は，印刷にDirect2Dが使用されているため，システムフォントが代わりに出力されることになります。これは仕様です。
