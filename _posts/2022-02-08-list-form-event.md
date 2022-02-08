---
layout: post
title: "リストフォームの垂直スクロールで発生するイベントは？"
date: 2022-02-09 00:00:00
categories: 仕様
tags: userinterface 
version: 19
---

v17以降，リストフォームの垂直スクロールバーをクリックした場合，Windowsでは*On Header*および*On Display Detail*イベントが`1`回ずつ発生しますが，macOSではそれぞれ`2`回ずつ発生します。v16ではプラットフォームによる違いはありませんでした。

スクロールバーを操作したときに発生するフォームイベントの種類や回数は，プラットフォームAPIのリドローに左右される部分があり，4Dの仕様としては明記されていません。Mac版のリストフォームは，v17以降，[Quartz Compositor](https://en.wikipedia.org/wiki/Quartz_Compositor)のサポートが強化されており，macOS特有のオーバーレイシステムが働くようになったため，再描画で発生するフォームイベントの回数がWindows版よりも多いことがあります。
