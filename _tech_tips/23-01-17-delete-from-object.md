---
layout: technote
title: "条件に合致するフォームオブジェクトをすべてのフォームから削除したい"
position: 20230117
date: 2023-01-17 00:00:00
categories: ヒント
tags: folder 4DForm
version: 17, 18, 19
---

すべてのフォームのデザインを見直す必要に迫られることがあると思います。
オブジェクトの属性の変更や削除や追加など、条件が明確であれば、メソッドで自動化して処理することが可能かもしれません。

<!--more-->

例えば、ある共通する名前で始まるようなオブジェクトをすべて削除するようなケースを考えてみます。

最初に、すべてのフォームのソースにアクセスする方法ですが、`Folder`コマンドを使うと１行で表現することが可能です。

```4d
$files:=Folder("/PACKAGE/Project/Sources").files(fk recursive+fk ignore invisible).query("fullName = 'form.4DForm'")
```
`Folder`コマンドにわたすパスは、プラットフォームに関係なくPOSIX形式です。
上記の場合、`Folder`コマンドによって`/PACKAGE/Project/Sources`配下にあるファイルすべてがリスト化され、さらに`query()`を使いファイル名が`form.4DForm`であるファイルに絞り込みしています。
このようにドット記法で接続すると、複数の動作をたった１行にまとめることができます。

そして、このリストをループして処理し、条件に合うオブジェクトを削除するコードは、次のようになります。

```4d
$files:=Folder("/PACKAGE/Project/Sources").files(fk recursive+fk ignore invisible).query("fullName = 'form.4DForm'")
For each ($fileForm; $files)  //フォームソースファイルを順次処理する
	$form:=JSON Parse($fileForm.getText())  //ソースを読み出してオブジェクト変数に収める
	$edited:=False  //フォームの編集フラグを初期化
	For each ($page; $form.pages)  //フォームの各ページを処理する
		For each ($name; $page.objects)  //各ページに配置されたフォームオブジェクトを処理する
			If ($name="Button_sample@")  //対象となるオブジェクトであるか？
				OB REMOVE($page.objects; $name)  //オブジェクトを削除
				$edited:=True  //削除したことを編集フラグに記録
			End if 
		End for each 
	End for each 
	If ($edited)  //編集したフォームか？
		$fileForm.setText(JSON Stringify($form; *))  //ソースをテキスト化して保存
	End if 
End for each 
```

このサンプルコードでは、フォームオブジェクト名が"Button_sample"で始まる文字列であることが、唯一の条件になっています。

フォームは構造体として表現されているので、オブジェクト変数に収めると、各構造に容易にアクセスできるようになります。
フォームの構造を理解することが重要ですが、オブジェクト記法に慣れてしまうと、プログラムが容易にできる良い例であると思います。

今回の条件は単純ですが、オブジェクトのタイプや属性などは、フォームの構造体としてオブジェクト変数でアクセスできますから、かなり複雑な条件でもプログラムすることが可能です。

なお、フォームの構造については、リファレンスをご参照ください。

> [ダイナミックフォーム](https://doc.4d.com/4Dv19/4D/19/Dynamic-Forms.300-5416668.ja.html)
