---
layout: post
title: "PDF Creator 1.7.3がカレントプリンターに設定できない"
date: 2020-11-10 12:00:00
categories: 注意点
tags: 18.x printing 64-bit windows
---

Windows 2012 R2でv18を使用した場合，``SET CURRENT PRINTER``でPDF Creator 1.7.3をカレントプリンターに設定できないことがあります。もちろん，PDF Creatorはインストールされており，``PRINTERS LIST``から返される配列にも含まれています。すべてのマシンで問題が再現するわけではありません。また，問題が発生するマシンでも，v15であれば，PDF Creatorをカレントプリンターに設定することができます。

原因は，Microsoft Office 2013アップデートに伴い，Visual Basicランタイム・COMインタフェースのタイプライブラリ・バージョンが変更されていることにあります。32-bit版は変更されていないため，問題がありません。

問題が発生する場合，Visual Basic 6.0のサービスパックをインストールすることにより，解消することができます。

https://www.microsoft.com/ja-JP/download/details.aspx?id=24417

特定の環境では，サービスパックのインストールに失敗するかもしれません。その場合，下記のコマンドラインを実行してみてください。

```
C:\WINDOWS\system32>%systemroot%/SysWoW64/regsvr32.exe %windir%/SysWoW64/msvbvm60.dll
```
情報源: [4D Forums](https://discuss.4d.com/t/pdf-creator-and-set-current-printer-on-windows-2012r2-terminal-server/15799/18)
