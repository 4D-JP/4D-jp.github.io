---
layout: technote
title: "変数オブジェクトとWebエリアの描画の違い"
position: 20221223
date: 2022-12-23 00:00:00
categories: ヒント
tags: webarea
version: 17, 18, 19
---

４Ｄのフォームオブジェクトの描画は、プロセスの処理と同期しているので、１つのイベントが終了するときに行われます。
一方、Webエリアは非同期で動作するので、４Ｄのフォームオブジェクトとは違うタイミングで描画されます。

<!--more-->

４Ｄのフォームオブジェクトの描画は、イベントが終了しないようなときは描画されません。
例えば、メニューを表示しているようなとき、そのプロセスではデータの更新の結果が、表示に反映されることはありません。

ですがWebエリアは、４Ｄのプロセスとは非同期で動作するので、Webエリアの更新はその限りではありません。
同じことは、4D View Proにも言えます。

## 実験

変数オブジェクトとWebエリアとで、描画タイミングが違うことを実験してみます。
後述のサンプルコードをメソッドとして作成し、実行するとフォームが表示されます。

実験は次のようにします。

1. ウィンドウ左端の入力エリアに画像を入力（ペースト）する
2. 画像が入力エリアにあることを確認
3. 入力エリアをマウスボタンで長押してメニューが表示されている間の他のオブジェクトの様子を観察

このように実験すると、メニューを表示している間は、変数オブジェクトには画像が表示されていないことに気がつくと思います。
一方で、Webエリアには画像が表示されます。
Webエリアは、４Ｄのプロセスと非同期で動作していることが分かると思います。

## 実験用サンプルコード

```4d
Case of 
	: (FORM Event=Null)
		
		//編集メニューを表示するためのメニューバー指定
		SET MENU BAR(1)
		
		//フォーム用のオブジェクトを用意
		$form:=New object
		$page:=New object
		$form.pages:=New collection(Null; $page)
		
		//フォームを組み立てる
		$form.windowTitle:="TEST FORM"
		$form.destination:="detailScreen"
		$form.windowSizingX:="fixed"
		$form.windowSizingY:="fixed"
		$form.rightMargin:=20
		$form.bottomMargin:=20
		$form.events:=New collection("onTimer")
		$form.method:=Current method name
		
		//ページを組み立てる
		$page.objects:=New object
		$page.objects["Input Pict"]:=New object(\
		"type"; "input"; \
		"left"; 20; "top"; 40; "width"; 200; "height"; 200; \
		"dataSourceTypeHint"; "picture"; \
		"method"; Current method name; \
		"contextMenu"; "none"; \
		"events"; New collection("onClick"); \
		)
		$page.objects["Output Pict"]:=New object(\
		"type"; "input"; \
		"left"; 240; "top"; 40; "width"; 200; "height"; 200; \
		"dataSourceTypeHint"; "picture"; \
		"method"; Current method name; \
		"contextMenu"; "none"; \
		"enterable"; False; \
		)
		$page.objects["Web Area"]:=New object(\
		"type"; "webArea"; \
		"left"; 460; "top"; 40; "width"; 200; "height"; 200; \
		)
		$page.objects["Text1"]:=New object(\
		"type"; "text"; \
		"text"; "ピクチャの入力エリア"; \
		"left"; 20; "top"; 10; "width"; 200; "height"; 16; \
		)
		$page.objects["Text2"]:=New object(\
		"type"; "text"; \
		"text"; "ピクチャ変数"; \
		"left"; 240; "top"; 10; "width"; 200; "height"; 16; \
		)
		$page.objects["Text3"]:=New object(\
		"type"; "text"; \
		"text"; "Webエリア"; \
		"left"; 460; "top"; 10; "width"; 200; "height"; 16; \
		)
		
		//フォームを表示
		$ref:=Open form window($form)
		DIALOG($form)
		CLOSE WINDOW($ref)  //クローズするときはウィンドウの参照を渡すのがオススメ
		
	: (FORM Event.code=On Clicked)
		
		//入力エリアの画像を取り出し
		var $pict : Picture
		$pict:=OBJECT Get value("Input Pict")
		
		If (Picture size($pict)#0)
			
			//ピクチャ変数に画像を表示
			OBJECT SET VALUE("Output Pict"; $pict)
			
			//Webエリアに画像を表示
			var $blobPict; Blob
			PICTURE TO BLOB($pict; $blobPict; "image/png")
			var $encodedPict : Text
			BASE64 ENCODE($blobPict; $encodedPict)
			$html:="<html><body><img src=\"data:image/png;base64,"+$encodedPict+"\" /></body></html>"
			WA SET PAGE CONTENT(*; "Web Area"; $html; "")
			
		End if 
		
		//ペーストボードの画像を取り出す
		GET PICTURE FROM PASTEBOARD($pict)
		
		//メニュー表示
		$menu:=Create menu
		APPEND MENU ITEM($menu; Choose(Picture size($pict)=0; "("; "")+"ペースト")  //ペースボードに画像があるときだけ使えるようにする
		SET MENU ITEM PARAMETER($menu; -1; "paste")
		APPEND MENU ITEM($menu; "-")
		APPEND MENU ITEM($menu; "変数にはピクチャが描画されない")
		SET MENU ITEM PARAMETER($menu; -1; "Comand2")
		APPEND MENU ITEM($menu; "一方で")
		SET MENU ITEM PARAMETER($menu; -1; "Comand3")
		APPEND MENU ITEM($menu; "Webエリアにはピクチャが描画される")
		SET MENU ITEM PARAMETER($menu; -1; "Comand4")
		$cmd:=Dynamic pop up menu($menu)
		
		If ($cmd="paste")
			GET PICTURE FROM PASTEBOARD($pict)
			OBJECT SET VALUE("Input Pict"; $pict)
		End if 
		
		SET TIMER(180)  //3秒
		
	: (FORM Event.code=On Timer)
		
		//描画された3秒後に呼ばれる
		SET TIMER(0)  //タイマーをクリア
		
		//表示している画像を消去
		var $pict : Picture  //空のピクチャ変数
		OBJECT SET VALUE("Output Pict"; $pict)  //空のピクチャ変数で消去
		WA SET PAGE CONTENT(*; "Web Area"; ""; "")  //空のソースで消去
		
End case 
```
