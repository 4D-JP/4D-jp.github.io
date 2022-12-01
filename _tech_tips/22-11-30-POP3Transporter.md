---
layout: technote
title: "シンプルなPOP3トランスポーターの例題"
position: 20221130001
date: 2022-11-30 00:00:00
categories: ヒント
tags: mail pop3
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
|id |文字列 |メッセージの固有ID（主キーとして利用可能） |
|content |オブジェクト |メール本体のオブジェクト（ヘッダー、本文等） |

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

このXMLをコピーして、ストラクチャエディタ上でペーストすると、この例題で使用するテーブルを簡単に作成できます。

> ストラクチャエディタ上でペーストしてテーブルを作成したときには利用前にデータベースを開き直してください 

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
	$selection:=ds.mails.query("id = :1"; $mail.id)
	If ($selection.length=0)  // 同じidが無いとき
		$newRecord:=ds.mails.new()
		$newRecord.id:=$mail.id
		$mailObject:=$transporter.getMail($mail.number)  // メールオブジェクトを取り出す
		$newRecord.content:=OB Copy($mailObject)  // メールオブジェクトから単純なオブジェクトに変換して保存
		// 添付ファイルをサーバーからダウンロードしてレコードに保存
		If ($mailObject.attachments#Null)
			For ($i; 0; $mailObject.attachments.length-1)
				$blob:=$mailObject.attachments[$i].getContent() // 添付ファイルをダウンロード
				BASE64 ENCODE($blob)　// オブジェクトとして保存するためBase64エンコード
				$newRecord.content.attachments[$i].object:=Convert to text($blob; "UTF-8")　// オブジェクトとして保存
				For each ($propaty; $mailObject.attachments[$i]) 　// 他のプロパティもオブジェクトとして保存
					$newRecord.content.attachments[$i][$propaty]:=$mailObject.attachments[$i][$propaty]
				End for each 
			End for 
		End if 
		$newRecord.save()
	End if 
End for each 
```

特に解説は致しませんが、POP3のトランスポーターの基本的な利用方法が、この１つのメソッドにまとめられています。
添付ファイルも含めて必要な情報はレコードとして保存されます。
実際の運用に用いるためには、テーブルに保存したメールの削除などの処理や、エラー時の処理が必要だと思います。

レコードから添付ファイルを復元するコードは、次のようになります。

```4d
$selection:=ds.mails.query("id = :1"; $id)  // $idで復元するメールを探す
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

## 参考資料

- [例題データベース集](https://4d-jp.github.io/hdi/)
- [POP3 Transporter](https://developer.4d.com/docs/ja/API/POP3TransporterClass)
