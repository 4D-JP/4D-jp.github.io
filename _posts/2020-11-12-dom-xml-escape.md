---
layout: post
title: "DOM APIは引用符をエスケープしない"
date: 2020-11-12 12:00:00
categories: 仕様
tags: 18.x xml programming
---

``DOM SET XML ELEMENT VALUE``でXML要素値を設定した場合，``"``（クオート）および``'``（アポストロフィ）記号は``&quot;`` ``&apos;``にエスケープされません。これは仕様です。

4Dが採用しているXMLライブラリ「xerces-c」は，SAXとDOMで別々のシリアライザーを実装しています。``XML SET OPTIONS``コマンドの``XML String encoding``を``XML with escaping``（デフォルト）に設定した場合，SAX APIのほうは，要素値の``"`` ``'``も``&quot;`` ``&apos;``にエスケープしますが，DOM APIは``<`` ``>`` ``&``だけをエスケープします。属性値は常にエスケープするべきなので，セレクター指定に左右されません。いずれにしても有効なXMLが出力されるようになっており，パーサーで解析することができます。
