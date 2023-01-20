---
layout: technote
title: "コレクションの要素を削除するときは最後から"
position: 20230120
date: 2023-01-20 8:00:00
categories: ヒント
tags: collection
version: 18, 19
---

配列と同様に、コレクションから複数の要素を削除するときは、最後の要素から順番に削除します。

<!--more-->

削除するインデックスをコレクションにまとめて、最後の番号から並ぶようにソートすることで、短い構文で削除のコードを書くことができます。

例えば、オブジェクトのコレクションがあるとき、特定の条件の要素を削除するには、次のようなコードになります。

```4d
//コレクション変数$listから条件式に合致する要素を削除
$indexes:=$list.indices("条件式").orderBy(ck descending)  //削除するインデックスのコレクションを生成
For each ($i; $indexes)  //インデックスのコレクションでループする
	$list.remove($i)  //目的のコレクションから１要素を削除する
End for each 
```
実際に試してみますと…

```4d
//目的のコレクションを生成
$list:=New collection
$list.push(New object("fullname"; "山田一郎"))
$list.push(New object("fullname"; "山田太郎"))
$list.push(New object("fullname"; "鈴木太郎"))
$list.push(New object("fullname"; "村山田一"))

//条件と合致するコレクションを削除
For each ($i; $list.indices("fullname = '山田@'").orderBy(ck descending))  
	$list.remove($i)
End for each 
```

上記の例題では、インデックス作成の式をFor each文に直接組み込んだので、３行のコードで実装しています。

複数の条件も１つの式で書けるのであれば、同様に３行のコードで実装可能です。

```4d
//目的のコレクションを生成
$list:=New collection
$list.push(New object("fullname"; "山田一郎"; "age"; 25))
$list.push(New object("fullname"; "山田太郎"; "age"; 22))
$list.push(New object("fullname"; "鈴木太郎"; "age"; 18))
$list.push(New object("fullname"; "村山田一"; "age"; 20))

//条件と合致するコレクションを削除
For each ($i; $list.indices("fullname = '山田@' or age < 20").orderBy(ck descending))
	$list.remove($i)
End for each
```
