---
layout: post
title: "計算属性とsetter"
date: 2023-03-27 09:00:00
categories: 仕様
tags: programming class
---

19r3以降，クラスの[計算プロパティ](https://blog.4d.com/ja/need-a-magic-wand-here-are-computed-class-properties/)が定義できるようになりました。計算プロパティは`Function get プロパティ名}`および`Function set プロパティ名}`[キーワード](https://developer.4d.com/docs/ja/Concepts/classes/#function-get-%E3%81%A8-function-set)を使用して記述します。計算プロパティを読み書きすると，*getter* および *setter*（両方を合わせてアクセサー）と呼ばれる関数が評価されます。

エンティティの`entity.fromObject()`は，クラスのプロパティをまとめて更新する関数です。したがって，*getter* で計算属性が設定されているデータクラスであれば，対応する *setter* も定義されていなければなりません。*setter* が定義されていない場合，`entity.fromObject()`は属性を更新でないという趣旨のエラーを返します。これは仕様です。
