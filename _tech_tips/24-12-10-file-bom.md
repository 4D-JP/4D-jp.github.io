---
layout: technote
title: "BOM付きファイル"
position: 20241210001
date: 2024-12-10 00:00:00
categories: ヒント
tags: BOM File FileHandle
version: 19R7 20
---

４ＤはBOMが設定できる文字セット（例:UTF-8）でファイルを生成するとき、必要に応じてBOM（Byte Order Mark）を付けます。
ただし、例外もあります。

<!--more-->

## 説明

４ＤはBOMが設定できる文字セット（例:UTF-8）でファイルを生成するとき、必要に応じてBOMを付けます。
BOMをセットしたくないようなときは、文字セット名称に続いて接尾辞`-no-bom`を付け加える必要があります。
例えば、BOMなしで`"UTF-8"`でファイルを生成するときには、文字セットとして`"UTF-8-no-bom"`を渡す必要があります。

しかし、これには例外もあります。

例えば、次のようなコードを実行したとき、それぞれBOM付き、BOM無しになります。

```4d
//BOMが付くケース
var $fileObject : 4D.File
$fileObject:=File(Folder(fk desktop folder).path+"test1.csv")  //デスクトップに作成
$fileObject.setText("TEST"; "utf-8")

//BOMが付かないケース
var $fileObject : 4D.File
$fileObject:=File(Folder(fk desktop folder).path+"test2.csv")  //デスクトップに作成
$fileObject.setText(""; "utf-8")
```

このケースではの２種類のファイル生成コードの違いは、実際にテキストをセットしたかどうかになります。
セットするテキストが無いときは、BOMが付きません。

同様にファイルハンドルを利用して、テキストを追加していくようなケースでもBOMが付くことはありません。
そのようなBOMが付かないケースでは、自力でBOMga付くようにコーディングする必要があります。

例えば、次のコードは必要な行数分ループしてCSVファイルを生成しますが、BOMを自力で先頭に付けています。

```4d
/*
	4D 19R7以降で動作
*/
//mark: ファイルオブジェクトの準備
var $csv : 4D.File
$csv:=File(Folder(fk desktop folder).path+"test.csv")  //デスクトップに作成
If ($csv.exists)
	$csv.delete()  //既に存在するときは削除
End if 
//mark: 自力でUTF-8用のBOMを用意
SET BLOB SIZE($BOM; 3)
$BOM{0}:=0x00EF
$BOM{1}:=0x00BB
$BOM{2}:=0x00BF
$csv.setContent($BOM)  //BOMを書き込み
//mark: 追加書き込みの準備
$options:=New object
$options.mode:="append"  //追加書き込み
$options.charset:="UTF-8"  //UTF-8の場合は指定しなくても良い
$options.breakModeWrite:="crlf"  //改行はCR/LFにする
$f:=$csv.open($options)  //追加書き込みでファイルハンドルを生成
//mark: 行を追加書き込みする
For ($i; 1; 10)
	$text:="カラム１番め\tカラム２番め\tカラム３番め"  //１行分のテキスト（改行コードは不要）
	$f.writeLine($text)  //テキストの書き込み（改行コードはここで自動で付加される）
End for 
```
