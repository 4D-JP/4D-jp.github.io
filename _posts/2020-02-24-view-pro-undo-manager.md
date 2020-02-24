---
layout: post
title: "View Proエリアで操作が取り消せない"
date: 2020-02-24 08:00:00
categories: 仕様
tags: 18.x viewpro
---

View Proエリアは，SpreadJSをベースにしており，CEF版のWebエリアに表示されています。そのため，標準のView Proコマンドに加え，SpreadJSのJavaScript APIもWebエリアコマンド経由で実行することができます。たとえば，セルのスタイルを変更した後，下記のようなコードで操作を取り消すことができます（``command``+``Z``を入力することに相当）。

```
Utils.spread.undoManager().undo() 
```

``spread``ではなく，``Utils.spread``と記述する必要がある点に留意してください。このテクニックは，リボンインタフェースだけで使用することができます。これは仕様です。ツールバーインタフェースで取り消すことができるのは，値の入力など，基本的な処理だけとなっています。
