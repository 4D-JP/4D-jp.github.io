---
layout: post
title: "クライアント/サーバー版はWrite ProドキュメントをORDAで更新できない"
date: 2019-02-15 10:31:00
categories: 注意点 
tags: 17r4 ORDA writepro viewpro 17r5
version: 17r4
---

4D Remote, 4D for iOSなど，ネットワーク版のORDAは，RESTインタフェースに支えられています。標準的なJSONとしてエクスポートできるようなオブジェクトであれば，クライアント側からORDAで更新できますが，``[object picture]``が属性に含まれるオブジェクト型，あるいはWrite Proドキュメントのようなバイナリ形式のオブジェクトは，ORDAの``entity.save()``で保存することができません。これは仕様です。対照的に，4D View Proドキュメントは標準的なJSONなので，ORDAで更新することができます。

```
C_OBJECT($e)
$e:=ds.Invoices.get(5)
$e.writeProDocument:=Form.writeProDocument
$status:=$e.save()
```

このコードをクライアント側で実行した場合，バイナリ形式のオブジェクト型であるWrite Proドキュメントはフィールドに保存されず，エラーも返されないことに注意してください。

バイナリ形式のデータが含まれるオブジェクト型フィールドの``entity.save()``は，17r5でサポートされる予定です。17.xでは，クラシックコマンドの``SAVE RECORD``を使用する必要があります（ACI0099139）。
