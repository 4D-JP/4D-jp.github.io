---
layout: technote
title: "テンプレートを利用したSVG画像の動的生成"
position: 20230113
date: 2023-01-17 00:00:00
categories: ヒント
tags: svg xml 4dtag
version: 17, 18, 19
---

SVGを動的に生成して利用するとき、SVGコンポーネントを使って図形を描くことを考えがちですが、定形の処理であればSVGコンポーネントを使わずに、動的にSVGを生成することができます。

<!--more-->

例えば、はがきの宛名書きやラベルの印刷などにSVGを利用するのは、縦書きが使えるので便利であると思います。
また、ある図面の一部の寸法の違いや、形状の違いをパラメーターで指定するようなとき、SVGコンポーネントを利用して、プログラムで動的に生成することが考えられるかもしれません。

そうした一部の違いをテンプレートを使って、動的に生成する方法について簡単なサンプルで紹介したいと思います。

## 目標

ここでは、図形の幅を指定して、ピクチャ変数に入れることを目標にします。

![やりたいこと](/images/TechTips/20230117/fig1.png)

↑このように、図形の幅をパラメーターとして与え、図形の幅を変更できるようにすることを目標にします。

## ベースとなるSVGを用意する

最初にするべきことは、ベースとなるSVGを用意することです。

SVGはXMLなので、テキストエディタでも作成することは可能です。
ですが、テキストエディタでちまちまとXMLを書くのは、あまり効率的とは言えません。
世の中にはたくさんのSVGエディタがありますので、それらを使って大雑把に絵を描きファイルに保存したものをテキストエディタで整理／整形するのが現実的だと思います。
そのようにして、用意したファイルのコードは下記のとおりです。

```svg
<?xml version="1.0" encoding="utf-8"?>
<svg viewBox="0 0 250 200" xmlns="http://www.w3.org/2000/svg">
  <path d="M 0 50 L 50 0 L 200 0 L 250 50 L 250 200 L 0 200 L 0 50 Z" style="fill: none; stroke: rgb(0,0,0);"/>
</svg>
```

pathを使って、図形を描いたものを座標だけ手作業で修正して整形したものになります。
もっとも、この程度ならSVGエディタを使用するまでもなく、手書きで十分かもしれません。

イメージとして表示すると↓このようになります。

<img src="/images/TechTips/20230117/sample.svg" alt="ベースとなるSVG" style="width: 250px;">

このファイルをsample.svgと命名してResourcesフォルダに入れて、４Ｄのメソッドからテストを兼ねて参照／表示してみます。

テストメソッドは、次のようなコードになります。

```4d
$svg:=DOM Parse XML source(File("/RESOURCES/sample.svg").platformPath)  //XMLとしてメモリにロード
SVGTool_SHOW_IN_VIEWER($svg)  //ビューアーで表示
DOM CLOSE XML($svg)  //XMLをクローズしてメモリを開放
```

ここでは、SVGコンポーネントのSVGTool_SHOW_IN_VIEWERを使って、作成したSVGを4Dがレンダリングできるかどうかを確認しています。
今回、SVGコンポーネントを使うのはここだけですが、XMLコマンドとSVGコンポーネントメソッドを混ぜて利用することは可能です。

SVGは、レンダラーによっては上手く表示できない要素や記述があるので、SVGTool_SHOW_IN_VIEWERで４Ｄが表示できるかどうかを確認するのは重要です。
上手く表示できない箇所があれば、XMLをエディターで修正します。

これで準備完了。

これらか目標に合わせて、ベースとなるSVGに仕掛けを施していきます。

## SVGのテンプレートを作成

ベースとなるSVGに４Ｄ変換タグを埋め込んでテンプレートを作成します。

何度も言いますが、SVGはXMLで書かれています。
そして、XMLはマークアップ言語であり、さらにはHTMLも同様にマークアップ言語です。

ですので、HTMLと同様に、XMLに、さらにはSVGに４Ｄ変換タグを埋め込み、それを評価させることも可能です。

> [４Ｄ変換タグ](https://developer.4d.com/docs/ja/Tags/tags/)

ということで、いきなりですが、４Ｄ変換タグを埋め込んでみました。

```svg
<?xml version="1.0" encoding="utf-8"?>
<svg viewBox="0 0 $4DTEXT($1.position) 200" xmlns="http://www.w3.org/2000/svg">
  <path d="M 0 50 L 50 0 L $4DEVAL($1.position-50) 0 L $4DTEXT($1.position) 50 L $4DTEXT($1.position) 200 L 0 200 L 0 50 Z" style="fill: none; stroke: rgb(0,0,0);"/>
</svg>
```

４Ｄ変換タグの $4DTEXT()と$4DEVAL()が埋め込まれています。
ここで利用した４Ｄ変換タグは、XMLに向いている代替シンタックスを使いました。

４Ｄ変換タグはPROCESS 4D TAGSコマンドを使って評価することで、文字列に変換されます。
$4DTEXT($1.position)とコーディングした４Ｄ変換タグは、PROCESS 4D TAGSコマンドに渡した第1パラメーターのpositionプロパティと置き換わります。

$4DEVAL($1.position-50)は、式が評価された結果になります。
$1.positionは図形の幅を表すパラメーターなので、それよりも50だけ小さい位置に頂点を１つ配置するために計算式を利用しています。

このテンプレートはtemplate.svgと命名してResourcesフォルダに入れておきます。

## 実験

いよいよ実験します。

後述のコードを実行しますと、値を入力するオブジェクトと、その値から変形した図形を表示するためのボタンが備わったフォームが表示されます。

コードに問題がなければ、フォームが表示され、そのフォームで値を入れてボタンを押すと、その下に変形された図形が表示されるはずです。
コードをシンプルにするため、エラー処理は省いていますので、100以下の数字を入れないように注意してください。

```4d
Case of 
		
	: (FORM Event=Null)  //単独で呼ばれた
		
		//フォームに配置するページの定義
		$page:=New object
		$page.objects:=New object
		//ページに配置する入力オブジェクト
		$page.objects["Input position"]:=New object(\
		"type"; "input"; \
		"left"; 10; "top"; 10; "width"; 50; "height"; 22; \
		"dataSourceTypeHint"; "number"; \
		"dataSource"; "Form.position")
		//ページに配置する実行ボタン
		$page.objects["Execute button"]:=New object(\
		"type"; "button"; \
		"left"; 70; "top"; 10; "width"; 80; "height"; 22; \
		"text"; "実行"; \
		"events"; New collection("onClick"); \
		"method"; Current method path)
		//ページに配置するSVG表示用ピクチャオブジェクト
		$page.objects["SVG image"]:=New object(\
		"type"; "input"; \
		"left"; 10; "top"; 50; "width"; 500; "height"; 500; \
		"dataSourceTypeHint"; "picture"; \
		"dataSource"; "Form.image"; \
		"enterable"; False; \
		"sizingX"; "grow"; \
		"sizingY"; "grow"; \
		"borderStyle"; "none")
		
		// 表示するためのフォームを組み立てる
		$dynForm:=New object("rightMargin"; 10; "bottomMargin"; 10)
		$dynForm.pages:=New collection($page)
		$dynForm.method:=Current method path
		
		//組み立てたフォームの表示
		$ref:=Open form window($dynForm)
		DIALOG($dynForm; New object("svg"; $image))  //SVGをダイナミックフォームのパラメーターでフォームに渡す
		CLOSE WINDOW($ref)
		
	: (FORM Event.code=On Load)  //フォームが表示された
		
		//最初に表示するSVGを用意
		$svg:=DOM Parse XML source(File("/RESOURCES/sample.svg").platformPath)  //Resoucesフォルダのsample.svgをXMLとして読み込む
		SVG EXPORT TO PICTURE($svg; $image)  //XMLをピクチャ変数に取り込む（注：変換ではない）
		DOM CLOSE XML($svg)  //XMLを閉じてメモリー開放
		
		//フォームを初期化
		Form.image:=$image
		Form.position:=250
		
	: (FORM Event.code=On Clicked)  //実行ボタンがクリックされた
		
		$src:=File("/RESOURCES/template.svg").getText()  //テンプレートをテキストとして読み込む
		PROCESS 4D TAGS($src; $src; Form)  //4D変換タグを評価する
		$svg:=DOM Parse XML variable($src)
		SVG EXPORT TO PICTURE($svg; $image)
		DOM CLOSE XML($svg)
		Form.image:=$image
		
End case 
```

一応これで完成です。

## まとめ

SVGコンポーネントを利用することで、SVGを簡単に扱うことができますが、必ずしもSVGコンポーネントがベストプラクティスであるとは限らないと言えます。

SVGのテンプレートを用意して、４Ｄ変換タグを埋め込むことができれば、帳票などもSVGで組み立てることも可能です。

SVGを書くツールは、たくさん出回っていますから、手に馴染むツールを見つけることができれば、テンプレートは素早く用意できるようになります。

応用が効く方法だと思いますので、ぜひ研究してみてください。

>参考：
> + [Scalable Vector Graphics W3C公式](https://www.w3.org/Graphics/SVG/)
