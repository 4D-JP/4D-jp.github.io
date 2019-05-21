---
layout: post
title: "View ProのPDF変換でサポートされているフォント"
date: 2019-05-22 02:17:00
categories: 仕様
tags: 17r5 viewpro
---


スプレッドシートを``.pdf``形式でエクスポートした場合，フォントが変わってしまうことがあります。これは仕様です。``VP EXPORT DOCUMENT ``はSpreadJSの標準モジュールを使用してドキュメントをPDFに変換します。バージョン12でサポートされているのは，下記14種類のフォントです。

| フォントファミリー | フォント |
| --- | --- |
| Courier | Courier |
| ||Courier-Bold|
| ||Courier-Oblique|
| ||Courier-BoldOblique|	
| Times ||Times-Roman|
| |Times-Bold|
| |Times-Italic|
| |Times-BoldItalic|
| Helvetica |Helvetica|
| |Helvetica-Bold|
| |Helvetica-Oblique|
| |Helvetica-BoldOblique|
| Symbol |Symbol|
| ZapfDingbats |ZapfDingbats|

<i class="fa fa-external-link" aria-hidden="true"></i> [ExportingToPDF.html](http://help.grapecity.com/spread/SpreadSheets12/webframe.html#ExportingToPDF.html)
