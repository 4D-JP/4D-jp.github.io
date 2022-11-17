---
layout: technote
title: "埋込Webレンダリングエンジンのバージョン情報"
position: 20221117001
date: 2022-11-17 00:00:00
categories: ヒント
tags: webarea DynamicForm
version: 18 19
---

埋込Webレンダリングエンジンのバージョン情報を表示するためのメソッドサンプルを紹介します。

このメソッドを実行しますと、4Dで利用している埋込Webレンダリングエンジンのバージョンが表示されます。
JavaScriptを実行するようなとき参考にして、プログラミングを的確に行うことができます。

```4d
Case of 
	: (FORM Event=Null)
		
		//ページを組み立てる
		$page:=New object  //フォームのページデザインをセットするオブジェクト変数
		$page.objects:=New object
		$page.objects["Web Area"]:=New object(\
		"type"; "webArea"; \
		"left"; 0; "top"; 0; "width"; 700; "height"; 450; \
		"sizingY"; "grow"; "sizingX"; "grow"; \
		"webEngine"; "embedded"; \
		"method"; Current method name; \
		"events"; New collection("onLoad"))
		//フォームを組み立てる
		$dynForm:=New object("rightMargin"; 0; "bottomMargin"; 0)
		$dynForm.pages:=New collection(New object; $page)
		
		//ダイアログの表示
		SET MENU BAR(1)
		$ref:=Open form window($dynForm; *)
		DIALOG($dynForm)
		
	: (Form event code=On Load)
		
		WA OPEN URL(*; "Web Area"; "chrome://version/")
		
End case 
```

