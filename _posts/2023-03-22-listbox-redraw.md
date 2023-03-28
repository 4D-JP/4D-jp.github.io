---
layout: post
title: "リストボックスのリサイズとOn Display Detail"
date: 2023-03-22 09:00:00
categories: 仕様
tags: programming userinterface listbox
---

リストボックスを垂直方向にリサイズした場合，表示される行の増加に伴い，*On Display Detail* イベントが発生します[ACI0103758](https://4d-jp.github.io/2023/10/release-note-version-19r8/)。これは仕様です。[ACI0102316](https://4d-jp.github.io/285/release-note-version-19/)の不完全な修正により，リサイズ中にすべての行で*On Display Detail* イベントが発生するようになりましたが，出現した行でイベントが発生するというのが本来の動作です（[ACI0103725](https://4d-jp.github.io/2023/10/release-note-version-19r8/)）。
