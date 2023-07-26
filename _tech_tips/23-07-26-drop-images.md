---
layout: technote
title: "複数の画像をドロップして扱う方法"
position: 20230726001
date: 2023-07-26 00:00:00
categories: ヒント
tags: DynamicForm svg
version: 18 19 20
---

複数の画像ファイルをドラッグ＆ドロップして、４Ｄのフォーム上で取り扱う方法の例題になります。

<!--more-->

## 説明

４Ｄで画像を扱うには、大きく２つの方法があります。

１つは、`ピクチャ型`の`変数／フィールド`で、もう１つは`Webエリア`です。
どちらも画像を扱うことができますが、`Webエリア`はブラウザのエンジンを利用していますので、ドロップされたオブジェクトを処理するために`Javascript`を使うことになります。
`Javascript`のコーディング例につきましては、ネット上に数多くの例が公開されていますので、そちらを参照していただくことにして、この記事では`ピクチャ変数`で扱う方法をご紹介します。

## SVGの利用

複数のピクチャを１つのピクチャとして扱うのには、SVGはとても便利ですので使わない理由はありません。

SVGの実体はXMLですので、取り込みしたピクチャを１つのエレメントととして定義することで、位置や大きさを後から自由に変更することが容易です。SVGを取り扱うには、`XMLコマンド`はもちろんですが、標準で利用できる`SVGコンポーネント`を使うこともできます。

## 例題コード

難しいように思うかもしれませんが、とりあえず、例題コードをメソッドにコピーして実行してみてください。例題コードを実行しますと、１つの入力オブジェクトがあるフォームが表示されますので、そこに画像ファイルをドラッグ＆ドロップして試してください。ドロップした画像ファイルの画像が表示されます。この画像は、マウスでドラッグして移動することができます。

解説を後述しますので、まずは試していただきたいと思います。

```4d
Case of 
	: (Count parameters=0) & (OB Is empty(Form))  //フォームの定義と表示
		
		//ページを組み立てる
		$page:=New object  //フォームのページデザインをセットするオブジェクト変数
		$page.objects:=New object
		//入力オブジェクト（オブジェクト名：SvgArea）
		$page.objects.SvgArea:=New object("left"; 20; "top"; 20; "width"; 600; "height"; 600)
		$page.objects.SvgArea.type:="input"
		$page.objects.SvgArea.dataSourceTypeHint:="picture"
		$page.objects.SvgArea.contextMenu:="none"
		$page.objects.SvgArea.sizingX:="grow"
		$page.objects.SvgArea.sizingY:="grow"
		$page.objects.SvgArea.dragging:="none"
		$page.objects.SvgArea.dropping:="custom"
		$page.objects.SvgArea.method:=Current method name
		$page.objects.SvgArea.events:=New collection("onLoad"; "onMouseUp"; "onClick"; "onDrop"; "onMouseMove")
		
		//フォームを組み立てる
		$dynForm:=New object("rightMargin"; 20; "bottomMargin"; 20)
		$dynForm.pages:=New collection(New object; $page)
		$dynForm.events:=New collection("onLoad")
		$dynForm.windowTitle:="イメージ作成"
		$dynForm.windowMinWidth:=500
		$dynForm.windowMinHeight:=500
		
		//ダイアログの表示
		SET MENU BAR(1)
		$ref:=Open form window($dynForm; Plain form window; On the left; At the top)
		DIALOG($dynForm; New object("date"; Current date))
		CLOSE WINDOW($ref)
		
		
	: (OBJECT Get name(Object current)#"SvgArea")  // ここから下は "SvgArea" フォームオブジェクトメソッドのコードとして動作
		
		
	: (FORM Event.code=On Load)
		
		//ドラッグ中エレメント情報
		Form.draging:=""  //ドラッグ中のエレメントのidを格納するプロパティを初期化
		//空のSVGをピクチャとして用意
		SCREEN COORDINATES($left; $top; $right; $bottom)  //スクリーンのサイズ
		$svg:=SVG_New($right-$left; $bottom-$top)  //スクリーンのサイズのSVGなら十分な大きさのはず
		OBJECT Get pointer->:=SVG_Export_to_picture($svg; 1)  //フォームオブジェクトにSVGをセットしておく
		SVG_CLEAR($svg)  //XMLの情報は不要なのでメモリからクリアする（メモリーリークを避ける）
		
	: (FORM Event.code=On Drop) & (Pasteboard data size("com.4d.private.file.url")>0)  //ドロップされたファイルパスデータがあるか？
		
		//ドロップされた有効なパスをコレクションにまとめる
		$paths:=New collection
		For ($i; 1; Pasteboard data size("com.4d.private.file.url"))
			$path:=Get file from pasteboard($i)  //パスを１つ取り出す
			If ($path#"")  //有効なパスか？
				$paths.push($path)  //パスをコレクションに追加
			End if 
		End for 
		
		//対象となるパスを得る
		For each ($path; $paths) Until (Test path name($path)=Is a document)  //有効なファイルパスが１つ見つかるまでループする
			If (Test path name($path)=Is a document)  //有効なファイルパスを見つけて処理する
				//画像の下処理
				READ PICTURE FILE($path; $imagePICT)
				GET PICTURE FORMATS($imagePICT; $codecIDs)
				If (Size of array($codecIDs)#0)  //画像の場合のみ処理する
					PICTURE PROPERTIES($imagePICT; $width; $height)
					If ($width>200) | ($height>200)  //画像が大きすぎないか？
						CREATE THUMBNAIL($imagePICT; $imagePICT; 200; 200; Scaled to fit proportional; Scaled to fit proportional)  //大きさを制限する
						PICTURE PROPERTIES($imagePICT; $width; $height)
					End if 
					PICTURE TO BLOB($imagePICT; $imageBLOB; "image/png")  //扱いやすいようにPNGに変換してBLOB化する
					BASE64 ENCODE($imageBLOB; $imageBASE64)  //XMLに記述できるようにエンコードする
					//マウスの位置を補正してSVGの座標に合わせる
					GET MOUSE($mouseX; $mouseY; $mouseButton)
					OBJECT GET COORDINATES(*; OBJECT Get name; $left; $top; $right; $bottom)
					$mouseX:=$mouseX-$left-($width/2)
					$mouseY:=$mouseY-$top-($height/2)+25  //25はウィンドウ枠の太さの補正
					//SVGにエレメントを追加する
					$svg:=SVG_Open_picture(OBJECT Get pointer->)
					$ref:=DOM Create XML element(\
					$svg; "image"; \
					"id"; "image-"+String(DOM Count XML elements($svg; "image")); \
					"x"; $mouseX; \
					"y"; $mouseY; \
					"width"; $width; \
					"height"; $height; \
					"xlink:href"; "data:image/png;charset=utf-8;base64,"+$imageBASE64)
					//ピクチャとして入力オブジェクトに書き出して表示させる
					SVG EXPORT TO PICTURE($svg; OBJECT Get pointer->)
					SVG_CLEAR($svg)  //XMLは不要なのでメモリからクリア
				End if 
			End if 
		End for each 
		
	: (FORM Event.code=On Clicked)
		
		GET MOUSE($mouseX; $mouseY; $mouseButton)
		OBJECT GET COORDINATES(*; OBJECT Get name; $left; $top; $right; $bottom)
		$piontX:=$mouseX-$left
		$piontY:=$mouseY-$top
		
		$id:=SVG Find element ID by coordinates(*; OBJECT Get name; $piontX; $piontY)
		If ($id#"")
			//ドラッグ中オブジェクトのidをセットする
			Form.draging:=$id
			//マウスの座標とSVGの座標の係数を計算するためにエレメントの位置を得る
			$svg:=SVG_Open_picture(OBJECT Get pointer->)
			$element:=DOM Find XML element by ID($svg; $id)
			var $x; $y : Real
			DOM GET XML ATTRIBUTE BY NAME($element; "x"; $x)
			DOM GET XML ATTRIBUTE BY NAME($element; "y"; $y)
			SVG_CLEAR($svg)
			//マウスの座標とSVGの座標の係数を得る
			Form.piontX:=$mouseX-$x
			Form.piontY:=$mouseY-$y
		End if 
		
		
	: (FORM Event.code=On Mouse Move) & (Form.draging#"")
		
		//マウスの位置にエレメントを移動して再描画する
		$svg:=SVG_Open_picture(OBJECT Get pointer->)
		$element:=DOM Find XML element by ID($svg; Form.draging)
		GET MOUSE($mouseX; $mouseY; $mouseButton)
		DOM SET XML ATTRIBUTE($element; "x"; $mouseX-Form.piontX; "y"; $mouseY-Form.piontY)
		SVG EXPORT TO PICTURE($svg; OBJECT Get pointer->)
		SVG_CLEAR($svg)
		
		
	: (FORM Event.code=On Mouse Up)
		
		//ドラッグ中オブジェクトのidをクリア
		Form.draging:=""
		
End case 
```

## 解説

このコードは大きく２つのパートから成り立っています。

1. ウィンドウを開いてフォームを表示
1. ドロップされた画像を扱う

この２つのパートは、実際にはそれぞれプロジェクトメソッドとフォームに分けて作り込むのが正解だと思いますが、ここでは１つのメソッドで動作を確認できるように工夫してプログラムしました。

前半の部分で、フォームを定義して、そのフォームを表示する部分は、今回の記事では解説を省きたいと思います。ダイナミックフォームの詳細は、デザインリファレンスをご参照ください。

> [デザインリファレンス：ダイナミックフォーム](https://doc.4d.com/4Dv20/4D/20/Dynamic-Forms.300-6263740.ja.html)

例題コードの後半は、入力オブジェクトの`オブジェクトメソッド`として動作する部分です。もし、フォームを作成するのであれば、そのフォームに配置した入力オブジェクトの`オブジェクトメソッド`として記述することで、同じ動作を確認できるはずです。

SVGを扱う部分で、`SVGコンポーネント`のコマンドと、`XMLコマンド`が混在していますが、これには理由があります。

`SVGコンポーネント`は、４Ｄの`XMLコマンド`を使い、SVGに特化したXMLを扱うように組み立てられています。一方、今回のコードは、SVGをXMLとして扱うことで、SVGがXMLの側面を持っていることを利用して組み立てているため、できるだけ`XMLコマンド`を利用するようにプログラムしました。

最初に入力オブジェクトを初期化する部分は、すべて`SVGコンポーネント`で組み上げています。この部分まで`XMLコマンド`で組み立てると面倒になるだけですので、`SVGコンポーネント`を利用しています。同様の理由から、他の部分でもSVGをオープンするときとSVGをクリアするときには、`XMLコマンド`ではなく`SVGコンポーネント`を利用しています。

`SVG_Export_to_picture`と`SVG EXPORT TO PICTURE`の使い分けもしています。SVGで統一するべきところと、XMLで統一するべきところを分けてコーディングしてあります。

コードそのものについては、コメントを見ていただければ、どのようにコマンドを利用しているのかを理解できるのでは無いかと思いますので、記事での解説は省かせていただきます。

## まとめ

SVGのメリットは、ただ単に画像や図形を合成して配置するだけでなく、編集することができる構造を持っているということにあります。

今回は、生成と移動だけで単純な機能にしていますが、回転や変形をするプログラムも可能です。相当に作り込む必要がありますが、例えば`CAD`のような機能を実装することも可能ですので、この機会にSVGについて研究していただければと思います。
