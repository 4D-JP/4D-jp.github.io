---
layout: technote
title: "特定の文字のパターンを抽出する方法"
position: 20230216
date: 2023-02-16 0:00:00
categories: ヒント
tags: SplitString MatchRegex
version: 18, 19
---

テキストの中から、特定のパターンを持つ文字列を抽出する方法について考えてみます。

<!--more-->

## 例題の目標

次のような文字列があるとします。

```
A1=1-234-56&B2=2-345-6&C3=3-456-7
```

この文字列から

```
A1=1-234-56
B2=2-345-6
C3=3-456-7
```

というように切り出したり、`A1`や`B2`に対応して、`1-234-56`や `2-345-6`という文字列を抜き出しすることを目標に、例題を組み立ててみました。

## 小手調べ

まず最初に文字列を分解するコマンドとして、`Split string`コマンドが思いつくと思います。

例題のテキストの場合、`&`キャラクターを区切りとして考えると、次のようなコードで分解できます。

```4d
//例題テキスト
$text:="A1=1-234-56&B2=2-345-6&C3=3-456-7"

//テキストを分解
$strings:=Split string($text; "&")

//確認
For each ($item; $strings)
	ALERT($item)
End for each 
```

実行してみると、3回連続でアラートが表示され、次のように切り出された文字列を確認することができます。

1. A1=1-234-56
1. B2=2-345-6
1. C3=3-456-7


## 正規表現式を使う（その１）

正規表現式を使うと、特定のパターンに対しての評価を行うことができますので、特定のパターンの文字列を抽出するための式として利用できます。切り出しは別のコマンドと組み合わせることになりますが、４Ｄに限らずどの言語でも同じように評価した結果を得て、利用しやすいように加工するところは同じです。

４Ｄの場合、`Match regex`コマンドで、正規表現式を評価させることができます。
`( )`で括られたグループ化を使った式を評価するには、評価の結果を配列で受け取る必要があります。
グループ化の式を使うと、１つパターンに含まれる複数の要素を一度に評価できるのでとても便利ですね。

`Match regex`コマンドの評価に基づいて文字列を切り出すには、`Substring`コマンドを使います。

説明だけでは頭が痛くなるばかりですが、実際のコードはそんなに複雑なものではありません。

```4d
//例題テキスト
$text:="A1=1-234-56&B2=2-345-6&C3=3-456-7"

//テキストを分解
$strings:=New collection
ARRAY LONGINT($pos; 0)
ARRAY LONGINT($len; 0)
$start:=1
While (Match regex("(([^&]+)=([^&]+))"; $text; $start; $pos; $len))
	$start:=$pos{1}+$len{1}
	$strings.push(New object("string"; Substring($text; $pos{1}; $len{1}); "name"; Substring($text; $pos{2}; $len{2}); "value"; Substring($text; $pos{3}; $len{3})))
End while 

//確認
For each ($item; $strings)
	ALERT("全体 : "+$item.string+"\r\r前半部分 : "+$item.name+"\r後半部分 : "+$item.value)
End for each 
```

`Split string`で切り出しただけのものと違い、nameプロパティとvalueプロパティに分け、変数の利用時に使い勝手が良いと思います。

もちろんコレクションですから、`query`などのメンバー関数でコレクションの中を検索するなどもできるので、何かしらと便利だと思います。

## 正規表現式を使う（その２）

せっかくなので、nameプロパティを連想配列のキーとして利用できるようにしてみました。

```4d
//例題テキスト
$text:="A1=1-234-56&B2=2-345-6&C3=3-456-7"

//テキストを分解
$strings:=New object
ARRAY LONGINT($pos; 0)
ARRAY LONGINT($len; 0)
$start:=1
While (Match regex("(([^&]+)=([^&]+))"; $text; $start; $pos; $len))
	$start:=$pos{1}+$len{1}
	$strings[Substring($text; $pos{2}; $len{2})]:=New object("string"; Substring($text; $pos{1}; $len{1}); "value"; Substring($text; $pos{3}; $len{3}))
End while 

//確認
For each ($name; $strings)
	ALERT("全体 : "+$strings[$name].string+"\r\r前半部分 :"+$name+"\r後半部分 :"+$strings[$name].value)
End for each 
```

正規表現式を使う（その１）の例題では`$strings`は`コレクション型`の変数でしたが、今回は`オブジェクト型`である点が大きな違いです。

コレクションの場合はインデックス位置で要素を特定しますが、オブジェクトの場合はプロパティで要素を特定します。プロパティですから任意の名前を付けることができますので、それを応用して連想配列のように`name`で要素が特定できるようになります。４Ｄには連想配列はありませんが、もともと連想配列はオブジェクト記法が使えない言語のためのものであり、４Ｄではオブジェクト記法で表現できるので連想配列は不要であると言えます。

しかしこの方法は、キーとなる値が重複しないことが前提です。仮にnameが重複することがある場合にはこの方法は使えず、その場合は正規表現式を使う（その１）の例題ようにコレクションとして扱うことになります。
