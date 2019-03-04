---
layout: post
title: "リストボックスとOBJECT GET BEST SIZE"
date: 2019-03-05 07:08:00
categories: 仕様
tags: windows
---

``OBJECT GET BEST SIZE``は，指定テキストを表示するために必要なオブジェクトの幅と高さ（最大幅を指定した場合）を計算するためのコマンドです。しかし，Windowsの場合，リストボックスのセルとテキスト入力エリア（変数またはフィールド）は，描画方法が違うため，一方のオブジェクトを用いて他方のベストオブジェクトサイズを正確に計算することはできないことに留意してください。これは仕様です。

テキスト入力エリアは，<i class="fa fa-external-link" aria-hidden="true"></i> [DirectWrite](https://docs.microsoft.com/en-us/windows/desktop/directwrite/direct-write-portal)でレンダリングされているのに対し，リストボックスのセルは<i class="fa fa-external-link" aria-hidden="true"></i> [Windows GDI](https://docs.microsoft.com/en-us/windows/desktop/gdi/windows-gdi)でレンダリングされています。
