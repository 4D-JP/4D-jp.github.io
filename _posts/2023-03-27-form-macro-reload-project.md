---
layout: post
title: "フォームマクロとプロジェクトのリロード"
date: 2023-03-27 09:00:00
categories: 仕様
tags: programming userinterface macro projectmode
---

[フォームマクロ](https://blog.4d.com/ja/automate-repetitive-tasks-and-more-with-form-macros/)を活用すれば，フォームエディターに対する操作はなんでも自動化することができます。マクロの[`onInvoke()`](https://developer.4d.com/docs/ja/FormEditor/macros/#oninvoke)関数に渡されるForm Editor Macro Proxy オブジェクトの *$editor* を介して加えて変更はエディターに即反映されますが，直接 *.4DForm* ファイルに加えた変更はエディターに反映されません。これは仕様です。デザインモードでは，4Dが最前面に復帰したタイミングでソースファイルがリロードされます。任意のタイミングでリロードさせたいのであれば[`RELOAD PROJECT`](https://doc.4d.com/4Dv19/4D/19.6/RELOAD-PROJECT.301-6270050.ja.html)を実行することができます。
