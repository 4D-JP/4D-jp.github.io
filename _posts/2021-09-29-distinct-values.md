---
layout: post
title: "オブジェクト型のdistinct"
date: 2021-09-29 12:25:00
categories: ランゲージ
tags: orda collection 19
version: 19
---

[collection.distinct()](https://doc.4d.com/4Dv19/4D/19/collectiondistinct.305-5392047.ja.html)および[entitySelection.distinct()](https://doc.4d.com/4Dv19/4D/19/entitySelectiondistinct.305-5391660.ja.html)は，オブジェクトの集合に対して使用できる[DISTINCT VALUES](https://doc.4d.com/4Dv19/4D/19/DISTINCT-VALUES.301-5393149.ja.html)のようなものです。

値を集積したい属性またはプロパティのパスはドット記法で記述します。このパスはコレクションまたはエンティティセレクション内のパスである点に留意してください。よくある間違いは，属性名（つまりフィールド名）そのものからパスを記述してしまう，というものです。

たとえば，`ob`というオブジェクト型フィールドの`prop`というプロパティから`distinct()`を取り出したいとします。以下は間違いです。

```
$values:=ds.Table_1.all().distinct("ob") //NG
$values:=ds.Table_1.all().distinct("ob.prop") //NG
```

これが間違っているのは，パスのドット記法が属性名から始まっているためです。

オブジェクト型フィールドの`distinct`というプロパティから`distinct()`を取り出のであれば，まず，エンティティセレクションをオブジェクト記法で発展させてコレクションを作成する必要があります。

```
$values:=ds.Table_1.all().ob.distinct("prop")
```

ORDAでは，クラシック言語の自動リレーションの代わりにプロジェクションを使用し，リレーション先を参照するクエリを実行したり，逆にクエリからリレーション先のデータを参照したりすることができます（プロジェクション）。

エンティティセレクションをオブジェクト記法で発展させた場合，パスがリレーション名であればプロジェクションはエンティセレクションを返しますが，パスがフィールド名であればコレクションをします。つまり，オブジェクト記法には`RELATE MANY SELECTION`や`RELATE ONE SELECTION`だけでなく`SELECTION TO ARRAY`のような働きもあるということです。

複数の属性からコレクションを作成したい場合は[`entitySelection.toCollection()`](https://doc.4d.com/4Dv19/4D/19/entitySelectiontoCollection.305-5391677.ja.html)や`[entitySelection.extract()`](https://doc.4d.com/4Dv19/4D/19/entitySelectionextract.305-5391688.ja.html)を使用することができます。
