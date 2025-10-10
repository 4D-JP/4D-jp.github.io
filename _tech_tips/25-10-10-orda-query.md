---
layout: technote
title: "ORDAのクエリについて"
position: 20251010001
date: 2025-10-10 00:00:00
categories: ヒント
tags: ORDA query
version: 20
---

ORDAのクエリについての情報をまとめました。

<!--more-->

## 説明

ORDAのクエリは、DataClassのquery関数に、基本的な使い方と例題が記載されています。

> [DataClass: .query\(\)](https://developer.4d.com/docs/ja/API/DataClassClass#query)


ORDAのクエリは、基本的に`テキスト`ならびに`テキスト変数`で指示します。
ORDAのクエリは、`プレースホルダー`を使いこなすのがポイントです。

> [DataClass: プレースホルダーを使用する](https://developer.4d.com/docs/ja/API/DataClassClass#%E3%83%97%E3%83%AC%E3%83%BC%E3%82%B9%E3%83%9B%E3%83%AB%E3%83%80%E3%83%BC%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B)

ドキュメントの抜粋になりますが、プレースホルダーは２つに大別できることを忘れないでください。

1. インデックスプレースホルダー
2. 命名プレースホルダー

ORDAのクエリは、コレクションでもほぼ同じになります。

> [Collection: .query\(\)](https://developer.4d.com/docs/ja/API/CollectionClass#query)

これによりコレクションは配列とは異なりテーブル同様の検索して利用することができます。
これはコレクションをテーブルのように扱うことができるということであり、一時的な作業テーブルとして用いることが可能です。

言い換えますと`一時的な作業テーブル`は不要と言うことです。

少し脱線してしまいましたが、リファレンスドキュメントだけでは、どのような振る舞いになるのかが想像しにくいかと思います。
実際に動作を見ながら勉強するためのデモサンプルがありますので、それを試してみるのが良いでしょう。

## How Do I

ORDAのクエリのデモといたしましては、4D 17の頃のものになりますが、次のようなものがございます。

> [ORDA: クエリ](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Query.zip)

ORDAの基本的なクエリ機能を紹介するデモサンプルです。

基本的な使い方を７種類にまとめ、実際に試せるようになっています。

> [ORDA: 値の命名プレースホルダーを使ったクエリ](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_PlaceHolders_Values.zip)

基本はインデックスプレースホルダーですが、命名プレースホルダーを使う例題になります。

この例題は、少し古いため、例えば次のように書かれたコードは・・・

```4d
$settings:=New object
$settings.parameters:=New object("givenName"; "Bravo@"; "givenComment"; "New client")
$clients:=ds.Clients.QUERY("name = : givenName and comment = :givenComment"; $settings)
```

現在の4Dであれば、次のように書くことができますので、より直感的なコードを書くことができます。

```4d
$settings:={}
$settings.parameters:={\
  givenName: $givenName; \
  givenComment: $givenComment\
}
$clients:=ds.Clients.QUERY("name = : givenName and comment = :givenComment"; $settings)
```

> [ORDA: 属性パスのプレースホルダーを使ったクエリ](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_PlaceHolders_AttributePaths.zip)

こちらは、値の命名プレースホルダーではなく、属性パスのデモサンプルになります。

> [ORDA: フォーミュラを使ったクエリ](https://github.com/4D-JP/HDI/releases/download/17r6/HDI_Query_ByFormula.zip)

クエリでフォーミュラを扱えるので、計算して得られるような値をクエリすることが可能です。

## まとめ

命名プレースホルダーは、プログラムでクエリーそのものを組み立てるときに非常に有意義に利用することができます。
値と属性の両方を命名プレースホルダーにして、いくつもの値と属性を組み合わせたクエリーを動的に生成することができます。

以下は、検索する文字列を入力して、`Miscellaneous`テーブルの`Note`フィールドを検索した結果をローカル変数`$selection`に取り出す例題です。
検索する文字列は、空白で区切って複数を入力できます。

```4d
$text:=Request("検索する文字列を空白で区切って複数指定できます")
If (OK=1)
	$text:=Replace string($text; "　"; " ")
	$keywords:=Split string($text; " "; sk ignore empty strings+sk trim spaces)
	ALERT(Choose($keywords.length=0; "検索キーワードが指定されませんでした"; "検索キーワードは全部で"+String($keywords.length)+"個です\r・"+$keywords.join("\r・")))
	If ($keywords.length>0)
		$querys:=[]  //クエリーストリング作業用コレクション
		$settings:={parameters: {}; attributes: {}}  //命名プレースホルダーオブジェクト
		For ($i; 0; $keywords.length-1)  //検索キーワードの数だけループ
			$name:="holder"+String($i)  //命名プレースホルダーの名前
			$settings.parameters[$name]:="@"+$keywords[$i]+"@"  //検索キーワード
			$settings.attributes[$name]:="Note"  //フィールドの名前
			$querys.push("(:"+$name+" = :"+$name+")")  //クエリーストリング１つ分
		End for 
		$queryString:=$querys.join(" and ")  //クエリーストリングをまとめる（AND検索）
		$selection:=ds.Miscellaneous.query($queryString; $settings)
		ALERT(String($selection.length)+"件のレコードが該当しました")
	End if 
End if 
```
