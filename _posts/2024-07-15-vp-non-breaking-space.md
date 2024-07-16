---
layout: fix
title: "View Proとノンブレーキングスペース"
date: 2024-07-15 08:00:00
categories: 仕様
tags: viewpro macos pdf
---

View Proエリアのセルにはデフォルトで*Calibri* フォントが設定されています。macOSで*Calibri* フォントがインストールされていない場合，画面上では*Calibri* の代わりに*Arial* や*Times New Roman* が使用されます。いずれのフォントもノンブレーキングスペース（NBSP）をサポートしています。

スプレッドシートをPDF形式でエクスポートした場合，*Calibri* フォントがインストールされていなければ*Times* が使用されます。このフォントはノンブレーキングスペース（NBSP）をサポートしていません。

<i class="fa fa-external-link" aria-hidden="true"></i> [NARROW NO-BREAK SPACE (U+202F) Font Support](https://www.fileformat.info/info/unicode/char/202f/fontsupport.htm)

印刷で使用できるフォントの制限についてはドキュメントの説明を参照してください。

> 埋め込み可能なのは Unicode マップを持つ OpenType フォント (.OTF または .TTF ファイル) のみです。 フォントに対して有効なフォントファイルが見つからない場合，デフォルトのフォントが代用されます。

<i class="fa fa-external-link" aria-hidden="true"></i> [PDF 形式についての注意](https://developer.4d.com/docs/ja/ViewPro/commands/vp-export-document/)

スイス式の数値フォーマットなど，ノンブレーキングスペースを出力する必要がある場合，*Calibri* フォントをインストールするか，別のフォントをセルに設定することを検討してください。