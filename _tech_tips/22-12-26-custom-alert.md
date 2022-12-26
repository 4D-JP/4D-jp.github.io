---
layout: technote
title: "独自のアラートを用意してすべてのALERTと入れ替えて使う"
position: 20221226
date: 2022-12-26 00:00:00
categories: ヒント
tags: webarea
version: 17, 18, 19
---

４ＤのALERT、CONFIRM、Requestはとても便利ですが、あるとき独自のアラートで作り直したいと思うことがあるかもしれません。
そのようなとき一番問題になるのは、すでに記述したALERTコマンドをすべて書き換えることです。
大量のコマンドを書き換えるのは、大変な労力を要してしまいます。

ですが、書き換えるメソッドを用意して実行することができれば、メソッドを作成するに値する労力を削減できるかもしれません。

<!--more-->

## 目標

ここでは、ALERT、CONFIRM、Requestを独自のメソッドと入れ替えて、独自のダイアログを表示することを目標にします。

そのためには、この３つのダイアログを表示するメソッドを用意して、さらにはインストールするメソッドと、もとに戻すアンインストールメソッドの２つ、合計５つのメソッドを用意することが必要です。

## コマンドとメソッドの対比

コマンドと入れ替えるメソッド名は、次のとおりです。

| コマンド | メソッド |
|:---|:---|
| ALERT | \_ALERT_ |
| CONFIRM | \_CONFIRM_ |
| Request | \_Request_ |

パラメーターの並びは、基本的に同じですが、メソッドをコンポーネント化して利用できるように、メソッドにはシステム変数のOK変数へのポインターも渡すようにします。

###  \_ALERT_メソッド

```4d
/*
	
	目的：
	ALERTと同じ動作をフォームを使って表現するすることで、デザインのカスタマイズを行えるようにする
	
	引数：
	$ok：システム変数OKのポインター（コンポーネントでも動作するように考慮）
	$message：表示するメッセージ
	$button：OKボタンに表示する文字列（省略可）
	
*/

#DECLARE($ok : Pointer; $message : Text; $button : Text)

$fontSize:=0  //標準フォントサイズ

Case of 
	: (Count parameters=0)  //単独でメソッドを実行してテストするとき
		$message:="TEST "*100
		$button:="OK"
	: (Count parameters<3)  //ボタンタイトルが指定されなかったとき
		$button:="OK"
End case 

//フォームを準備
$form:=New object
$page:=New object
$form.pages:=New collection(Null; $page)

//フォーム自体の属性
$form.destination:="detailScreen"
$form.windowSizingX:="fixed"
$form.windowSizingY:="fixed"
$form.rightMargin:=16
$form.bottomMargin:=16

//フォームオブジェクトを配置
$page.objects:=New object
$page.objects["icon"]:=New object(\
"type"; "picture"; \
"left"; 24; "top"; 17; "width"; 64; "height"; 64; \
"pictureFormat"; "scaled"; \
"picture"; "/.PRODUCT_RESOURCES/Images/alert.png"\
)
$page.objects["Message"]:=New object(\
"type"; "text"; \
"left"; 102; "top"; 18; "width"; 375; "height"; 165; \
"text"; $message; \
"fontSize"; $fontSize\
)
$page.objects["Button OK"]:=New object(\
"type"; "button"; \
"left"; 387; "top"; 206; "width"; 90; "height"; 22; \
"action"; "accept"; \
"defaultButton"; True; \
"text"; $button; \
"fontSize"; $fontSize; \
"events"; New collection("onClick")\
)

//組み立てたALERTダイアログを表示
$ref:=Open form window($form; Movable form dialog box)
DIALOG($form)
CLOSE WINDOW($ref)

//呼び出し側に結果を返す
Case of 
	: ($ok=Null)  //単独テスト
		TRACE
	: ($ok#(->OK))  //コンポーネント？
		($ok->):=OK  //コンポーネントの場合はホスト側のOK変数に結果を代入
End case 
```

###  \_CONFIRM_メソッド

```4d
/*
	
	目的：
	CONFIRMと同じ動作をフォームを使って表現するすることで、デザインのカスタマイズを行えるようにする
	
	引数：
	$ok：システム変数OKのポインター（コンポーネントでも動作するように考慮）
	$message：表示するメッセージ
	$buttonOk：OKボタンに表示する文字列（省略可）
	$buttonCancel：キャンセルボタンに表示する文字列（省略可）
	
*/

#DECLARE($ok : Pointer; $message : Text; $buttonOk : Text; $buttonCancel : Text)

$fontSize:=0  //標準フォントサイズ

Case of 
	: (Count parameters=0)  //単独でメソッドを実行してテストするとき
		$message:="TEST "*100
		$buttonOk:="OK"
		$buttonCancel:="キャンセル"
	: (Count parameters<3)  //ボタンタイトルが指定されなかったとき
		$buttonOk:="OK"
		$buttonCancel:="キャンセル"
	: (Count parameters<4)  //キャンセルボタンタイトルが指定されなかったとき
		$buttonCancel:="キャンセル"
End case 

//フォームを準備
$form:=New object
$page:=New object
$form.pages:=New collection(Null; $page)

//フォーム自体の属性
$form.destination:="detailScreen"
$form.windowSizingX:="fixed"
$form.windowSizingY:="fixed"
$form.rightMargin:=16
$form.bottomMargin:=16
$form.windowTitle:="  "

//フォームオブジェクトを配置
$page.objects:=New object
$page.objects["icon"]:=New object(\
"type"; "picture"; \
"left"; 24; "top"; 17; "width"; 64; "height"; 64; \
"pictureFormat"; "scaled"; \
"picture"; "/.PRODUCT_RESOURCES/Images/alert.png"\
)
$page.objects["Message"]:=New object(\
"type"; "text"; \
"left"; 102; "top"; 18; "width"; 375; "height"; 165; \
"text"; $message; \
"fontSize"; $fontSize\
)
$page.objects["Button OK"]:=New object(\
"type"; "button"; \
"left"; 387; "top"; 206; "width"; 90; "height"; 22; \
"action"; "accept"; \
"defaultButton"; True; \
"text"; $buttonOk; \
"fontSize"; $fontSize; \
"events"; New collection("onClick")\
)
$page.objects["Button CANCEL"]:=New object(\
"type"; "button"; \
"left"; 278; "top"; 206; "width"; 90; "height"; 22; \
"action"; "cancel"; \
"defaultButton"; False; \
"text"; $buttonCancel; \
"fontSize"; $fontSize; \
"events"; New collection("onClick")\
)

//組み立てたCONFIRMダイアログを表示
$ref:=Open form window($form; Movable form dialog box)
DIALOG($form)
CLOSE WINDOW($ref)

//呼び出し側に結果を返す
Case of 
	: ($ok=Null)  //単独テスト
		TRACE
	: ($ok#(->OK))  //コンポーネント？
		($ok->):=OK  //コンポーネントの場合はホスト側のOK変数に結果を代入
End case 
```

###  \_Request_メソッド

```4d
/*
	
	目的：
	Requestと同じ動作をフォームを使って表現するすることで、デザインのカスタマイズを行えるようにする
	
	引数：
	$ok：システム変数OKのポインター（コンポーネントでも動作するように考慮）
	$message：表示するメッセージ
	$default：表示するデフォルト値
	$buttonOk：OKボタンに表示する文字列（省略可）
	$buttonCancel：キャンセルボタンに表示する文字列（省略可）
	
	戻り値
	$return：入力された文字列
	
*/

#DECLARE($ok : Pointer; $message : Text; $default : Text; $buttonOk : Text; $buttonCancel : Text)->$return : Text

$fontSize:=0  //標準フォントサイズ

//入力パラメーターのチェック
Case of 
	: (Count parameters=0)  //単独でメソッドを実行してテストするとき
		$message:="TEST "*10
		$default:="入力デフォルト値"
		$buttonOk:="OK"
		$buttonCancel:="キャンセル"
	: (Count parameters<3)  //デフォルト値が指定されなかったとき
		$default:=""
		$buttonOk:="OK"
		$buttonCancel:="キャンセル"
	: (Count parameters<3)  //OKボタンタイトルが指定されなかったとき
		$buttonOk:="OK"
		$buttonCancel:="キャンセル"
	: (Count parameters<4)  //キャンセルボタンタイトルが指定されなかったとき
		$buttonCancel:="キャンセル"
End case 

//フォームを準備
$form:=New object
$page:=New object
$form.pages:=New collection(Null; $page)

//フォーム自体の属性
$form.destination:="detailScreen"
$form.windowSizingX:="fixed"
$form.windowSizingY:="fixed"
$form.rightMargin:=16
$form.bottomMargin:=16

//フォームオブジェクトを配置
$page.objects:=New object
$page.objects["icon"]:=New object(\
"type"; "picture"; \
"top"; 17; "left"; 24; "width"; 64; "height"; 64; \
"pictureFormat"; "scaled"; \
"picture"; "/.PRODUCT_RESOURCES/Images/alert.png"\
)
$page.objects["Message"]:=New object(\
"type"; "text"; \
"top"; 20; "left"; 104; "width"; 272; "height"; 17; \
"text"; $message; \
"fontSize"; $fontSize\
)
$page.objects["Default value"]:=New object(\
"type"; "input"; \
"top"; 41; "left"; 104; "width"; 272; "height"; 17; \
"dataSource"; "Form.default"; \
"fontSize"; $fontSize\
)
$page.objects["Button OK"]:=New object(\
"type"; "button"; \
"top"; 80; "left"; 281; "width"; 95; "height"; 22; \
"action"; "accept"; \
"defaultButton"; True; \
"text"; $buttonOk; \
"fontSize"; $fontSize; \
"events"; New collection("onClick")\
)
$page.objects["Button CANCEL"]:=New object(\
"type"; "button"; \
"top"; 80; "left"; 173; "width"; 95; "height"; 22; \
"action"; "cancel"; \
"defaultButton"; False; \
"text"; $buttonCancel; \
"fontSize"; $fontSize; \
"events"; New collection("onClick")\
)

//フォーム用パラメーター
$param:=New object("default"; $default)

//組み立てたRequestダイアログを表示
$ref:=Open form window($form; Movable form dialog box)
DIALOG($form; $param)
CLOSE WINDOW($ref)

//呼び出し側に結果を返す
If (OK=1)
	$return:=$param.default  //入力された値を返す
End if 
Case of 
	: ($ok=Null)  //単独テスト
		TRACE
	: ($ok#(->OK))  //コンポーネント？
		($ok->):=OK  //コンポーネントの場合はホスト側のOK変数に結果を代入
End case 
```


## インストール／アンインストール用の全メソッドをリスト化するメソッド

最初に５つのメソッドと書きましたが、コードを見やすくするために、もう一つメソッドを用意します。
インストール／アンインストールするためのメソッドでは、すべてのメソッドを簡単に扱えるようにするための、メソッドになります。

出典：[Tips: 全メソッドのパスを得るコード](https://kb.4d-japan.com/Tips/2385/)

このめそっどは、XF_all_method_pathとして作成しておきます。
インストール／アンインストールのメソッドからは、XF_all_method_pathメソッドとして呼び出しています。

```4d
/*
	
	目的
	全メソッドのパスを得る
	
	参考
	http://tech.4d-japan.com/Tips/2385/
	
	呼び出し方
	ARRAY TEXT(all_methods;0)
	XF_all_method_path(->$all_methods)
	
*/

C_POINTER($1)

ARRAY TEXT($1->; 0)
ARRAY TEXT($ref_objects; 0)
C_LONGINT($i)

//プロジェクトメソッド（注：現行バージョンはプロジェクトメソッド名＝パス）
METHOD GET NAMES($ref_objects; *)
For ($i; 1; Size of array($ref_objects))
	APPEND TO ARRAY($1->; METHOD Get path(Path project method; $ref_objects{$i}))
End for 

//プロジェクトフォーム
METHOD GET PATHS FORM($ref_objects; *)
For ($i; 1; Size of array($ref_objects))
	APPEND TO ARRAY($1->; $ref_objects{$i})
End for 

//テーブルフォーム
C_LONGINT($table_NO)
For ($table_NO; 1; Get last table number)
	If (Is table number valid($table_NO))
		METHOD GET PATHS FORM(Table($table_NO)->; $ref_objects; *)
		For ($i; 1; Size of array($ref_objects))
			APPEND TO ARRAY($1->; $ref_objects{$i})
		End for 
	End if 
End for 
```

## インストールメソッド

ここで真打ちインストールメソッドの登場です。

インストールメソッドでは、正規表現式を利用して、置き換えるターゲットのコマンドをメソッドに置き換えます。

インストールメソッドを実行する前には、すべてのメソッドをデザインモードで閉じておく必要があります。
もし、閉じていないメソッドがあると、ロックされていて書き換えができないからです。

それから、インストールメソッドを実行しますと、インストールメソッド内にあるターゲットのコマンドも置き換えられます。

```4d
/*
	
	目的
	全てのメソッド内の下記コマンドをカスタムコマンドの呼び出しに変更する
	
	ALERT
	Request
	CONFIRM
	
*/

//作業用変数定義
var $code : Text  //メソッドコード用
ARRAY LONGINT($pos; 0)  //Match regex用
ARRAY LONGINT($len; 0)  //Match regex用

//全メソッドのパスを得る
ARRAY TEXT($methods; 0)
XF_all_method_path(->$methods)

//進捗バー
var $ref : Integer
$ref:=Progress New

//全メソッドの変換開始
var $i; $max : Integer
$max:=Size of array($methods)
For ($i; 1; $max)
	
	//進捗バー
	Progress SET MESSAGE($ref; $methods{$i})
	Progress SET PROGRESS($ref; $i/$max)
	
	//メソッドのコードを変数にロード
	METHOD GET CODE($methods{$i}; $code; *)
	
	//ALERTをカスタムメソッドの呼び出しに書き換える
	While (Match regex("(?m)^\t*(ALERT\\()"; $code; 1; $pos; $len))
		$code:=Substring($code; 1; $pos{1}-1)+"_ALERT_(->OK;"+Substring($code; $pos{1}+$len{1})
	End while 
	
	//Requestをカスタムメソッドの呼び出しに書き換える
	While (Match regex("(?m)^[^/]+:=(Request\\()"; $code; 1; $pos; $len))
		$code:=Substring($code; 1; $pos{1}-1)+"_Request_(->OK;"+Substring($code; $pos{1}+$len{1})
	End while 
	
	//CONFIRMをカスタムメソッドの呼び出しに書き換える
	While (Match regex("(?m)^\t*(CONFIRM\\()"; $code; 1; $pos; $len))
		$code:=Substring($code; 1; $pos{1}-1)+"_CONFIRM_(->OK;"+Substring($code; $pos{1}+$len{1})
	End while 
	
	//変換したコードをメソッドに保存
	METHOD SET CODE($methods{$i}; $code; *)
	
	//エラーがあったときの警告を表示（本当はログに書き込むのが良い）
	Case of 
		: (Error=-9766)
			ALERT("「"+$methods{$i}+"」を更新できませんでした")
			Error:=0
		: (Error#0)
			ALERT("「"+$methods{$i}+"」を処理中にエラーが発生しました\rError code: "+String(Error))
			Error:=0
	End case 
	
End for 

Progress QUIT($ref)

ALERT("インストールしました")
```

## アンインストールメソッド

インストールしたものを元に戻せないと、いざというときに困ります。

ということで、もとに戻すためのアンインストールメソッドも作ってみました。

当然ですが、アンインストールメソッドを実行しますと、アンインストールメソッド内にあるターゲットのメソッドも置き換えられます。

```4d
/*
	
	目的
	全てのメソッド内の下記カスタムコマンドを標準コマンドの呼び出しに変更する
	
	_ALERT_
	_Request_
	_CONFIRM_
	
*/

//作業用変数定義
var $code : Text  //メソッドコード用
ARRAY LONGINT($pos; 0)  //Match regex用
ARRAY LONGINT($len; 0)  //Match regex用

//全メソッドのパスを得る
ARRAY TEXT($methods; 0)
XF_all_method_path(->$methods)

//進捗バー
var $ref : Integer
$ref:=Progress New

//全メソッドの変換開始
var $i; $max : Integer
$max:=Size of array($methods)
For ($i; 1; $max)
	
	//進捗バー
	Progress SET MESSAGE($ref; $methods{$i})
	Progress SET PROGRESS($ref; $i/$max)
	
	//メソッドのコードを変数にロード
	METHOD GET CODE($methods{$i}; $code; *)
	
	//_ALERT_を標準に戻す
	While (Match regex("(?m)^\t*(_ALERT_\\(.*?\\->OK;)"; $code; 1; $pos; $len))
		//$code:=Substring($code; 1; $pos{1}-1)+"ALERT("+Substring(Replace string($code; "->OK;"; ""); $pos{1}+$len{1})
		$code:=Substring($code; 1; $pos{1}-1)+"ALERT("+Substring($code; $pos{1}+$len{1})
	End while 
	
	//_Request_を標準に戻す
	While (Match regex("(?m)^[^/]+:=(_Request_\\(.*?\\->OK;)"; $code; 1; $pos; $len))
		//$code:=Substring($code; 1; $pos{1}-1)+"Request("+Substring(Replace string($code; "->OK;"; ""); $pos{1}+$len{1})
		$code:=Substring($code; 1; $pos{1}-1)+"Request("+Substring($code; $pos{1}+$len{1})
	End while 
	
	//_CONFIRM_を標準に戻す
	While (Match regex("(?m)^\t*(_CONFIRM_\\(.*?\\->OK;)"; $code; 1; $pos; $len))
		//$code:=Substring($code; 1; $pos{1}-1)+"CONFIRM("+Substring(Replace string($code; "->OK;"; ""); $pos{1}+$len{1})
		$code:=Substring($code; 1; $pos{1}-1)+"CONFIRM("+Substring($code; $pos{1}+$len{1})
	End while 
	
	//変換したコードをメソッドに保存
	METHOD SET CODE($methods{$i}; $code; *)
	
	//エラーがあったときの警告を表示（本当はログに書き込むのが良い）
	Case of 
		: (Error=-9766)
			ALERT("更新できませんでした")
			Error:=0
		: (Error#0)
			ALERT("エラーが発生しました\rError code:"+String(Error))
			Error:=0
	End case 
	
End for 

Progress QUIT($ref)

ALERT("アンインストールしました")
```

## 最後に

実際に試してみると標準コマンドは、なかなか良くできていることに気が付きます。
標準コマンドと例題メソッドの違いを表にまとめると・・・

| 標準コマンド | 例題メソッド |
|:---|:---|
| ウィンドウを移動して閉じたときの位置に次回も表示される | 毎回中央 |
| メッセージの長さに合わせてウィンドウがある程度調整される | いつも同じ大きさ |
| OK／キャンセルボタンの位置と大きさはタイトルの長さに合わせて調整される | いつも同じ位置と大きさ |


テスト用のメソッドも紹介しておきます。

このメソッドの置き換えを目標にして、上記の例題メソッドを作成しました。

```4d
//ALERTのテスト
ALERT("ALERTのテストです")
ALERT("ALERTのテストで、OKボタンのタイトルを指定"; "どうかな？")

//Requestのテスト
var $text : Text
$text:=Request("Requestのテストです"; "この値を入力"; "登録"; "またね")
If (OK=1)
	ALERT($text; "OKが選択されました")
Else 
	ALERT($text; "キャンセルされました")
End if 

//CONFIRMのテスト
CONFIRM("CONFIRMのテストです")
If (OK=1)
	ALERT("OKが選択されました")  //IF文の中のALERT
Else 
	ALERT("キャンセルされました")  //IF文の中のALERT
End if 

CONFIRM("CONFIRMのテストで、OKボタンのタイトルを指定"; "OKタイトル")
If (OK=1)
	ALERT("OKが選択されました")  //IF文の中のALERT
Else 
	ALERT("キャンセルされました")  //IF文の中のALERT
End if 

CONFIRM("CONFIRMのテストで、OKボタンのタイトルをに加えて、CANCELのタイトルも指定"; "OKタイトル"; "CANCELタイトル")
If (OK=1)
	ALERT("OKが選択されました")  //IF文の中のALERT
Else 
	ALERT("キャンセルされました")  //IF文の中のALERT
End if 
```
