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
オブジェクトの削除や追加など、条件が明確であれば、メソッドで実行することは可能かもしれません。

<!--more-->

例えば、ある共通する名前で始まるようなオブジェクトをすべて削除するようなケースを考えてみます。

最初に、すべてのフォームのソースにアクセスする方法ですが、ソースファイルのリストを生成する必要があります。
これは`Folder`コマンドを使うと、１行で表現することが可能です。

```4d
$files:=Folder("/PACKAGE/Project/Sources").files(fk recursive+fk ignore invisible).query("fullName = 'form.4DForm'")
```
上記のリストを処理し、条件に合うオブジェクトを削除するコードは、次のようになります。

```4d
$files:=Folder("/PACKAGE/Project/Sources").files(fk recursive+fk ignore invisible).query("fullName = 'form.4DForm'")
For each ($fileForm; $files)  //フォームソースファイルを順次処理する
	$form:=JSON Parse($fileForm.getText())  //ソース読み出してオブジェクト変数に収める
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

今回の条件は単純ですが、例えばオブジェクトのタイプなどは、フォームの構造体としてオブジェクト変数でアクセスできますから、かなり複雑な条件を組み上げることも可能です。
フォームの構造については、リファレンスをご参照ください。

> [ダイナミックフォーム](https://doc.4d.com/4Dv19/4D/19/Dynamic-Forms.300-5416668.ja.html)
