---
layout: post
title: "PDF出力パスの管理"
date: 2023-01-09 12:00:00
categories: 仕様
tags: printing windows
---

印刷ダイアログでファイル出力を選択した場合，Windowsプラットフォームでユーザーが指定したパスはそのままドライバーに渡されるため，macOSのように`GET PRINT OPTION`で取得することができません。これは仕様です。回避策としてファイル選択ダイアログを表示し，そのパスを`SET PRINT OPTION`で指定することができるかもしれません。
