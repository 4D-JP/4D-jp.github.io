---
layout: post
title: "CREATE THUMBNAILのパフォーマンス"
date: 2020-12-09 12:00:00
categories: 仕様
tags: windows graphics
---

`CREATE THUMBNAIL`の処理速度は，WindowsよりもmacOSのほうがずっと高速です（`5`バ倍強）。これは仕様です。MacのグラフィックフレームワークはGPUで加速されたハードウェア処理ですが，Windowsはソフトウェア処理となっています。`bicubic` `bilinear`フィルタリングのソフトウェア演算処理には結構なCPUパワーが必要です。
