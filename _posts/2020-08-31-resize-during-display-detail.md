---
layout: post
title: "On Display Detailとオブジェクトのリサイズ"
date: 2020-08-31 12:00:00
categories: 仕様
tags: 18.x userinterface 
---

``On Display Detail``フォームイベント中に``OBJECT SET COORDINATES``でオブジェクトの位置やサイズを変更することはしないでください。この点はドキュメントに明記されています。

https://doc.4d.com/4Dv18R3/4D/18-R3/OBJECT-SET-COORDINATES.301-4901302.ja.html

Windows版では，画面の描画に使用されているシステムAPIの関係で，実際には``On Display Detail``フォームイベント中にコマンドを使用することができます。しかし，macOSではウィンドウの描画が最適化されているため，同じような振る舞いになりません。

リストの詳細行に配置されたオブジェクトでプログレスバーのようなユーザーインタフェースを実現するのであれば，四角形をリサイズするのではなく，SVGピクチャまたは進捗バーオブジェクトの使用を検討してください。
