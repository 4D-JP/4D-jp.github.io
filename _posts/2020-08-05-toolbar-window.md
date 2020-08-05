---
layout: post
title: "ツールバータイプのウィンドウ"
date: 2020-08-05 12:00:00
categories: 仕様
tags: 18.x windows
---

SDIモードでウィンドウタイプの[``Toolbar form window``](https://doc.4d.com/4Dv18/4D/18/Open-form-window.301-4505245.ja.html)はサポートされていません。これは仕様です。

ツールバータイプのウィンドウは，常に画面の幅いっぱい最上部に表示されるウィンドウです。Windowsのタスクバーをデスクトップの「上」「右」「左」に表示した場合，4Dで表示したツールバーの一部がWindowsタスクバーの下に隠れてしまうかもしれません。

[ドキュメント](https://doc.4d.com/4Dv18/4D/18/Window-Types.300-4505236.ja.html)の記述は近日中に修正されます。

> ウィンドウの水平方向のサイズはデスクトップ（macOSおよび**SDIモードのWindows**）または4Dのメインウィンドウ内部（MDIモードのWindows）の利用可能な全ての水平方向のスペースを埋める形で自動的に調整されます。
