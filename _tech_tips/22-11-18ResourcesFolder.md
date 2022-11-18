---
layout: technote
title: "クライアント・サーバーのResourcesフォルダー"
position: 20221119001
date: 2022-11-19 00:00:00
categories: ヒント
tags: Resources
version: 19
---

クライアント・サーバーのResourcesフォルダー

<!--more-->


## クライアント・サーバー間で共通利用できるオブジェクト

サーバーで開かれたデータベースのResourcesフォルダー内に置かれたすべてのオブジェクトは、そのデータベースに接続したすべてのクライアントで共有され、とても便利です。
サーバー側のResourcesフォルダー内のオブジェクトが更新されたようなとき、その更新はすべてのクライアントで利用できます。

Resourcesフォルダーがどこに置かれているか、意識しないでプログラムで利用することができます。
こうしたResourcesフォルダーの管理については、4D Serverリファレンスに記述がありますが、ここでは少し詳しく解説します。

例えば次のコードはメソッドがどこで実行されても、Resourcesフォルダーに置かれた"test.txt"の内容をローカル変数$textに取り出すことができます。

```4d
var $text : Text
$text:=File("/RESOURCES/test.txt").getText()
```

## Resourcesフォルダー内のファイルの更新

それでは更新する場合は、同じようにどこからでも更新できるのでしょうか。

基本的にResourcesフォルダーは、オブジェクトを頻繁に更新する処理には向きません。
設定値やアイコン画像のように、基本的に普遍に利用されるオブジェクトのためのものです。
ですが、メンテナンスのためにクライアント側から設定値を変更したいようなことはあると思います。
そのようなとき、例えば次のようなコードをクライアント側で実行したときはどうでしょうか。

```4d
var $result : Boolean
var $text; $newtext : Text
$text:=File("/RESOURCES/test.txt").getText()
$newtext:=Request("更新する値を入力してください"; $text)
If (OK=1)
	$result:=File("/RESOURCES/test.txt").setText($newtext) //ファイルを更新
	If ($result)
		$text:=File("/RESOURCES/test.txt").getText() //更新された内容を読み込む
	End if 
	ALERT($text)
End if 
```

更新したクライアント側では、更新した内容を確認できますが、サーバーや他のクライアントでは更新を確認できません。

Resourcesフォルダーは、クライアント側にキャッシュされています。
クライアント側で実行されたメソッドでResourcesフォルダーを更新すると、Resourcesフォルダーのキャッシュを更新できますが、その内容はサーバーに送られることはありません。

メソッドがどこで実行されるかは、クライアント・サーバー環境では重要です。

## Resourcesフォルダーをクライアント側で更新

Resourcesフォルダー内のファイルを更新できるのは、サーバー側だけです。
そこで、Resourcesフォルダー内のファイルを更新する部分だけを別のメソッドとして独立させて、そのメソッドのプロパティ[サーバー上で実行]プロパティを有効にします。

```4d
// クライアント側で実行するメソッド
var $result : Boolean
var $text; $newtext : Text
$text:=File("/RESOURCES/test.txt").getText()
$newtext:=Request("更新する値を入力してください"; $text)
If (OK=1)
	$result:=File_Update($newtext) //File_Updateメソッドでファイルを更新
	$text:=File("/RESOURCES/test.txt").getText() //更新された内容を読み込む
	ALERT($text)
End if 
```

```4d
// File_Updateメソッド
// Resourcesフォルダー内のファイルを更新する（サーバー上で実行オプション有効）
#DECLARE($newtext : Text)->$result : Boolean

var $result : Boolean
$result:=File("/RESOURCES/test.txt").setText($newtext) //ファイルを更新
If ($result)
	NOTIFY RESOURCES FOLDER MODIFICATION //クライアントに対してResourcesフォルダーが変更されたことを宣言する
End if 
```

ソッドのプロパティ[サーバー上で実行]プロパティを有効にしたメソッドは、クライアントからの呼び出しであってもサーバー上で実行されます。
このようして、サーバー側でResourcesフォルダー内のファイルを更新することができます。

ですが、この更新されたファイルを利用できるようになるのは、次回のサーバー接続時になります。
もし、更新後に再接続なしでResourcesフォルダーの更新内容を利用するのであれば、ストラクチャー設定にあります[セッション中に"Resources"フォルダーを更新]オプションを有効にしてください。
このオプションが有効になりますと、次のイベントから更新されたResourcesフォルダーの内容を利用することができます。

## 注意点

例え[セッション中に"Resources"フォルダーを更新]オプションが有効であっても、更新した直後に同じイベント内でファイルから更新された内容を読み込むと、更新前の状態が読み込まれます。

上記のコード例ですと、更新された内容を読み込むとコメントされている行では、実は更新された内容を取り込むことはできません。
１つのイベントが終了したようなタイミングで、クライアント側のキャッシュが更新されるため、更新直後にResourcesフォルダーの更新を確認できないことがあります。

最初に述べましたように、Resourcesフォルダーは、設定値やアイコン画像のように、基本的に普遍に利用されるオブジェクトのためのものである点に注意してください。
