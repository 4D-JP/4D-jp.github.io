---
layout: fix
title: "PDFまたはXPSの印刷マージン"
date: 2025-07-09 08:00:00
categories: 仕様
tags: printing pdf xps 
---

印刷コマンドでPDFまたはXPS形式のドキュメントを出力した場合，プリンターのように印刷ができない領域というものは存在しないため，[`SET PRINTABLE MARGIN`](https://developer.4d.com/docs/ja/commands/set-printable-margin)に`-1`（プリンターのマージン）や`0`（用紙マージン）の指定は無視されます。PDFまたはXPS形式のドキュメントがプリントプレビューとおなじようなレイアウトになることを望むのであれば，用紙およびプリンターを設定した後，`GET PRINTABLE MARGIN`で理論マージンを取得し，`SET PRINTABLE MARGIN`で出力に反映させる必要があります。