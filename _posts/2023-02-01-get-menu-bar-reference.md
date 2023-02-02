---
layout: post
title: "カレントメニューバーと連結メニュー"
date: 2023-02-01 09:00:00
categories: 仕様
tags: userinterface
---

`Get menu bar reference`はプロセスのカレントメニューバーを返すコマンドです。`SET MENU BAR`でメニューバーをインストールしていることが前提になります。フォームの「連結メニュー」プロパティは，プロセスのカレントメニューバーに連結されるものなので，事前に`SET MENU BAR`を使用していない場合，メニューは表示されますが，`Get menu bar reference`は空の文字列を返すことになります。これは仕様です。
