---
layout: post
title: "PDFに埋め込めないフォント"
date: 2020-01-24 08:00:00
categories: 仕様
tags: 18.x printing viewpro
---

v17r5では，4D View Proのエクスポート（``VP EXPORT DOCUMENT``）が拡張され，PDF形式が指定できるようになりました。

[Exporting to PDF](http://help.grapecity.com/spread/SpreadSheets11/webframe.html#ExportingToPDF.html)

v18では，より正確なPDFドキュメントが出力できるよう，フォントの埋め込みがサポートされるようになりました。

[Manage Printing and PDF export](https://blog.4d.com/4d-view-pro-manage-printing-and-pdf-export/)

埋め込みに対応しているのは，OpenType（``.otf`` ``.ttf``）フォントです。SpreadJSが内部的に使用している``pdkKit``の制限により，Unicodeマップを有するフォントだけが使用できます。システムにプリインストールされているフォントには，Unicodeマップを有さないものもあるため，エクスポートの前にフォントファイルがスキャンされ，埋め込みができるかどうか，判断されるようになっています（SpreadJSがデフォルトでサポートしているフォントはスキップします）。フォントファイルのスキャンは，下記の仕様に基づいて実行されます。

[OpenType® specification](https://docs.microsoft.com/en-us/typography/opentype/spec/)

``Font file``は，``VP EXPORT DOCUMENT``が埋め込みフォントファイルを特定するため，``VP EXPORT DOCUMENT``が内部的に使用するコマンドとして追加されました。4D View Proドキュメント内で使用されているフォントに対応するフォントファイルがみつからない場合，SpreadJSのデフォルトフォントが使用されます。

前述したように，PDFに埋め込むことができるのは``.otf`` ``.ttf``ファイルだけであり，フォントコレクション（``.ttc``）はサポートされていないことに留意してください。たとえば「Gill Sans」フォントは，フォントコレクションなので，印刷はできますが，PDFに埋め込むことはできません。これは（SpreadJSおよびpdfKitの）仕様です。

回避策として，フォントコレクションを個別のフォントファイルに分割するオンラインサービスが使用できるかもしれません。

https://transfonter.org/ttc-unpack

https://forums.4d.com/Post/FR/32954391/1/33322975#33322975
