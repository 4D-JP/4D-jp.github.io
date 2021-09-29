---
layout: post
title: "オブジェクト型のdistinct values"
date: 2021-09-29 12:25:00
categories: ランゲージ
tags: orda collection 19
version: 19
---

[collection.distinct()](https://doc.4d.com/4Dv19/4D/19/collectiondistinct.305-5392047.ja.html)および[entitySelection.distinct()](https://doc.4d.com/4Dv19/4D/19/entitySelectiondistinct.305-5391660.ja.html)は，オブジェクトの集合に対して使用できる[DISTINCT VALUES](https://doc.4d.com/4Dv19/4D/19/DISTINCT-VALUES.301-5393149.ja.html)のようなものです。

値を集積したい属性またはプロパティのパスはドット記法で記述します。このパスが間違っていると，正しい値が返されません。

たとえば，`obj`というオブジェクト型フィールドの`prop`というプロパティから`distinct()`を取り出したい場合を考えましょう。

```
$values:=ds.Table_1.all().distinct("obj") //#1
$values:=ds.Table_1.all().distinct("obj.prop") //#2
```

#1の`obj`というパスはオブジェクト型のフィールド自体を指します。

#2の`obj.prop`という属性パスは，リレーション属性`obj`でリンクされたデータクラスの`prop`プロパティ，あるいはオブジェクト型のストレージ属性`obj`内部の`prop`プロパティを指します。しかし，ドキュメントに明記されているように，リレートされた属性を`distinct()`で参照することはできません。`ob.prop`はストレージ属性なので，一見，シンタックには問題がないように思われます。実際，`prop`がスカラー値であれば，正しいコレクションが返されます。また，`ob.prop.prop`がスカラー値であれば，やはり正しいコレクションが返されます。しかし，`prop`がオブジェクト型の場合，`distinct()`は空のコレクションを返します。

`entitySelection.distinct()`がサポートしていない属性パス，つまり

* リレーション属性のスカラー値
* ストレージ属性のオブジェクト型

は，プロジェクションと`collection.distinct()`で取り出すことができます。

```
$values:=ds.Table_1.all().obj.distinct("prop")
```

`obj`が`distinct`のパス名ではなく，ORDAのパス名に含まれているのがポイントです。

ORDAでは，クラシック言語の自動リレーションの代わりにプロジェクションを使用し，リレーション先を参照するクエリを実行したり，逆にクエリからリレーション先のデータを参照したりすることができます（プロジェクション）。

エンティティセレクションをオブジェクト記法で発展させた場合，パスがリレーション名であればプロジェクションはエンティセレクションを返しますが，パスがフィールド名であればコレクションをします。つまり，ORDAのオブジェクト記法には`RELATE MANY SELECTION`や`RELATE ONE SELECTION`だけでなく`SELECTION TO ARRAY`のような働きもあるということです。

複数の属性からコレクションを作成したい場合は[`entitySelection.toCollection()`](https://doc.4d.com/4Dv19/4D/19/entitySelectiontoCollection.305-5391677.ja.html)や[`entitySelection.extract()`](https://doc.4d.com/4Dv19/4D/19/entitySelectionextract.305-5391688.ja.html)を使用することができます。

`entitySelection.extract()`は[`collection.extract()`](https://doc.4d.com/4Dv19/4D/19/collectionextract.305-5392059.ja.html)に似ていますが，v19で追加された新コマンドです。
