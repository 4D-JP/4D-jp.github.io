---
layout: post
title: "OB Copyでコピーできないオブジェクト"
date: 2020-03-13 08:00:00
categories: 仕様
tags: 17.x 18.x ORDA
---

``dataClass`` ``entity`` ``entitySelection`` ``dataStore``のようなORDAオブジェクトを``OB Copy``でコピーすることはできません。これは仕様です。この点は，ドキュメントの[エンティティに関するページ](https://doc.4d.com/4Dv18/4D/18/Entities.300-4575755.ja.html)で言及されています。エンティティを（``DUPLICATE RECORD``のようなイメージで）複製するのであれば，``entity.toObject()``のようなメソッドを介して標準オブジェクトに値を転写するか，``entity.clone()``で新規エンティティを作成してください。 
