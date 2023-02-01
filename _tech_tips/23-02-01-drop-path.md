---
layout: technote
title: "ファイル／フォルダーのドロップ"
position: 20230201
date: 2023-02-01 0:00:00
categories: ヒント
tags: drop collection listbox file folder DynamicForm
version: 18, 19
---

４Ｄのフォームオブジェクトにファイルやフォルダーをドラッグ・アンド・ドロップしたとき、４Ｄの自動ドロップでは頼ることはできません。
`Get file from pasteboard`コマンドを使い、処理する必要があります。

<!--more-->

実際にフォームを用意して、試してみました。

## サンプル

このサンプルでは、１つの入力フィールドに、エクスプローラーやFinderからドラッグアンドドロップしてパスを受け取ります。
受け取ったパスからフォルダーを特定して、そのフォルダーにあるファイルやフォルダーのリストをリストボックスに表示します。

フォームはダイナミックフォームとしてメソッドに記述してあるので、たった１つのメソッドで動作するようになっています。

```4d
Case of 
	: (Count parameters=0) & (OB Is empty(Form))
		
		//リストボックス本体
		$listbox_columns:=New collection  //カラム設定用
		$listbox:=New object("left"; 20; "top"; 70; "width"; 700; "height"; 450)  //表示位置
		$listbox.type:="listbox"  //リストボックス
		$listbox.listboxType:="collection"  //コレクション型リストボックス
		$listbox.dataSource:="Form.files"  //リストボックスに割り当てる変数
		$listbox.sizingX:="grow"  //幅可変
		$listbox.sizingY:="grow"  //高さ可変
		$listbox.focusable:=False  //入力不可
		$listbox.lockedColumnCount:=1  //横スクロールしないカラム
		$listbox.staticColumnCount:=1  //ドラッグさせないカラム
		$listbox.columns:=$listbox_columns  //カラム設定の参照をセットしておく
		
		//リストボックスのカラム設定
		$listbox_columns.push(New object(\
		"header"; New object("text"; "📦"; "name"; "Header file seq"); \
		"name"; "Column file icon"; \
		"dataSource"; "This.getIcon()"; \
		"dataSourceTypeHint"; "picture"; \
		"pictureFormat"; "proportionalTopLeft"; \
		"resizable"; False; \
		"enterable"; False; \
		"width"; 22\
		))
		$listbox_columns.push(New object(\
		"header"; New object("text"; "名前"; "name"; "Header file name"); \
		"name"; "Column file name"; \
		"dataSource"; "This.fullName"; \
		"dataSourceTypeHint"; "text"; \
		"width"; 413\
		))
		$listbox_columns.push(New object(\
		"header"; New object("text"; "作成日"; "name"; "Header file name"); \
		"name"; "Column file timestamp"; \
		"dataSource"; "String(This.creationDate)+\" \"+String(Time(This.creationTime))"; \
		"dataSourceTypeHint"; "text"; \
		"resizable"; False; \
		"width"; 125\
		))
		$listbox_columns.push(New object(\
		"header"; New object("text"; "変更日"; "name"; "Header file name"); \
		"name"; "Column file timestamp"; \
		"dataSource"; "String(This.modificationDate)+\" \"+String(Time(This.modificationTime))"; \
		"dataSourceTypeHint"; "text"; \
		"resizable"; False; \
		"width"; 125\
		))
		
		//ページを組み立てる
		$page:=New object  //フォームのページデザインをセットするオブジェクト変数
		$page.objects:=New object
		//リストボックス
		$page.objects.ListBox:=$listbox
		//リストボックスの説明
		$page.objects.Text_ListBox:=New object("left"; 20; "top"; 50; "width"; 200; "height"; 18)
		$page.objects.Text_ListBox.type:="text"
		$page.objects.Text_ListBox.text:="ファイルリスト"
		//入力オブジェクト
		$page.objects.Input_Path:=New object("left"; 110; "top"; 20; "width"; 610; "height"; 18)
		$page.objects.Input_Path.type:="input"
		$page.objects.Input_Path.dataSource:="Form.path"
		$page.objects.Input_Path.sizingX:="grow"
		$page.objects.Input_Path.dropping:="custom"
		$page.objects.Input_Path.method:=Current method name
		$page.objects.Input_Path.events:=New collection("onDataChange"; "onDrop")
		//入力オブジェクトの説明
		$page.objects.Text_Path:=New object("left"; 20; "top"; 20; "width"; 200; "height"; 18)
		$page.objects.Text_Path.type:="text"
		$page.objects.Text_Path.text:="フォルダパス :"
		//ボタン
		$page.objects.Button_Cancel:=New object("left"; 620; "top"; 560; "width"; 100; "height"; 35)
		$page.objects.Button_Cancel.type:="button"
		$page.objects.Button_Cancel.text:="閉じる"
		$page.objects.Button_Cancel.focusable:=False
		$page.objects.Button_Cancel.sizingX:="move"
		$page.objects.Button_Cancel.sizingY:="move"
		$page.objects.Button_Cancel.method:=Current method name
		$page.objects.Button_Cancel.events:=New collection("onClick")
		
		//フォームを組み立てる
		$dynForm:=New object("rightMargin"; 20; "bottomMargin"; 20)
		$dynForm.pages:=New collection(New object; $page)
		$dynForm.events:=New collection("onLoad"; "onTimer")
		$dynForm.method:=Current method path
		$dynForm.windowTitle:="ファイルリスト"
		$dynForm.windowMinWidth:=500
		$dynForm.windowMinHeight:=500
		
		//ダイアログの表示
		SET MENU BAR(1)
		$ref:=Open form window($dynForm; Plain form window; On the left; At the top)
		DIALOG($dynForm; New object("date"; Current date))
		CLOSE WINDOW($ref)
		
	: (FORM Event.code=On Load)  //フォームがメモリにロードされた
		//フォームの初期化
		Form.path:=""
		Form.files:=New collection
		
	: (FORM Event.code=On Timer)  //リストボックスの更新がリクエストされた
		SET TIMER(0)
		//リストボックスを更新
		Form.files:=Folder(Form.path).files(fk ignore invisible)  //すべてのファイルをコレクションに入れる
		Form.files.combine(Folder(Form.path).folders(fk ignore invisible))  //すべてのフォルダーをコレクションに加える
		Form.files:=Form.files.orderBy("name asc")  //名前で並び替え
		
	: (FORM Event.code=On Clicked) & (Num(OBJECT Get value("Button_Cancel"))=1)  //キャンセルボタンが押された
		//画面を閉じる
		CANCEL
		
	: (FORM Event.code=On Data Change)  //パスが入力された
		//ファイルパスフォーマットをPOSIXに統一する
		If (Form.path=("@"+Folder separator+"@"))
			Form.path:=Convert path system to POSIX(Form.path)
		End if 
		SET TIMER(1)  //リストを更新
		
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
		Case of 
			: ($paths.length>1)  //有効なパスが複数ある
				$folder:=Folder($paths[0]; fk platform path).parent  //１つ上のフォルダーパスを返す
			: (Folder($paths[0]; fk platform path).exists)  //フォルダーのパスのとき
				$folder:=Folder($paths[0]; fk platform path)
			Else   //ファイルのパスのとき
				$folder:=Folder($paths[0]; fk platform path).parent  //１つ上のフォルダーパスを返す
		End case 
		//画面の更新
		OBJECT SET VALUE(OBJECT Get name; $folder.path)  //ファイルパスの値を更新
		SET TIMER(1)  //ファイルリストを更新
		
End case 
```

## プログラム上のポイント

プログラムそのものは、`Get file from pasteboard`コマンドのおかげで難易度は高くありませんが、実際に利用するとなると色々と注意するべき点があることに気がつきます。

ドロップされたファイルパスは、基本的に複数のパスを前提としています。
ですので、１つのファイルパスだけを扱おうとすると、上手くいかないことが想定されます。
サンプルでは、有効なパスをコレクション化することで、扱いをシンプルにすることができました。

ファイル／フォルダーのリスト作成には、`File`／`Folder`コマンドを利用することで、ファイル／フォルダーのリストもコレクションとして表現しています。
ファイルオブジェクトのプロパティをそのままリストボックスで利用していますので、セルを表示させるためのコードは、すべてリストボックスの式として表現しています。
