---
layout: technote
title: "シンプルなPOP3トランスポーターの例題"
position: 20221130001
date: 2022-11-30 00:00:00
categories: ヒント
tags: mail transporter pop3
version: 19
---

POP3トランスポーターを使い、メールサーバーにログインして、アカウントにあるメールをすべてテーブルに保存する例題です。

<!--more-->

## 4D Internet Commandsプラグインの終焉

近年のメールを取り巻く環境に対応することができなかった4D Internet Commandsプラグインに代わり、登場したのが一連のメールコマンドです。

- IMAP New transporter
- MAIL Convert from MIME
- MAIL Convert to MIME
- MAIL New attachment
- POP3 New transporter
- SMTP New transporter

これらはすべてオブジェクト記法を前提とした構成になっています。

このうち、ここではPOP3 New transporterを使い、メールサーバーにあるメール情報をローカルなテーブルに保存する方法をシンプルな例題にまとめてみました。

## メール保存用テーブル

前提となるメール保存用のテーブルの構成ですが、たった２つのフィールドしかありませんが、これで利用が可能です。

| フィールド名 |タイプ |目的 |
|:---|:---|:---|
|id |文字列[^id] |メッセージの固有ID（主キーとして利用可能） |
|content |オブジェクト |メール本体のオブジェクト（ヘッダー、本文等） |

[^id]: idはPOP3サーバーにて受信された時に割り振られる固有の番号です。詳細は[POP3Transporterリファレンス](https://developer.4d.com/docs/ja/API/POP3TransporterClass/#getmailinfo)および[RFC1939 UIDLコマンド](https://www.rfc-editor.org/rfc/rfc1939#page-12)を参照。

XMLで記述しますと次のようになります。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE base SYSTEM "http://www.4d.com/dtd/2007/base.dtd" >
<base>
	<table name="mails" uuid="12345678901234567890123456789000" id="1" prevent_journaling="true">
		<field name="id" uuid="12345678901234567890123456789001" type="10" limiting_length="255" unique="true" autogenerate="true" not_null="true" id="1">
			<field_extra/>
		</field>
		<field name="content" uuid="12345678901234567890123456789005" type="21" blob_switch_size="2147483647" never_null="true" id="2">
			<field_extra/>
		</field>
		<primary_key field_name="id" field_uuid="12345678901234567890123456789001"/>
	</table>
</base>
```

この**XMLをコピーして、ストラクチャエディタ上でペースト**すると、この例題で使用するテーブルを簡単に作成できます[^StructureEditor]。

[^StructureEditor]: ストラクチャエディタ上でペーストしてテーブルを作成したときには利用前にデータベースを開き直してください 

## POP3トランスポーターの例題

この例題は、できるだけシンプルであることを目指して作成しています。

```4d
// サーバーアカウントの設定
var $server : Object
$server:=New object
$server.host:="pop.example.com"  // 必須
$server.port:=995
$server.user:="4d@example.com"
$server.password:="XXXXXXXX"

// トランスポーターオブジェクトの生成（メールサーバーにログイン）
var $transporter : 4D.POP3Transporter
$transporter:=POP3 New transporter($server)

// メールのリストを取得
var $mailInfo : Collection
$mailInfo:=$transporter.getMailInfoList()
For each ($mail; $mailInfo)  // コレクションをループして処理する
	If (ds.mails.get($mail.id)=Null) // 同じidを持つメールが無いとき
		$newRecord:=ds.mails.new() // 新しいエンティティ（レコード）を用意
		$newRecord.id:=$mail.id
		$mailObject:=$transporter.getMail($mail.number)  // POP3サーバーからメールを取り出す（メールのダウンロード）
		$newRecord.content:=OB Copy($mailObject)  // メールオブジェクトから単純なオブジェクトに変換して保存
		// 添付ファイルをサーバーからダウンロードしてレコードに保存
		If ($mailObject.attachments#Null)
			For ($i; 0; $mailObject.attachments.length-1)
				$blob:=$mailObject.attachments[$i].getContent() // 添付ファイルをダウンロード
				BASE64 ENCODE($blob)　// オブジェクトとして保存するためBase64エンコード
				$newRecord.content.attachments[$i].object:=Convert to text($blob; "UTF-8")　// オブジェクトとして保存
				For each ($propaty; $mailObject.attachments[$i]) 　// 他のすべてのプロパティもループして処理
					$newRecord.content.attachments[$i][$propaty]:=$mailObject.attachments[$i][$propaty] // プロパティ値をコピー
				End for each 
			End for 
		End if 
		$result:=$newRecord.save() // エンティティを保存
	End if 
End for each 
```

特に解説は致しませんが、POP3のトランスポーターの基本的な利用方法が、この１つのメソッドにまとめられています。
添付ファイルも含めて必要な情報はレコードとして保存されます。
実際の運用に用いるためには、テーブルに保存したメールの削除などの処理や、エラー時の処理が必要だと思います。

## 受信したメールデータの利用

POP3のトランスポーターの使い方は以上ですが、受信したメールを利用する方法についても触れておきます。

mailsテーブルには、メールに関する情報は、すべて入っています。
メール本文はもちろんですが、ヘッダー情報や添付ファイルも、たった１つのcontentフィールドに収められています。

ですので、SubjectやFromなどのフィールドを用意する必要は全くありません。
contentフィールドを使いこなすことで、無駄なフィールドを作らずに利用できます。

上記で、POP3トランスポーターの完成になります。ですが、受信したオブジェクトの使い方などをさらに解説したいと思います。

## 詳細フォームでデータを表示

カレントレコードを使い表示する詳細フォームで、件名（subject)を表示するには、変数フォームオブジェクトを配置して、式プロパティの欄に、変数の代わりに次のような式を書くだけです。

```4d
[mails]content.subject
```

contentフィールド中のsubjectプロパティを式として参照するので、フォームオブジェクトのタイプはフィールドではなく変数である点に注目してください。
このケースの場合、単一のプロパティを参照しているだけなので、このフォームオブジェクトを通して値を入力して更新することも可能です。

同様にして他のフィールドを表示することも可能ですが、単純なプロパティの参照ではない式の場合は、表示はできますが入力することはできません。

例えばsendAtプロパティは、グリニッジ標準時間で表現されているので、そのまま表示するとローカルの日時とずれがあるため、実際の送信日時が分かりにくいものになります。
それを解消するためにDateコマンドやTimeコマンドを使い、ローカルな日時に変換し表示するにはプログラムが必要になります。

しかしメソッドを用意する必要はありません。

式の欄には１行のプログラムを書くこともできます。ですので、次のようなコードを式の欄に直接記述することができます。当然ながら、こうしたプログラムや一意な参照ができないような式の場合は、入力することはできなくなります。

```4d
String(Date([mails]content.sendAt))+" "+String(Time([mails]content.sendAt))
```

メール本文は、テキストとHTMLに分かれて保存されています。
Webエリアを利用すると、HTMLを表示することもできます。

例えば、Webエリアをフォームに配置して、On Loadイベントで動作するオブジェクトメソッドに次のコードを記述することで、HTMLメールがそのまま表示されます。

```4d
// Webエリア・オブジェクトメソッド
Case of 
	: (FORM Event.code=On Load)
		If ([mails]content.bodyValues.p0002#Null)  // HTML本文はあるか？
			WA SET PAGE CONTENT(*; OBJECT Get name; [mails]content.bodyValues.p0002.value; "")  // HTML本文
		Else 
			WA SET PAGE CONTENT(*; OBJECT Get name; Replace string([mails]content.bodyValues.p0001.value; "\r"; "<br/>\r"); "")  // HTLM化したテキスト本文を表示（ちょっと乱暴な方法）
		End if 
End case 
```

ただし、HTMLメールをそのまま表示するのは要注意です。

スパムメールなどをそのまま表示すると、Javascriptやimgタグなどがパースされて動作した結果、何かしらのリスクを追うことになりかねません。
十分に注意する必要があります。

そこで、外部リンクをクリックしたようなときの処理や、いきなりイメージが表示されないようにHTML本文を編集してから表示するコードも紹介しておきます。

```4d
// Webエリア・オブジェクトメソッド
Case of 
	: (FORM Event.code=On Load)
		ARRAY LONGINT($pos; 0)  // 正規表現用
		ARRAY LONGINT($len; 0)  // 正規表現用
		// 外部リンクをクリックしたときの処理
		ARRAY TEXT($filters; 0)
		ARRAY BOOLEAN($AllowDeny; 0)
		APPEND TO ARRAY($filters; "*.*")  // すべてのサイト
		APPEND TO ARRAY($AllowDeny; False)  // 不許可
		WA SET URL FILTERS(*; OBJECT Get name; $filters; $AllowDeny)  // 表示するデータのフィルター
		WA SET EXTERNAL LINKS FILTERS(*; OBJECT Get name; $filters; $AllowDeny)  // リンクのフィルター
		WA SET PREFERENCE(*; OBJECT Get name; WA enable contextual menu; True)  // 標準のコンテキストメニューを使えるようにする
		WA SET PREFERENCE(*; OBJECT Get name; WA enable Web inspector; True)  //デバッグのためインスペクターを使えるようにする
		// メール本文の取り出してWebエリアにセットする
		If ([mails]content.bodyValues.p0002#Null)  // HTMLのソースはあるか？
			//HTMLを取り出す
			$html:=[mails]content.bodyValues.p0002.value
			// 画像等のリンクを無効化
			While (Match regex("(src|data-src)=['\"](http.+?)['\"]"; $html; 1; $pos; $len))  // ソースとして記述されたURLを探す
				//$url:=Substring($html; $pos{2}; $len{2}) // 削除するURL
				$html:=Substring($html; 1; $pos{2}-1)+Substring($html; $pos{2}+$len{2})  // URLを削除
			End while 
			WA SET PAGE CONTENT(*; OBJECT Get name; $html; "")  // HTML本文を表示
		Else 
			//本文を取り出す
			$html:=[mails]content.bodyValues.p0001.value
			// テキストをHTML化
			$html:=Replace string($html; "\r\n"; "<br/>")
			$html:=Replace string($html; "\r"; "<br/>")
			$html:=Replace string($html; "\n"; "<br/>")
			WA SET PAGE CONTENT(*; OBJECT Get name; $html; "")  // HTLM化した本文を表示
		End if 
		
	: (FORM Event.code=On URL Filtering)
		ARRAY LONGINT($pos; 0)  // 正規表現用
		ARRAY LONGINT($len; 0)  // 正規表現用
		$link:=WA Get last filtered URL(*; OBJECT Get name)  // フィルターしたリンクを取り出す
		CONFIRM(Choose(Match regex("://(.+?)/"; $link; 1; $pos; $len); "Site: "+Substring($link; $pos{1}; $len{1})+"\r\r"+$link; $link); "ブラウザで開く")  // リンク情報を表示
		If (OK=1)  // リンクを開くことを許可したか？
			OPEN URL($link)  // リンクを開く
		End if 
End case 
```

しかし、これでも不十分かもしれません。
なぜなら、悪意あるJavascriptが記述されている場合など、スパムメールのすべての手口を防いでいるとは言えないからです。

新しい手法について考え、常に刷新して対応することが、セキュリティの第一歩であることを忘れないでください。

## 受信データの検索

検索の場合ですが、ORDAですと非常に直感的に記述できます。

```4d
$address:=Request("検索するアドレスを入力してください")  // 検索するメールアドレスを入力
If ($address#"")  // メールアドレスは入力されたか？
	$selection:=ds.mails.query("content.from[].email = :1"; $address)  // $addressの値でfromを検索して$selectionに収める
End if 
```

fromプロパティは、複数の記述が可能なのでコレクションとして表現されています。
コレクションなのでcontent.from[].emailと、fromの後にカギ括弧が参照番号なしで記述されている点に注目してください。

ORDAではない場合、プロパティの値を検索するときはQUERYコマンドではなく、QUERY BY ATTRIBUTEコマンドを使います。
先のORDAのコードを書き換えますと、次のように表現できます。

```4d
$address:=Request("検索するアドレスを入力してください")  // 検索するメールアドレスを入力
If ($address#"")  // メールアドレスは入力されたか？
	QUERY BY ATTRIBUTE([mails]; [mails]content; "from[].email"; =; $address)  // $addressの値でfromを検索してセレクションに収める
End if 
```

このようにmailsテーブルのcontentフィールドには、メールを表現している情報がすべて収められているので、他にフィールドを用意する必要はありません。
contentフィールドのオブジェクト構造を把握することで、利用に合わせたシステムを構築できるはずです。

## 添付ファイルの復元

レコードから添付ファイルを復元するコードは、次のように書きます。

```4d
$id:="0001234567abcdef"  // 添付ファイルを復元するメールid
$selection:=ds.mails.query("id = :1"; $id)  // メールを検索する
If ($selection.length#0)  // 該当メールがあるか
	$path:=Select folder("保存先のフォルダーを指定してください")
	For each ($attach; $selection[0].content.attachments)  // すべての添付ファイルをループして処理する
		$file:=File($path+$attach.name; fk platform path)  // 生成するファイルのファイルオブジェクトを取得
		If ($file.exists=False)  // ファイルは存在しないことを確認
			CONVERT FROM TEXT($attach.object; "UTF-8"; $blob)
			BASE64 DECODE($blob)  // Base64からバイナリーに復元
			$result:=$file.setContent($blob)  // ファイルに書き出す
		End if 
	End for each 
End if
```

上のコードですと、query()を使い検索していますが、メールidは重複しない値なので、get()を使ってエンティティを直接取り出すこともできます。
get()を使う場合は、次のようなコードになります。

```4d
$id:="0001234567abcdef"  // 添付ファイルを復元するメールid
var $entity : cs.mailsEntity  // mailsEntityクラスのオブジェクトであることを明示的に宣言
$entity:=ds.mails.get($id)  // メールをロードする
If ($entity#Null)  // 該当メールがあるか
	$path:=Select folder("保存先のフォルダーを指定してください")
	For each ($attach; $entity.content.attachments)  // すべての添付ファイルをループして処理する
		$file:=File($path+$attach.name; fk platform path)  // 生成するファイルのファイルオブジェクトを取得
		If ($file.exists=False)  // ファイルは存在しないことを確認
			CONVERT FROM TEXT($attach.object; "UTF-8"; $blob)
			BASE64 DECODE($blob)  // Base64からバイナリーに復元
			$result:=$file.setContent($blob)  // ファイルに書き出す
		End if 
	End for each 
End if 
```

get()を使うときの注意点は、ヌルが返される可能性を考慮することです。
もし、上のコードの２行目で、変数$entityがcs.mailsEntityのオブジェクトであることを宣言しないと、ds.mails.get($id)の結果がヌルのときにエラーになります。

実は、変数を利用する前に、その変数がどのような特徴を持ったオブジェクトであるかを定義することは重要です。
上の例題コードでは、mailsEntity[クラス](https://developer.4d.com/docs/ja/Concepts/classes/)であることを宣言して、mailsテーブルのエンティティのインスタンスが入ることを明示することで、ds.mails.get($id)の結果がヌルのときでもエラーとはならずに処理されます。
mailsEntityクラスは、[クラスストア](https://developer.4d.com/docs/ja/Concepts/classes/#cs)で定義されたクラスで、mailsテーブルを作成したときに自動で定義された[エンティティクラス](https://developer.4d.com/docs/ja/API/EntityClass)になります。

query()の例題では、ヌルが返されることはないので手を抜いてクラスストアの定義を省略しましたが、手抜きせずにコーディングするなら[エンティティセレクションクラス](https://developer.4d.com/docs/ja/API/EntitySelectionClass)であることを宣言します。

```4d
var $selection : cs.mailsSelection //mailsSelectionクラスのオブジェクトであることを宣言
$selection:=ds.mails.query("id = :1"; $id)
```
## まとめ

POP3トランスポーターで得られるメールは、オブジェクト化されたデータなので、オブジェクト記法を活かして柔軟なプログラムを簡潔に書くことができます。

また、オブジェクトフィールドの良さは、必須ではない情報のためにフィールドを用意する必要が無く、テーブルのフィールド定義を整理できる可能性があることです。 
無駄にフィールドを設けなければならない時代は、オブジェクト型フィールドの出現で終えたと言えるでしょう。

## 参考資料

- [例題データベース集](https://4d-jp.github.io/hdi/)
- [POP3 Transporter](https://developer.4d.com/docs/ja/API/POP3TransporterClass)
