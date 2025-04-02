---
layout: fix
title: "4D NetKitを使用してEメールとフォルダを管理する"
date: 2025-03-27 08:00:00
categories: 仕様
tags: programming
---

4D NetKitを使用してEメールとフォルダを管理する 原題: [Managing Email and Folders with 4D NetKit](https://kb.4d.com/assetid=79587)

<!--more-->

# 4D NetKitを使用してEメールとフォルダを管理する
原文: [Trina Nguyen](https://kb.4d.com/assetid=79587)




## 目次<br />
* [概要](#概要)<br />
* [導入](#導入)<br />
* [4D NetKitを使用するための必要前提条件](#4d-netkitを使用するための必要前提条件)<br />
* [クライアントシークレットを取得するためにGoogleアプリケーションに登録する](#クライアントシークレットを取得するためにgoogleアプリケーションに登録する)<br />
* [接続を確立してアクセストークンを取得する(Google)](#接続を確立してアクセストークンを取得する)<br />
* [GoogleのGmail APIを使用してEメールを送信、受信、削除する](#googleのgmail-apiを使用してeメールを送信受信削除する) <br />
* [Eメールのラベルの作成、更新、割り当て](#eメールのラベルの作成更新割り当て)<br />
* [アプリケーションをMicrosoft Identityプラットフォームに登録する](#アプリケーションをmicrosoft-identityプラットフォームに登録する)<br />
* [接続を確立してアクセストークンを取得する(Microsoft)](#接続を確立してアクセストークンを取得する-1)<br />
* [Microsoft Graph APIを使用してEメールを送信、受信、削除する](#microsoft-graph-apiを使用してeメールを送信受信削除する)<br />
* [Eメールフォルダの作成、名称変更、削除](#eメールフォルダの作成名称変更削除)<br />
* [追加の資料](#追加の資料)<br />
* [結論](#結論)<br />



## 概要
インターネットがより安全なセキュリティプロトコルへと移行するに従い、認証システムも同じようにセキュリティが厳しくなっていきます。OAuth 2.0 は、かつてのユーザーネームとパスワードのプロトコルと比べて、その代替として、あるいはより安全なログイン方法として導入されました。OAuth 2.0 ではユーザーが何度も何度もログインをするのではなく、トークンと呼ばれるものを使用して他のWebアプリからユーザー情報を取得し、それを用いて自身のプラットフォームで認証を行います。4D 19 R3 で導入された4D NetKitは、4D アプリケーションとサードパーティWeb サービスおよびそのAPI 間のOAuth 2.0 接続を管理することでこれらのトークンを取得します。このテクニカルノートでは4D NetKit の基礎と、これを使用してどのようにGoogle のGmail およびMicrosoft のOffice365 へと接続するかについて説明していきます。


## 導入
4D NetKit はOAuth 2.0 を核としており、これは現在ではオンライン認証におけるIT 業界の標準のプロトコルとも呼べる存在となった技術です。4D はこれまでIMAP、SMTP、POP3 それぞれのトランスポーターにおいてOAuth 2.0 をサポートしてきましたが、4D NetKit が導入されたことでWeb ブラウザを起動し認証をプロセスを管理することが容易になりました。<br />

OAuth 2.0 では2種類のトークンを使用します。アクセストークンとリフレッシュトークンです。アクセストークンは標準のユーザーネームとパスワードの代わりに動作し、Web ブラウザからユーザーに対する認証リクエストという形で表現されます。アクセストークンが失効すると、OAuth 2.0 はリフレッシュトークンのフラグが有効化されたかどうかをチェックします。リフレッシュトークンはREST を通して取得され、アクセストークンが失効したあとも接続を開いたままにしておくことを許可し、自身が失効する際にも継続的に次のリフレッシュトークンを取得します。そうでない場合、つまりフラグが有効化されていない場合には、ユーザーは新しいアクセストークンを取得し直すためにWeb ブラウザ認証をもう一度やりなおす必要があります。<br />

![000.png](/images/TechNote/4D-NetKit/24-13_4DNetKit.pdf-image-000.png)

アクセストークンが取得できたら、それ自身が許可されたオペレーションを問題なく行うために、アクセストークンはサードパーティーAPI へと送り返されます。例えば、Google Calendar API から発行されたトークンは、Google Gmail API から発行されたトークンとは異なるアクセス権を持ちます。<br />



## 4D NetKitを使用するための必要前提条件
まず初めに、最新のバージョンの4D がインストールされていること、そしてその4D にWeb アプリケーションエクスパンションライセンスがインストールされていることが必要になります。これはトークンをリッスン、もしくは受信するために必要になるものです。このテックノートで触れている手法や、添付されているサンプルデータベースは、4D 20 R6 以降を対象としています。<br />

4D NetKit を使い始めるためには、その前にクライアントIDとクライアントシークレットが設定されている必要があります。添付のサンプルデータベースにはデモ目的にすでに登録されたアプリケーションが含まれています。しかしながら、デベロッパーはご自身のプログラムのために、ご自身のアプリケーションを登録する必要があります。このテックノートでは、Google のGmail API とMicrosoft のOffice365 API においてそれをどのように設定して行ったらいいかについて触れていきます。<br />

## クライアントシークレットを取得するためにGoogleアプリケーションに登録する
Google アプリケーションからのクライアントシークレットを取得するためには、以下の手順にしたがって下さい:<br />
1. https://console.developers.google.com/ にログインします。<br />
2. 左側のサイドバーメニューの“API とサービス”から、<b>認証情報</b>をクリックします。<br />(画像の中では"Credentials")<br />
![001.png](/images/TechNote/4D-NetKit/24-13_4DNetKit.pdf-image-001.png)<br />
3. <b>プロジェクトの作成</b>をクリックしてプロジェクトを作成し始めます。<br />
4. プロジェクトに名前をつけて<b>作成</b>をクリックして、その後に認証情報の画面に戻ります。<br />
5. <b>同意画面を構成</b>をクリックします。<br />(画像の中の赤枠)<br />![002.png](/images/TechNote/4D-NetKit/24-13_4DNetKit.pdf-image-002.png)<br />
6. 対象では<b>外部</b>をクリックし、<b>作成</b>をクリックして続行します。<br />(画像の中では"External"を選択して"CREATE"をクリック)<br />![003.png](/images/TechNote/4D-NetKit/24-13_4DNetKit.pdf-image-003.png)<br />
7. アプリの登録情報を編集画面で、必要な情報を入力します。アプリドメイン欄は今は空のままで構いません。<b>保存して続行</b>をクリックして次に移行します。<br />
8. スコープの画面において、<b>保存して続行</b>をクリックします。アプリケーションの用途に合致した他のスコープが必要になった場合には、後でスコープを追加することができます。<br />
9. テストユーザー画面において、<b>Add Users</b>をクリックして、このアプリケーションをテストモードで使用する人のEメールアドレスを追加します。<b>保存</b>をクリックします。<br />![004.png](/images/TechNote/4D-NetKit/24-13_4DNetKit.pdf-image-004.png)<br />
10. <b>概要</b>のページから、ページ下部にある<b>ダッシュボードに戻る</b>をクリックします。<br />
11. 左のサイドパネルから<b>認証情報</b>の画面に戻り、<b>認証情報を作成</b>をクリックし、選択肢から<b>OAuth クライアントID</b>をクリックします。<br />![005.png](/images/TechNote/4D-NetKit/24-13_4DNetKit.pdf-image-005.png)<br />
12. アプリケーションの種類から<b>デスクトップアプリ</b>を選択し、アプリの名前を入力したら<b>作成</b>をクリックします。<br />
13. OAuth クライアントが作成されましたというポップアップウィンドウが表示され、そこにアプリケーションのクライアントID とクライアントシークレットが表示されるはずです。また<b>JSON をダウンロード</b>オプション(画像内では"DOWNLOAD JSON"ボタン)をクリックすることでこの情報を.json ファイル形式に保存することもできますが、この情報は<b>認証情報</b>画面からいつでもアクセス可能です。<b>OK</b>をクリックして続行します。<br />![006.png](/images/TechNote/4D-NetKit/24-13_4DNetKit.pdf-image-006.png)<br />
14. 左のサイドバーから<b>ライブラリ</b>タブをクリックします。<br />(画像内では"Library")<br />![007.png](/images/TechNote/4D-NetKit/24-13_4DNetKit.pdf-image-007.png)<br />
15. <b>Google Workspace</b> 内の<b>Gmail API</b> ボックスが表示されるまでスクロールします。これをクリックして下さい。<br />![008.png](/images/TechNote/4D-NetKit/24-13_4DNetKit.pdf-image-008.png)<br />
16. このアプリケーションがGmail API を呼び出せるようにするために、青い<b>有効にする</b>ボタンをクリックして下さい。<br />(画像内での"ENABLE")<br />![009.png](/images/TechNote/4D-NetKit/24-13_4DNetKit.pdf-image-009.png)<br />

ここからは、デベロッパーは自分のプログラムが実際に公開になった際にはどのように振る舞うのかをテストできる"テスト"状態にしておくことを選択できます。ただし、アプリケーションが機密情報を扱うスコープ、つまりユーザーのアカウントからEメールを送信したり受信したりする権限を使用する場合、デベロッパーは自身のアプリケーションをGoogle の検証プロセスを通す準備をする必要があります。この点についての詳細は以下のページにあります:

OAuth App Verification Help Center<br />https://support.google.com/cloud/answer/13463073


## 接続を確立してアクセストークンを取得する
Google からアクセストークンを取得して接続を確立するためには、デベロッパーはまず4D NetKit OAuth2Provider オブジェクトを作成し、そこに前段の章で取得したクライアントシークレットを入力する必要があります。

```4d
// OAuth2 接続に必要な全ての情報を核の空いたオブジェクトを作成するメソッド
#DECLARE : cs.NetKit.OAuth2Provider

var $param : Object

$param:=New object()
$param.name:="Google"
$param.permission:="signedIn"
$param.clientId:="YOUR CLIENT ID"
$param.clientSecret:="YOUR CLIENT SECRET"
$param.redirectURI:="http://127.0.0.1:50993/authorize/"
$param.scope:="https://www.googleapis.com/auth/gmail.send"

// 新規OAuth2 オブジェクトを作成して返す
return cs.NetKit.OAuth2Provider.new($param)
```
$param オブジェクトの `.permission` 引数は、Microsoft またはGoogle が"signedIn" 引数を通してユーザーをサインインさせるか、あるいはMicrosoft 独自の認証で呼び出すか、またはGoogle でユーザーなしでアクセスするかを決定します。クライアントID とクライアントシークレットの値は前段の章で取得できるJSON ファイル内から取得したものです。redirectURI は"signedIn" モードでのみ使用され、認証後にサーバーがユーザーを転送する場所であり、通常は認証が正常に成功したことを表示するために使用されます。スコープはデベロッパーがユーザーに同意してほしいAPI 権限のコレクションです。

これを書いた後は、`.getToken()` メソッドを使用すると指定されたURL がデフォルトのブラウザを通して開くので、ユーザーは自身の認証情報を入力して接続することができます。以下のコードは、上記のコードの<i>GoogleProvider</i> メソッドから返されたOAuth2 オブジェクトを使用しています。

```4d
var $google : cs.NetKit.Google
Form.oAuth2:=GoogleProvider
Form.oAuth2.getToken()
```

開いたURL の画面は、以下のような見た目になるはずです。もしユーザーがエラー403: 画面に遭遇するようであれば、ここで使用したEメールの情報が、<b>OAuth同意画面</b>内の<b>テストユーザー</b>の画面で追加したユーザーのアドレスと合致しているかを確認してください。アプリが"テスト"ステータスになっている場合、使用されたEメールが<b>テストユーザー</b>の一覧に含まれている限り、接続を許可します。<br />
![010.png](/images/TechNote/4D-NetKit/24-13_4DNetKit.pdf-image-010.png)<br />


この段階においてアプリケーションが"稼働中"ステータスでありながら検証が済んでいない場合、Google はこのアプリケーションが接続を確立する前に検証を経る必要があるという旨を示す注意画面を送信します。
添付のサンプルデータベースはデモンストレーション目的に作成された単純なテストアプリケーションのため、これはいかなる公式のWeb ドメインにリンクされておらず、そのためGoogle はユーザーに対してこのアプリケーションが検証されていないことを示す警告を表示する可能性があります。それでもこのサンプルアプリケーションは4D のプライバシーポリシーを遵守しており、いかなる個人情報も個人Eメールも共有されたり変更されたりすることはありません。この処理を続けるには、「詳細」をクリックし、「4D NetKit Email Example（安全ではないページ）に移動」をクリックして移動します。<br />(画像内での赤枠の"Go to 4D NetKit Email Example (unsafe)"をクリック)<br />
![011.png](/images/TechNote/4D-NetKit/24-13_4DNetKit.pdf-image-011.png)<br />


するとユーザーはアプリケーションがEメールとEメールラベルにアクセスすることを許可するか拒否するかの選択が提示されます。接続を許可するには、「続行」を許可します。
接続が正常に確立されると、ブラウザは次にOAuth2 オブジェクトで入力されていたリダイレクト用のURI を開こうとします。このサンプルアプリケーションではこのURIは http://127.0.0.1:50993/authorize/ です。"signedIn"モードでは、4D NetKit 内に含まれているWeb サーバーが指定されたポート(50993)で開始され、プロバイダーのレスポンスを受信してブラウザ内に表示しようとします。このサンプルでは、デフォルトページが表示されます。


## GoogleのGmail APIを使用してEメールを送信、受信、削除する
Gmail API を使用した4D NetKit の使い方をデモンストレーションする最初のステップは、メールの送信です。これをするためには、まず最初に先の章のOAuth2 オブジェクトを使用してGoogle オブジェクトを作成します。この中のmailType 引数はEメールの送信と受信に使用されるメールタイプを指定し、取り得る値は“MIME” および“JMAP” です。


```4d
$google:=cs.NetKit.Google.new(Form.oAuth2; New object("mailType"; "JMAP"))
```

返されたオブジェクトには`mail.send()` 関数が格納されており、これを使用することでEメールの送信が可能になります。

```4d
// Eメールの作成
$email:=New object $email.from:="youremail@gmail.com"
$email.to:=”destinationmail@mail.com"
$email.subject:=”Test Gmail API"
$email.textBody:=”this is a Gmail API test"

// Eメールの送信
$status:=$google.mail.send($email)
```


メールを取得するには、`.getMailIds()` 関数を使用することで受信箱(INBOX)内の全てのメールIDを取得することができます。その後、特定のID に関してそのメールコンテンツをダウンロードする場合には、`.getMail()` 関数を使用します。また`.getMails()` 関数は`$mailIds` 引数にコレクションを渡すことでメールを複数同時に取得することもできます。この関数はメールをMIME または JMAP フォーマットで返します。


```4d
#DECLARE($OAuth2Provider : cs.NetKit.OAuth2Provider; $param : Object; $winRef : Integer)

var $mailIds:=[]
var $mails:=[]
var $mailId : Object
var $google : cs.NetKit.Google

$google:=cs.NetKit.Google.new($OAuth2Provider)

// EメールのIDを一括で取得
$mailIds:=$google.mail.getMailIds($param).mailIds

// 取得したメールIDのEメールのコレクションをダウンロード
If ($mailIds.length>0)
$mails:=$google.mail.getMails($mailIds)
End if
```


4D NetKit ではまた、`.delete()` 関数を使用する際にEメールを完全に削除するか、あるいはゴミ箱フォルダに移動させるかを選択することができます。以下のコードサンプルは、受信箱(INBOX)から最近のEメールを削除、またはゴミ箱フォルダに移動する例題です。

```4d
// メールを完全に削除する
$status:=$google.mail.delete($mailIds.mailIds.first().id; True)

// メールをゴミ箱に移動する
$status:=$google.mail.delete($mailIds.mailIds.first().id; False)
```

## Eメールのラベルの作成、更新、割り当て
Eメールのラベルを作成するのは簡単です。以下のように`.createLabel()` 関数を使用して、例えば"Backup" などのラベルを作成します:

```4d
$status:=$google.mail.createLabel({name: "Backup"})
$labelId:=$status.label.id
```

ラベル名、ラベル内の総メッセージ数、および未読メッセージなどはラベルID を使用して取得することができます。

```4d
$info:=$google.mail.getLabel($labelId)
$name:=$info.name
$emailNumber:=$info.messagesTotal
$unread:=$info.messagesUnread
```

また`.updateLabel()` 関数を使用することで、type=“user” のラベルであれば、その名前、表示状態、ラベルのカラーを変更することができます。例えば、以下のコードサンプルを使用して、ラベルの名前を違う名前へと更新することができます。

```4d
$status:=$google.mail.updateLabel($labelId; {name:"Backup January"})
```

Eメールに割り当てられたラベルを更新するためには、`.update()` 関数を使用します。この関数によって特定のメールID または複数のメールID に対してラベルの追加や削除を行うことができます。

```4d
// $mailIds 内にあるEメールに対してラベルを"Work" および "IMPORTANT" へと更新します。
$status:=$google.mail.update($mailIds; {addLabelIds: ["Work"; "IMPORTANT"]})

// $mailIds 内にあるEメールに対して"IMPORTANT" ラベルを削除するように更新します。
$status:=$google.mail.update($mailIds; {removeLabelIds: ["IMPORTANT"]})
```


## アプリケーションをMicrosoft Identityプラットフォームに登録する
NetKit を使用してへと接続しようとする前に、アプリケーションをMicrosoft Entra 管理センターへと登録する必要があります。
ここで、Microsoft にアプリケーションを登録する際にはいくつかの必要前提条件があることに注意して下さい。デベロッパーは登録がアクティブであるAzure アカウントを持っている必要があり、そのアカウントは少なくともCloud Application Administrator である必要があり、またテナントを設定するためのクイックスタートが完了している必要があります。
これらのステップを全て行うためには、以下のリンクのMicrosoft からの手順書に従って下さい:

https://learn.microsoft.com/ja-jp/entra/identity-platform/quickstart-register-app?tabs=certificate


## 接続を確立してアクセストークンを取得する
アプリケーションの登録が済んだら、接続手順はGoogle に接続した先の例題ととても似ています。最初に、OAuth2 オブジェクトを作成して、関連した情報と登録したアプリケーションから取得したクライアントID をそこに入力します。

```4d
// OAuth2 接続のための全ての情報を格納するオブジェクトを作成します
#DECLARE : cs.NetKit.OAuth2Provider

var $param : Object

$param:=New object()
$param.name:="Microsoft"
$param.permission:="signedIn"
$param.clientId:="YOUR CLIENT ID"
$param.redirectURI:="http://127.0.0.1:50993/authorize/"
$param.scope:=" https://graph.microsoft.com/.default"

// 新規のOAuth2 オブジェクトを作成します
return cs.NetKit.OAuth2Provider.new($param)
```

その後に、`.getToken()` コマンドを使用してアクセストークンを取得するためのMicrosoft Office ウィンドウを開きます。

```4d
var $office365 : cs.NetKit.Office365

Form.oAuth2:=MicrosoftProvider
Form.oAuth2.getToken()
```


実行した後には、ブラウザウィンドウには以下のようなページが開かれているはずです:<br />
![012.png](/images/TechNote/4D-NetKit/24-13_4DNetKit.pdf-image-012.png)<br />


## Microsoft Graph APIを使用してEメールを送信、受信、削除する
まず最初に、上記のOAuth2 情報を使用してMicrosoft365 オブジェクトを作成します。Google オブジェクト同様、Office365 もmailType にMIME とJMAP を指定することができます。しかしながら、Office365 には追加のメールタイプが存在し、それがデフォルトのオプションの"Micrrosoft" です。

```4d
$office365:=cs.NetKit.Office365.new($oAuth2; New object("mailType"; "Microsoft"))
```

それができたら、次にEメールを送信するためのEメールオブジェクトを作成する必要があります。以下のコード例では、Microsoft Graph の"message resource type" フォーマットを使用しています。

```4d
var $office365 : cs.NetKit.Office365

$email:=New object
$email.from:=New object
$email.from.emailAddress:="yourEmail@mail.com"

$addressTo:=New object
$addressTo.emailAddress:=New object
$addressTo.emailAddress.email:="sendToAddress@mail.com"

$email.subject:="Hello world"

$email.body:=New object
$email.body.content:="Test content mail"
$email.body.contentType:="text"

$status:=$office365.mail.send($email)
```


このコードはEメールオブジェクトを作成するための基礎の基礎しかカバーしていませんが、これをカスタマイズすることで受信者の名前、配信通知と開封確認のリクエストなどを設定することができ、また重要度フラグをつけて送信することもできます。
Eメールを受信するためには、最初にメールフォルダコレクションを受信し、そのコレクションの中から特定のEメールフォルダを選択する必要があります。

```4d
$folderList:=$office365.mail.getFolderList()

// $folderList はroot フォルダ内の全てのメールフォルダを格納したコレクション
$folders:=$folderList.folders
```

これ以降、`.getMails()` 関数を使用するとそのフォルダから全てのEメールを取得することができます。フォルダは、数字のID 番号か、あるいは選択されたフォルダがユーザー用にデフォルトで作成されたフォルダの場合にはその名前で識別することもできます。以下のコードサンプルはINBOX フォルダからEメールを取得する方法を示しています:

```4d
$param:=New object
$param.folderId:="inbox"

$mails:=$office365.mail.getMails($param)
```

Eメールの消去には `.delete()` 関数を使用します。以下は`$mails` コレクション内にあるEメールを全て削除する例です。

```4d
For each ($mail; $mails)
$office365.mail.delete($mail.id)
End for each
```

注意: Google とは異なり、Microsoft の回復可能な削除アイテムフォルダからはメールを完全に削除することはできない可能性があります。詳細な情報については、以下のリンクのMicorosoft のドキュメンテーションWeb サイトをご覧下さい: https://learn.microsoft.com/en-us/graph/api/message-delete?view=graph-rest-1.0&tabs=http 



## Eメールフォルダの作成、名称変更、削除
フォルダの作成は簡単です、`.createFolder()` 関数を使用すればたった1行しか必要ないからです。フォルダが作成されたあとは、`.move()` コマンドを使用することでEメールをその作成されたばかりのフォルダへと移動させることができます。以下のコードサンプルは、"Backup" フォルダの作成とそこへのメールの移動をあらわしています:


```4d
// root の下に新しいフォルダを作成
$status:=$office365.mail.createFolder("Backup")
If ($status.success)
$folderId:=$status.id

// Eメールを新しいフォルダに移動
$status:=$office365.mail.move($mailId; $folderId)
End if
```

新しく作成さいたフォルダは `.renameFolder()` 関数を使用して名称変更することもできます。

```4d
$status:=$office365.mail.renameFolder($folderId; "Renamed Backup")
$folderId:=$status.id
```

最後に、 `.deleteFolder()` コマンドを使用することで、フォルダ全体を削除することもできます。

```4d
$status:=$office365.mail.deleteFolder($folderId)
```

注意: このコマンドは指定されたフォルダ内にあるEメールを全て削除しますので、このコマンドを実行する前に消して良いかどうかを徹底的にチェックするようにして下さい。

## 追加の資料
4D NetKit およびその全てのクラスとコマンドについてのドキュメンテーションは、4D GitHub リポジトリにあります。4D NetKit を使用してGoogle やMicrosoft 、あるいは他の標準のOAuth2Provider クラスへと接続するためのその他の例題は、Fabrice Mainguené が作成した4D blog 記事やサンプルデータベースで見つけることができます。どちらのリソースも、以下のリンクから見つけることができます:

https://github.com/4d/4D-NetKit<br />
https://blog.4d.com/tag/4d-netkit/


## 結論
このテクニカルノートではGoogle API およびMicrosoft Office365 API の両方に向けてアプリケーションをセットアップするところから始まり、4D NetKit を使用してこれらへと接続し、よく使われる関数を呼び出すところまでをカバーしました。インターネットのプロトコルが時と共に成長して変化していく中で、すでにビルドされて確立されているサードパーティAPI へと認証し接続するための簡単で単純な方法へアクセスできることは、4D デベロッパーにとってより重要なこととなっていきます。
