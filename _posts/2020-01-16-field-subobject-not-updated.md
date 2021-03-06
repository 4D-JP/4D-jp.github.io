---
layout: post
title: "OB SETでオブジェクト型フィールドが更新されない"
date: 2020-01-16 12:00:00
categories: 仕様 
tags: 17.x programming
version: 17.x
---

24時間を超過する時間型の値をView Proエリアで使用した場合，値は時間ではなく，時刻として表示されます。たとえば，``Time(26;00;00)``を挿入した場合，``26``時間ではなく，午前``2``時と表示されます。これは仕様です。SpeadJSセルの表示フォーマット（``long time pattern``）は，デフォルトで``HH:mm:ss``に設定されています。24時間を超過する時間型を表示したいのであれば，フォーマットを``[hh]:mm:ss``に設定してください。

オブジェクト型フィールドのオブジェクト型プロパティの値を``OB SET``で変更してから保存した場合，オブジェクト型プロパティの値は更新されないかもしれません。これは仕様です。たとえば，下記のコードを実行した場合，``[Test]TestObject.Test``の値は``200``に更新されません。

```
LOAD RECORD([Test])
$oSubObject:=OB Get([Test]TestObject;"MySubObject";Is object)
OB SET($oSubObject;"Test";200)
SAVE RECORD([Test])
```

``OB SET``コマンドは，第１パラメーターに渡されたオブジェクト型（フィールドまたは変数）の``dirty``（変更済み）フラグだけをセットします。そのオブジェクトを参照している他のオブジェクトのフラグはセットしません。``OB SET``コマンドでオブジェクト型フィールドの内部オブジェクトを間接的に更新する場合，フィールド自体の``dirty``（変更済み）フラグを下記のようにセットする必要があります。

```
[Test]TestObject:=[Test]TestObject
```
