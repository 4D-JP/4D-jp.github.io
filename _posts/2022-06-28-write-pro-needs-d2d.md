---
layout: post
title: "Write ProエリアはDirect2Dが必要"
date: 2022-06-28 15:00:00
categories: 仕様
tags: writepro windows compatibility 
version: 18
---

Windows版で`SET DATABASE PARAMETER`で`Direct2D status`を`Direct2D disabled`にセットした場合，Write Proエリアは使用できなくなります。これは仕様です。v17のWrite Proエリアは，GDI/GDIPlusモードが残されていたので，Direct2Dモードが無効にされていてもレンダリングすることができました。これは，デバッグ目的の措置であり，Direct2Dのない環境でWrite Proエリアは正式にサポートされていませんでした。

> 必要要件: Windows上では，4D Write Proの機能はDirect2Dに依存しています。Windows 7またはWindows Server 2008以降のマシンでは，必要なバージョンのDirect2Dを利用可能にするために，Windowsプラットフォーム更新プログラムがインストールされていることを確認して下さい。

<i class="fa fa-external-link" aria-hidden="true"></i> [Write Pro概要](https://doc.4d.com/4Dv17/4D/17/Presentation.200-3726279.ja.html)  

アプリの高DPI設定が有効にされている場合（19r4以降のデフォルト），Direct2Dモードは必須であり，無効にすることはできません。その場合，`SET DATABASE PARAMETER`で`Direct2D status`を`Direct2D disabled`にセットしても無視されます。
