---
layout: technote
title: "すべてのテーブルのデータにアクセスする方法（その１）"
position: 20221102001
date: 2022-11-02 00:00:00
categories: ヒント
tags: DynamicForm listbox ORDA
version: 19
---

すべてのテーブルのデータにアクセスするためのメソッドサンプルを紹介します。

<!--more-->

## 説明

ビルドしたデータベースでは、デザインモードのカレントテーブル表示が利用できません。
また、デザインモードのカレントテーブル表示は、既存フォームを利用してデータにアクセスするため、フォームを用意しないと利用することができません。

そこで、すべてのデータにアクセスできるリストボックスを表示するサンプルを作成してみました。

このサンプルは、たった１つのメソッドで完結しています。フォームを用意しなくとも、リストボックスですべてのデータにアクセスできるダイアログウィンドウを表示します。
このサンプルのコードを記述したメソッドをビルドしたアプリケーションに、密かに忍ばせておくことで、データのメンテナンスを簡易ながらも行うことができるようになります。

注意点としては、ORDAを利用しているので、主キーが設定されていないテーブルに対しては、利用することはできません。

## サンプル

```
Case of 
	: (FORM Event=Null)
		
		//リストボックス（テーブルリスト用）
		$lb_tables:=New object("type"; "listbox"; \
		"left"; 20; "top"; 20; "width"; 150; "height"; 500; \
		"listboxType"; "collection"; \
		"dataSource"; "Form.list_table"; \
		"currentItemSource"; "Form.tbl_selected"; \
		"selectionMode"; "single"; \
		"sizingY"; "grow"; \
		"sizingX"; "grow"; \
		"scrollbarHorizontal"; "hidden"; \
		"focusable"; False; \
		"events"; New collection("onSelectionChange"); \
		"method"; Current method name; \
		"columns"; New collection(\
		New object(\
		"header"; New object("text"; "Table list"; "name"; "Header tabele list"); \
		"name"; "Column tabele list"; \
		"dataSource"; "This.name"; \
		"width"; 150; \
		"enterable"; False\
		)))
		
		//リストボックス（レコード表示用）
		$lb_records:=New object("type"; "listbox"; \
		"left"; 180; "top"; 70; "width"; 700; "height"; 450; \
		"listboxType"; "collection"; \
		"sizingX"; "grow"; \
		"sizingY"; "grow"; \
		"resizingMode"; "legacy"; \
		"dataSource"; "Form.current.selection"; \
		"currentItemSource"; "Form.rec_selected"; \
		"currentItemPositionSource"; "Form.rec_selected_pos"; \
		"selectedItemsSource"; "Form.rec_selection"; \
		"events"; New collection("onSelectionChange"); \
		"method"; Current method name\
		)
		
		//ページを組み立てる
		$page:=New object  //フォームのページデザインをセットするオブジェクト変数
		$page.objects:=New object
		$page.objects["List Box Table List"]:=$lb_tables
		$page.objects["List Box Record List"]:=$lb_records
		$page.objects["Splitter"]:=New object("type"; "splitter"; "left"; 172; "top"; 20; "width"; 3; "height"; 500; "sizingY"; "grow")
		$page.objects["Button Add Record"]:=New object("type"; "button"; "left"; 180; "top"; 20; "width"; 35; "height"; 35; "focusable"; False; "text"; "+"; "events"; New collection("onClick"))
		$page.objects["Button Delete Records"]:=New object("type"; "button"; "left"; 220; "top"; 20; "width"; 35; "height"; 35; "focusable"; False; "text"; "-"; "events"; New collection("onClick"))
		$page.objects["Button All Records"]:=New object("type"; "button"; "left"; 260; "top"; 20; "width"; 35; "height"; 35; "focusable"; False; "text"; "A"; "events"; New collection("onClick"))
		$page.objects["Button Query"]:=New object("type"; "button"; "left"; 300; "top"; 20; "width"; 35; "height"; 35; "focusable"; False; "text"; "Q"; "events"; New collection("onClick"))
		//フォームを組み立てる
		$dynForm:=New object("rightMargin"; 20; "bottomMargin"; 20)
		$dynForm.pages:=New collection(New object; $page)
		$dynForm.events:=New collection("onLoad"; "onClick")
		$dynForm.method:=Current method name
		$dynForm.windowTitle:="Table Viwer"
		
		//ダイアログの表示
		SET MENU BAR(1)
		$ref:=Open form window($dynForm; *)
		DIALOG($dynForm)
		
	: (FORM Event.code=On Load)
		//フォームの初期化
		Form.list_table:=New collection
		Form.tables:=New object
		For each ($table; ds)
			Form.list_table.push(New object("name"; $table; "table"; ds[$table]; "selection"; ds[$table].all()))
		End for each 
		OBJECT SET ENABLED(*; "Button@"; False)
		Form.current:=New object("name"; "")
		
	: (FORM Event.code=On Clicked)
		
		Case of 
			: (Num(OBJECT Get value("Button Add Record"))=1)  //レコード追加ボタンが押されたとき
				$entity:=Form.current.table.new()  //新しいエンティティを用意
				If ($entity.save().success)  //保存した結果が成功ならエンティティをセレクションに加える
					$entitySelection:=Form.current.selection.copy()  //共有可能なセレクションからローカルにコピー
					$entitySelection.add($entity)  //ローカルのセレクションをアップデート
					Form.current.selection:=$entitySelection  //共有可能なセレクションに戻す
					LISTBOX SELECT ROW(*; "List Box Record List"; Form.current.selection.length)  //新しく追加したエンティティをハイライトする
					OBJECT SET SCROLL POSITION(*; "List Box Record List"; Form.current.selection.length)  //新しく追加したエンティティを表示する
				End if 
				
			: (Num(OBJECT Get value("Button Delete Records"))=1)  //削除ボタンが押されたとき
				CONFIRM(Choose(Form.rec_selection.length=1; "選択しているレコードを削除しますか？"; "選択中の"+String(Form.rec_selection.length)+"件のレコードを削除しますか？"); "削除する")
				If (OK=1)
					$sel:=Form.rec_selection.drop()
					If ($sel.length#0)
						ALERT("削除できなかったレコードが"+String($sel.length)+"件ありました")
					End if 
				End if 
				Form.current.selection:=Form.current.selection
				
			: (Num(OBJECT Get value("Button All Records"))=1)  //全レコード表示ボタンが押されたとき
				Form.current.selection:=ds[Form.current.name].all()
				
			: (Num(OBJECT Get value("Button Query"))=1)  //クエリボタンが押されたとき
				USE ENTITY SELECTION(Form.current.selection)  //クエリダイアログのためにセレクションを作成する
				QUERY(Table(Form.current.table.getInfo().tableNumber)->)  //クエリダイアログを表示
				If (OK=1)
					Form.current.selection:=Create entity selection(Table(Form.current.table.getInfo().tableNumber)->)  //結果をエンティティセレクションに戻す
				End if 
				
		End case 
		OBJECT SET ENABLED(*; "Button Delete Records"; (Num(Form.rec_selection.length)#0))  //削除ボタンの表示
		
	: (FORM Event.code=On Selection Change)
		
		Case of 
			: (OBJECT Get name="List Box Table List") & (Form.tbl_selected=Null)  //テーブルの選択が外されたとき
				SET WINDOW TITLE("Table Viwer")
				Form.rec_selection:=Form.current.table.newSelection()  //選択エンティティセレクションを空にする
				Form.current:=New object("name"; "")  //セレクション自体を空にする
				OBJECT SET ENABLED(*; "Button@"; False)
				LISTBOX DELETE COLUMN(*; "List Box Record List"; 1; LISTBOX Get number of columns(*; "List Box Record List"))
				
			: (OBJECT Get name="List Box Table List")  //テーブルの選択が変更されたとき
				SET WINDOW TITLE("Table : "+Form.current.name)
				Form.current:=Form.tbl_selected
				OBJECT SET ENABLED(*; "Button@"; True)
				LISTBOX DELETE COLUMN(*; "List Box Record List"; 1; LISTBOX Get number of columns(*; "List Box Record List"))  //カラムをすべて削除
				//リストボックスにフィールドに対応したカラムを追加する
				var $nil : Pointer
				For each ($field; Form.current.table)
					$colPosition:=LISTBOX Get number of columns(*; "List Box Record List")+1
					$colName:="Colomun_"+Form.current.name+"_"+$field
					$formula:="This."+$field
					$dataType:=Form.current.table[$field].fieldType
					$headerName:="Header_"+Form.current.name+"_"+$field
					LISTBOX INSERT COLUMN FORMULA(*; "List Box Record List"; $colPosition; $colName; $formula; $dataType; $headerName; $nil)
					OBJECT SET TITLE(*; $headerName; $field)
				End for each 
				
		End case 
		OBJECT SET ENABLED(*; "Button Delete Records"; (Num(Form.rec_selection.length)#0))  //削除ボタンの表示
		
End case 
```

## サンプルコードの説明

フォームを作成することなくフォームを表示するために、ダイナミックフォームをオブジェクト変数に組み立てて、DIALOGコマンドに渡しています。

組み立てたダイナミックフォームのフォームメソッドは、methodプロパティにCurrent method nameを渡すことで、自分自身がフォームメソッドとして組み込まれている点に注目してください。
そのためフォームが表示された後は、フォームイベントが発生する都度、自分自身が呼ばれてフォームメソッドとして機能することになります。

ボタンなどのオブジェクトメソッドも同様に、自分自身をインストールしていますので、ボタンが押されたときもフォームイベントを受け取り動作することになります。
このようにして、フォームメソッドやボタンメソッドの機能を含めたメソッドを書くことで、たった１つのメソッドでダイアログを表示して利用することが可能になります。
