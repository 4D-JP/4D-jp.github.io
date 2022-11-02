---
layout: technote
title: "すべてのテーブルのデータにアクセスする方法（その２）"
position: 20221102002
date: 2022-11-02 00:00:00
categories: ヒント
tags: DynamicForm listbox orda
version: 19
---

すべてのテーブルのデータにアクセスするためのメソッドサンプルを紹介します。

<!--more-->

## 説明

[その１](../22-11-02-modify-all-data/)では、すべてのテーブルのデータにアクセスするためのリストボックスを利用するサンプルを紹介しましたが、今回はすでに作成された既存フォームを使用して表示するサンプルを紹介します。

[その１](../22-11-02-modify-all-data/)と同様に、このサンプルも、たった１つのメソッドで完結しています。
既存の入力／出力フォームを利用しますので、フォームを準備する必要がありますが、使い勝手は標準のカレントテーブル表示に近いものになります。

注意点としては、[その１](../22-11-02-modify-all-data/)と同様にORDAを使用しているので、主キーが設定されていないテーブルに対しては、利用することはできません。

## サンプル

```
Case of 
	: (FORM Event=Null)
		
		//入出力フォームの名称をテーブルごとにオブジェクトにまとめる
		ARRAY LONGINT($pos; 0)
		ARRAY LONGINT($len; 0)
		$form_list:=New object
		EXPORT STRUCTURE($xml_text)
		$start:=1
		While (Match regex("(?m)(<table [\\s\\S]+?</table>)"; $xml_text; $start; $pos; $len))
			$start:=$pos{0}+$len{0}
			$element:=Substring($xml_text; $pos{1}; $len{1})
			$info:=New object
			If (Match regex("(?m)<table.*? id=\"(.+?)\""; $element; 1; $pos; $len))
				$info.id:=Substring($element; $pos{1}; $len{1})
			End if 
			If (Match regex("(?m)<table_extra.*? input_form=\"(.+?)\""; $element; 1; $pos; $len))
				$info.input_form:=Substring($element; $pos{1}; $len{1})
			End if 
			If (Match regex("(?m)<table_extra.*? output_form=\"(.+?)\""; $element; 1; $pos; $len))
				$info.output_form:=Substring($element; $pos{1}; $len{1})
			End if 
			If (Match regex("(?m)<table.*? name=\"(.+?)\""; $element; 1; $pos; $len))
				$form_list[Substring($element; $pos{1}; $len{1})]:=$info
			End if 
		End while 
		$keys:=OB Keys($form_list)
		
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
		
		//ページを組み立てる
		$page:=New object  //フォームのページデザインをセットするオブジェクト変数
		$page.objects:=New object
		$page.objects["List Box Table List"]:=$lb_tables
		$page.objects["Subform"]:=New object("type"; "subform"; "left"; 180; "top"; 70; "width"; 700; "height"; 450; "sizingY"; "grow"; "sizingX"; "grow"; "table"; $form_list[$keys[0]].id; "listForm"; $form_list[$keys[0]].output_form; "doubleClickInRowAction"; "editSubrecord")
		$page.objects["Splitter"]:=New object("type"; "splitter"; "left"; 172; "top"; 20; "width"; 3; "height"; 500; "sizingY"; "grow")
		$page.objects["Button Add Record"]:=New object("type"; "button"; "left"; 180; "top"; 20; "width"; 35; "height"; 35; "focusable"; False; "text"; "+"; "action"; "addSubrecord")
		$page.objects["Button Delete Records"]:=New object("type"; "button"; "left"; 220; "top"; 20; "width"; 35; "height"; 35; "focusable"; False; "text"; "-"; "action"; "deleteSubrecord")
		$page.objects["Button All Records"]:=New object("type"; "button"; "left"; 260; "top"; 20; "width"; 35; "height"; 35; "focusable"; False; "text"; "A"; "events"; New collection("onClick"))
		$page.objects["Button Query"]:=New object("type"; "button"; "left"; 300; "top"; 20; "width"; 35; "height"; 35; "focusable"; False; "text"; "Q"; "events"; New collection("onClick"))
		$page.objects["No Form"]:=New object("type"; "text"; "left"; 250; "top"; 150; "width"; 240; "height"; 20; "text"; "表示に利用できるフォームがありません")
		//フォームを組み立てる
		$dynForm:=New object("rightMargin"; 20; "bottomMargin"; 20)
		$dynForm.pages:=New collection(New object; $page)
		$dynForm.events:=New collection("onLoad"; "onClick")
		$dynForm.method:=Current method name
		
		//ダイアログの表示
		$param:=New object("formInfo"; $form_list)
		SET MENU BAR(1)
		$ref:=Open form window($dynForm; *)
		DIALOG($dynForm; $param)
		
	: (FORM Event.code=On Load)
		//フォームの初期化
		Form.list_table:=New collection
		Form.tables:=New object
		For each ($table; ds)
			Form.list_table.push(New object("name"; $table; "table"; ds[$table]; "selection"; ds[$table].all()))
			ALL RECORDS(Table(ds[$table].getInfo().tableNumber)->)
		End for each 
		OBJECT SET VISIBLE(*; "Subform"; False)
		OBJECT SET VISIBLE(*; "No Form"; False)
		OBJECT SET ENABLED(*; "Button@"; False)
		Form.current:=New object("name"; "")
		
	: (FORM Event.code=On Clicked)
		
		Case of 
			: (Num(OBJECT Get value("Button All Records"))=1)  //全レコード表示ボタンが押されたとき
				ALL RECORDS(Table(Form.current.table.getInfo().tableNumber)->)
				
			: (Num(OBJECT Get value("Button Query"))=1)  //クエリボタンが押されたとき
				QUERY(Table(Form.current.table.getInfo().tableNumber)->)  //クエリダイアログを表示
				
		End case 
		
	: (FORM Event.code=On Selection Change)
		
		Case of 
			: (OBJECT Get name="List Box Table List") & (Form.tbl_selected=Null)  //テーブルの選択が外されたとき
				SET WINDOW TITLE("Table Viwer")
				OBJECT SET SUBFORM(*; "Subform"; New object; "")
				OBJECT SET VISIBLE(*; "Subform"; False)
				OBJECT SET VISIBLE(*; "No Form"; False)
				OBJECT SET ENABLED(*; "Button@"; False)
				
			: (OBJECT Get name="List Box Table List")  //テーブルの選択が変更されたとき
				Form.current:=Form.tbl_selected
				SET WINDOW TITLE("Table : "+Form.current.name)
				OBJECT SET ENABLED(*; "Button@"; True)
				$input_form:=String(Form.formInfo[Form.current.name].input_form)
				$output_form:=String(Form.formInfo[Form.current.name].output_form)
				If ($output_form="")
					OBJECT SET VISIBLE(*; "Subform"; False)
					OBJECT SET VISIBLE(*; "No Form"; True)
					OBJECT SET SUBFORM(*; "Subform"; New object; "")
				Else 
					OBJECT SET VISIBLE(*; "Subform"; True)
					OBJECT SET VISIBLE(*; "No Form"; False)
					OBJECT SET SUBFORM(*; "Subform"; Table(Num(Form.formInfo[Form.current.name].id))->; $input_form; $output_form)
				End if 
				
		End case 
		
End case 
```

## サンプルコードの説明

[すべてのテーブルのデータにアクセスする方法（その１）](../22-11-02-modify-all-data/)を参照してください。
