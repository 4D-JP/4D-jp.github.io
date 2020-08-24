---
layout: post
title: "第２画面にウィンドウを表示するには"
date: 2020-08-24 12:00:00
categories: 仕様
tags: 18.x macos userinterface
---

新規プロセスで作成したウィンドウの初期座標をメインモニター以外に設定した場合，ウィンドウがすぐには表示されないことがあります。これはMac版の仕様（修正できない問題）であると考えられています。

* ``Open form window``と``DIALOG``の間に``WINDOW LIST``を呼び出した場合
* ``On Load``イベントで``WINDOW LIST``を呼び出した場合

問題を回避するためには，メインモニターに``Open form window``でウインドウを表示した後，``SET WINDOW RECT``で移動することができます。
