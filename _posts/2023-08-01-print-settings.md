---
layout: fix
title: "印刷設定"
date: 2023-08-01 08:00:00
categories: 仕様
tags: windows printing
---

*PDF Creator* ドライバーの印刷設定を`BLOB to print settings`で保存した場合，プライベート領域に独自のバイナリデータが記録されます。そのような印刷設定を他社のプリントドライバー，たとえば京セラの *KX DRIVER for Universal Printing* プリントドライバーに適用した場合，プリントドライバーがクラッシュするかもしれません。4Dはドライバーのクラッシュを防止することができないので注意してください。