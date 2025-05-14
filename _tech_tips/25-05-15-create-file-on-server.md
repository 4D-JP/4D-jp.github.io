---
layout: technote
title: "クライアント側で読み込みしたファイルをサーバー上に保存"
position: 20250514001
date: 2025-05-14 00:00:00
categories: ヒント
tags: File メソッドプロパティ
version: 20
---

クライアント側で読み込みしたファイルをサーバー上に保存することは、とても簡単です。

<!--more-->

## 説明

メソッドプロパティの`サーバー上で実行`オプションを有効にしたメソッドを利用すると、
そのメソッドをリモート接続したクライアント側から呼び出してもサーバー側で実行されます。

このオプションを利用するだけで、サーバー側の環境に対して、クライアント側からアクセスできるようになります。

例えば次のようなメソッドを用意して、`サーバー上で実行`オプションを有効にするだけで、
メソッドに渡した内容をサーバー上にファイルとして保存することができます。

```4d
/*
	
	目的：サーバー側にクライアント側のファイルを生成する
	備考：メソッドプロパティの「サーバー上で実行」オプションを有効にする
	引数：
	　$name：ファイル名
	　$content：ファイルの内容
	
*/
#DECLARE($name : Text; $content : Blob)->$result : Object

ASSERT(Application type#4D Remote mode; "メソッドプロパティを変更してください")  //リモート側で動作しようとしたときはエラーを生成

$file:=File("/DATA/Files/"+$name)  //生成するファイルのインスタンス（データファイルと同階層のフォルダ内に生成）

//mark: 重複しないファイルを生成するための準備
If ($file.exists)
	//同名のファイルがある場合
	$fileOrg:=$file  //ファイルインスタンスを複製して保管
	$i:=1  //カウンターの初期化
	Repeat 
		$i+=1  //カウントアップ
		$file:=File("/DATA/Files/"+$fileOrg.name+"("+String($i)+")"+$fileOrg.extension)  //新しいファイルインスタンス
	Until (Not($file.exists))  //同名のファイルが無ければ次に進む
End if 

//mark: ファイルの生成
$created:=$file.setContent($content)

//mark: 結果を返す
$result:=New object
$result.created:=$created
$result.name:=$file.fullName

```

上記のメソッドを例えば`Create_file_on_server`という名称で作成し、
次のようにして利用するだけで、
リモート接続したクライアント側で指定したファイルをサーバー上に複製して保管できます。

```4d
$name:=Select document(System folder(Desktop); ""; "ファイルを選択してください"; Package open)
If (OK=1)
	DOCUMENT TO BLOB(Document; $content)
	$result:=Create_file_on_server($name; $content)  //サーバー側にファイルを生成
End if 
```

こうしたことはサーバー側にファイルを保存するだけでなく、サーバー側にあるファイルをクライアント側で利用する場合にも有用な方法です。
例えば、サーバー側にあるログファイルを読み込み、クライアント側で表示して、ログの内容を確認するような応用ができます。
