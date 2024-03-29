---
layout: technote
title: "SQLのシステムテーブルを利用してテーブルやフィールドの情報を得る"
position: 20221216
date: 2022-12-16 00:00:00
categories: ヒント
tags: sql
version: 17, 18, 19
---

ORDAを使いテーブルやフィールドの情報を得る、あるいはEXPORT STRUCTUREを使いXMLでストラクチャの構成を得ることができますが、テーブル、フィールド、インデックスの情報だけならSQLのシステムテーブルを使うと意外と簡単に取得できます。

<!--more-->

## システムテーブル

SQLにはシステムテーブルと呼ぶシステム固有の情報を収めたテーブル[^st]が定義されています。

[^st]: システムテーブルは、システム定義を参照するためのもので、変更や削除を行うことはできません


| テーブル名 | 内容 |
|:---|:---|
| _USER_TABLES | データベースのユーザテーブルを記述 |
| _USER_COLUMNS | データベースのユーザテーブルのカラムを記述 |
| _USER_INDEXES | データベースのユーザインデックスを記述します
| _USER_IND_COLUMNS | データベースのユーザインデックスのカラムを記述 |
| _USER_CONSTRAINTS | データベースの整合性制約を記述 |
| _USER_CONS_COLUMNS | データベースのユーザ制約のカラムを記述 |
| _USER_SCHEMAS | データベースのスキーマを記述 |
| _USER_VIEWS | データベースユーザーのビューを記述 |
| _USER_VIEW_COLUMNS | データベースユーザのビューの列を記述 |

ここでは説明を省きますので、どのような内容が記述されているかは、お使いのバージョンのSQLリファレンスのシステムテーブルの章をご参照ください。

## 利用方法

SQLのテーブルですから、SQLで参照する必要があります。
例えば、すべてのテーブル名とテーブル番号を得るには、次のようにします。

```4d
// 変数定義
ARRAY TEXT($tableName; 0)  // テーブル名を収める配列
ARRAY LONGINT($tableNo; 0)  // テーブル番号を収める配列

// システムテーブルにアクセス
Begin SQL
	SELECT TABLE_NAME, TABLE_ID
	FROM _USER_TABLES
	INTO :$tableName, :$tableNo
End SQL
```

この程度なら、ORDAを使えば簡単にコレクション化できますが、システムテーブルの存在意義はもっと奥深いものがあります。

## 例題

先程の例は、小手調べといったとろです。

SQLですから、JOINで複数のテーブルを連結して検索するなどの利用も考えられます。
また、SQLとリストボックスの親和性は高く、SQL実行結果を簡単にリストボックスで表示できる点も魅力的です。

例えば、重複不可のフィールドがどこにあるかを調べてリストボックスで表示したいようなとき、次のようなコードで表示することができます。

```4d
Case of 
	: (FORM Event=Null)
		
		// リストボックスの定義
		$page:=New object("objects"; New object)
		$page.objects["List Box"]:=New object(\
		"type"; "listbox"; \
		"left"; 5; "top"; 5; "width"; 500; "height"; 500; \
		"sizingY"; "grow"; \
		"scrollbarHorizontal"; "hidden"; \
		"dataSource"; "SystemTable"; \
		"enterable"; False; \
		)
		
		// 表示するためのフォームを組み立てる
		$dynForm:=New object(\
		"rightMargin"; 5; "bottomMargin"; 5; \
		"windowSizingX"; "fixed"; \
		"events"; New collection("onLoad"); \
		"method"; Current method name; \
		)
		$dynForm.pages:=New collection($page)
		
		$ref:=Open form window($dynForm)
		DIALOG($dynForm)
		
	: (FORM Event.code=On Load)
		
		// リストフォームにシステムテーブルの情報を表示
		Begin SQL
			SELECT TABLE_NAME,TABLE_ID,COLUMN_NAME,COLUMN_ID
			FROM _USER_COLUMNS
			WHERE UNIQUENESS = True
			INTO :SystemTable
		End SQL
		
End case 
```

上の例題では、リストボックスにプロセス変数"SystemTable"を割り当てています。
そして、SQLで検索した結果を、INTO句で変数SystemTableに出力しています。

その結果SELECTで指定したカラムが、そのままリストボックスに表示されます。
リストボックスとSQLの親和性が高いことが、よく分かると思います。

## 応用編

先程の例題で、すべての重複不可のフィールドがリスト化できました。
ですが、そのリストには主キーが含まれています。

もし主キーを省いてリスト化したいときは、どのようにすればよいのでしょうか。

主キーの情報は_USER_CONSTRAINTSテーブルに含まれていますが、このテーブルにはテーブルの情報はありますが、フィールド（カラム）の情報が含まれていません。
フィールドのリストを作るためには、複数のテーブルをまたいでの検索を考えることになります。
直ぐに思いつくのは結合（JOIN）を使うことですが、ここではちょっと別の方法を使用してみました。

この例題では、別のテーブルの検索結果を用いて検索を行うINを使用しています。
テーブルとフィールドの複数の条件を利用するため、同じ条件のSELECTを２つ使います。
少し助長な感じもしますが、これで目的を果たすことができます。

```4d
Case of 
	: (FORM Event=Null)
		
		// リストボックスの定義
		$page:=New object("objects"; New object)
		$page.objects["List Box"]:=New object(\
		"type"; "listbox"; \
		"left"; 5; "top"; 5; "width"; 500; "height"; 500; \
		"sizingY"; "grow"; \
		"scrollbarHorizontal"; "hidden"; \
		"dataSource"; "SystemTable"; \
		"enterable"; False; \
		)
		
		// 表示するためのフォームを組み立てる
		$dynForm:=New object(\
		"rightMargin"; 5; "bottomMargin"; 5; \
		"windowSizingX"; "fixed"; \
		"events"; New collection("onLoad"); \
		"method"; Current method name; \
		)
		$dynForm.pages:=New collection($page)
		
		$ref:=Open form window($dynForm)
		DIALOG($dynForm)
		
	: (FORM Event.code=On Load)
		
		// リストフォームにシステムテーブルの情報を表示
		Begin SQL
			SELECT TABLE_NAME,TABLE_ID,COLUMN_NAME,COLUMN_ID
			FROM _USER_COLUMNS
			WHERE UNIQUENESS = True
			AND NOT (
			  (
			    _USER_COLUMNS.TABLE_ID IN (
			      SELECT _USER_CONS_COLUMNS.TABLE_ID
			      FROM _USER_CONS_COLUMNS
			      INNER JOIN _USER_CONSTRAINTS
			      ON _USER_CONS_COLUMNS.CONSTRAINT_ID = _USER_CONSTRAINTS.CONSTRAINT_ID
			      WHERE _USER_CONSTRAINTS.CONSTRAINT_TYPE = 'P'
			    )
			  AND
			    _USER_COLUMNS.COLUMN_ID IN (
			      SELECT _USER_CONS_COLUMNS.COLUMN_ID
			      FROM _USER_CONS_COLUMNS
			      INNER JOIN _USER_CONSTRAINTS
			      ON _USER_CONS_COLUMNS.CONSTRAINT_ID = _USER_CONSTRAINTS.CONSTRAINT_ID
			      WHERE _USER_CONSTRAINTS.CONSTRAINT_TYPE = 'P'
			    )  
			  )
			)
			INTO :SystemTable
		End SQL
		
End case 
```

このように、一見するとリスト化できないような印象を受けるリストも、上手くテーブルの関係を紐解くと必ずSQLで表現することができるはずです。
４Ｄの一般的なクエリと比較すると、まるでパズルを組み立てたようになりますが、SQLとリストボックスの親和性の高さを利用できる利点は確かにあると思います。
