---
layout: post
title: "BLOBの最大サイズ"
date: 2021-06-30 12:00:00
categories: 仕様
tags: v18 blob
---

[ドキュメント](https://doc.4d.com/4Dv18/4D/18.4/BLOB-Commands.300-5233388.ja.html)には，BLOBの最大サイズが`2,147,483,647`バイト（2GiB）であると述べられています。Windowsの場合，空きメモリが充分であれば，そのようなBLOBを作成することができます。しかし，macOSの場合，そこまでおおきなBLOBを作成することはできません。これはプラットフォームの制限であり，仕様です。`SET BLOB SIZE`で検証すると，macOSにおけるBLOBの最大サイズは，空きメモリが充分であっても，`1,073,741,823`バイト（1GiB-1）であることがわかります。
