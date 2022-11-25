---
layout: technote
title: "GraphQLの利用方法を学ぶ"
position: 20221125001
date: 2022-11-25 00:00:00
categories: ヒント
tags: HTTP REST
version: 19
---

GraphQLの利用方法を学ぶ最初の一歩として、GitHubで公開されているGraphQL APIを使い、ログインができているかを確認する例題を作成してみました。

<!--more-->

関連URL: [https://docs.github.com/ja/graphql](https://docs.github.com/ja/graphql)

GraphQL APIは、基本的にJSONフォーマットでGraphQLサーバーと会話しますので、４Ｄのオブジェクト型変数との親和性が高く、シンプルなコードで利用することができます。

GitHubのGraphQL APIは、個人用アクセストークンを利用しますが、何度もトークンを入力せずとも利用できるように、ログインユーザー配下のユーザーフォルダーにトークンを保存するようにしました。
例題の前半部分は、このローカルな環境でのトークンの管理をしている部分になります。
前半部分は、別メソッドにまとめて、アクセス前にトークンをロードするように作り変えると良いでしょう。

個人用アクセストークンは２種類ありますが、そのうちのPersonal access tokens (classic)を利用します。
Personal access tokens (classic)を作成するとき、必要なスコープは必ず含むようにします。
この例題では、ログインユーザーの情報のうち、メールアドレスもクエリしていますので、userカテゴリーのuser:emailは必ずスコープに含まれるトークンを作成する必要があります。
例題を実行してアクセスに成功すると、クエリの結果がJSONで返され、ALERTで返された情報が表示されます。

GitHub GraphQL APIでのログインの確認は、基本中の基本ですので、これを応用して実際の処理を実装してください。

もしも、クエリの結果でエラーになる場合には、必ずその理由がmessegeプロパティに返されますから、その内容を読み訂正すれば正しい結果を得られるはずです。

```4D
/*
	
	前半部分
	
	アクセスのための個人用アクセストークンを準備する
	
*/

//保存された個人用アクセストークンをファイルから読み込む
$pref:=File(Folder(fk user preferences folder).path+"GitHub.json")
If ($pref.exists)
	$info:=JSON Parse($pref.getText())
Else 
	$info:=New object
End if 

//保存された個人用アクセストークンが存在しないとき
Case of 
	: (String($info.token)="") | (Shift down)  //シフトキーが押されているときはトークンを更新する
		
		SET MENU BAR(1)  //編集メニューが使えるようにする
		$token:=Request("GitHubの個人用アクセストークンを入力してください"; $info.token)
		
		Case of 
			: ($token="ghp_@")
				$info.update:=Timestamp
				$info.token:=$token
				$pref.setText(JSON Stringify($info; *))  //トークンを保存する
				
				
			: ($token#"")
				CONFIRM("トークンのタイプが目的に合っていない可能性があります"; "続ける")
				If (OK=1)
					$info.update:=Timestamp
					$info.token:=$token
					$pref.setText(JSON Stringify($info; *))  //トークンを保存する
				End if 
				
			Else 
				//トークンがセットされなかったとき
				$url:="https://docs.github.com/ja/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token"
				$message:="Guithubのアクセストークンの取得方法については下記URLのドキュメントをご参照ください\r\r"+$url
				CONFIRM($message; "ページを開く")
				If (OK=1)
					OPEN URL($url)
				End if 
				
		End case 
		
End case 


/*
	
	後半
	
	実際にGithubのGraphQL APIにアクセスしてみる
	
*/

//GraphQL APIのエンドポイントはたったの１つ
$url:="https://api.github.com/graphql"

//クエリ文字列（JSONに似ているがJSONではない）
$query:="query {\n viewer {\n login\n email\n }\n}"

//ヘッダーに個人用アクセストークンをセットする
ARRAY TEXT($headerNames; 0)
ARRAY TEXT($headerValues; 0)
APPEND TO ARRAY($headerNames; "Authorization")
APPEND TO ARRAY($headerValues; "bearer "+$info.token)

//ログインしてユーザーについてAPIに聞いてみる
var $contents;  : Object
$contents:=New object("query"; $query)  //queryプロパティにクエリ文字列をセットする

//返事はオブジェクト変数で受け取る
var $response : Object

//APIにアクセスする
$code:=HTTP Request(HTTP POST method; $url; $contents; $response; $headerNames; $headerValues)

//結果を表示する
ALERT(JSON Stringify($response; *))
```
