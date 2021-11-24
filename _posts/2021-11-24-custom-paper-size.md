---
layout: post
title: "PRINT OPTION VALUESとカスタム用紙"
date: 2021-11-24 11:31:00
categories: 仕様
tags: printing mac
version: 19
---

AppleのAPIは，[カスタム用紙を除く用紙リスト](https://developer.apple.com/documentation/applicationservices/1460088-pmprintergetpaperlist?language=objc)を返します。

> This function obtains a list of the papers that a given printer claims to support. The paper list does not include any custom paper sizes that may be available.

そのため，`PRINT OPTION VALUES`にはカスタム用紙サイズが含まれていません。これは仕様です。

<i class="fa fa-external-link" aria-hidden="true"></i> [Macでカスタム用紙サイズを作成して非定型サイズの用紙にプリントする](https://support.apple.com/ja-jp/guide/mac-help/mchlp15541/mac)
