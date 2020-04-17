---
layout: post
title: 4D RESTセッションの理解を深める
date: 2020-04-17 01:00:00
categories: ブログ
tags: 18.x programming RESTserver  web
author: Intissar Elmezrouai
---

![cookie](/images/blog/04-20/better-understanding1.png)

前回の<a href="https://blog.4d.com/test-the-powerful-4d-server-with-postman/">ブログ</a>で、4D RESTサーバーを開始する方法をご覧いただきました。Postmanを使って異なるCRUD操作を経験し、完全なるRESTドキュメントへと導きました。今回のブログでは、4Dの中でセッションがどのように働くのかを説明します。これを理解することで、4D RESTサーバーを使ったセッションベースの承認システムの構築ができることを確信しています。

## 4D RESTセッション

認証システムの構築を目指すなら、あなたの探しているものは<strong>セッションベース</strong>のシステムです！

<strong>4DRESTサーバー</strong>への接続は、<strong>セッションベース</strong>です。これは、4Dサーバーがセッションを作るのは、最初のリクエストがクライアント(WASID4D)によって送られ、セッションクッキーが返送された時であるということです。全てのサブスクエント・リクエストに対して、クライアントはリクエストへのヘッダー中のセッションクッキーを返さなければ<strong>なりません</strong>。これは、サーバー側にはセッションが残っていないけれどクライアント上に保存されている、<strong>トークンベース</strong>認証とは反対になります。

## RESTサーバーを構築

では、セッションの扱い方をよく理解できたところで、さらに前進します。始める前に、4D RESTサーバーを開始しえて、構成します。さらに始める前に、この<a href="https://blog.4d.com/test-the-powerful-4d-rest-server-with-postman">ブログ</a>あるいは<a href="https://developer.4d.com/docs/ja/REST/configuration.html">ドキュメントセンター</a>を参照してください。

## ON REST AUTHENTICATIONメソッド

データベースメソッドの<strong><span class="notranslate method"><span style="color: #222222;">On REST Authentication</span></span></strong>によって、4D上でRESTセッションの開き方のコントロールをカスタマイズする方法が使えるようになります。RESTセッションを開くリクエストを受けた時、接続確認（例：ユーザー名とパスワード）がリクエストのヘッダーに提供されます。<strong><span class="notranslate method"><span style="color: #222222;">On REST Authentication</span></span></strong>データベースメソッドが呼ばれるので、これらの認証を評価でき、<strong>True</strong>（セッションの開始を承認）あるいは<strong>False</strong>（セッションの開始を拒否）を返します。

 ![on rest authentication](/images/blog/04-20/better-understanding2.png)

<strong>注記</strong>：このデータベースメソッドがデータベースへの独自のアクセスコントロールのコーディングに使われている間、アクセスは4Dユーザー・グループを使って制限することも可能です。データベースを表示している際に、データベース設定 > Web > RESTリソース・タブにアクセスを許可されたグループを選択します。この<a href="https://blog.4d.com/multiple-4d-data-sources-interested/">ブログ</a>で記憶を取り戻してください。

## セッションを開く

セッションの開始を図解するには、ログインとパスワードを伴うサブミッション・フォームを想像しましょう。POST リクエストの<strong>ヘッダー</strong>内の認証情報を送るのにPostmanを使っています。RESTを通じて4Dアプリケーション内のセッションを開くために、<strong>$directory/login:</strong>を使います。

 ![on rest authentication](/images/blog/04-20/better-understanding3.png)

4Dに戻ってどうなるか見てみましょう。

 ![on rest authentication](/images/blog/04-20/better-understanding4.png)

ご覧の通り、データベースメソッドはパラメータを受け取ります。

- ユーザー名には$1
- パスワードには$2
- $3は、パスワードがハッシュされたらTrueを、されなかったらFalseを返します。
- $4はコーラーのIPアドレスを保持します。


<strong>注記</strong>：現実には、パスワードはハッシュされて、暗号化されていない状態で送られることはありません。<strong>ハッシュされたパスワード</strong>を送るには、<strong>password-4D</strong>の代わりにhashed-password-4Dパラメータを使うことができます。この<a href="https://developer.4d.com/docs/ja/REST/directory.html#directorylogin">コードサンプル</a>でどのように処理するかチェックしてください。

一度リクエストが受け取られると、サーバーはセッションを開き、セッションクッキーをクライアント (WASID4D)へ送り返します：

 ![on rest authentication](/images/blog/04-20/better-understanding5.png)

これでセッションが作成されました。結果として生じるHTTPリクエストへそのIDを返すにはどうしたらよいでしょう。

待ってください…なぜ、最初にこれをやる必要があるのでしょう。

## セッション管理

HTTPは「ステートレス」プロトコルです…クライアントがWebページに接続するたびに、Webサーバーへ区別して接続を開きます。サーバーは以前のクライアント・リクエストのレコードを保持しません。数千のクライアントがサーバーに接続することを想像してみると、どのセッションが自分か知る手段がありません。そこでセッションIDが登場します。セッションIDの交換を通して、ステートが保たれます。正確には何を意味するのでしょうか。同じセッションを再利用するために、全ての後続のRESTリクエストが、リクエストの"<strong>Cookie</strong>"ヘッダー内に<strong>session ID</strong>を含んでいるかを確認する必要があるということです。その一方で、新しいセッションが開かれます（そして新しいセッションとは新しいライセンスを意味します）。

## サンプル

セッションを操作する方法は、実際にはHTTPクライアントに依存します。いわば、<span class="notranslate command"> <strong>HTTP Request</strong></span>コマンドを通してリクエストが操作されるコンテキストの中にいます。

ヘッダーの中にセッションIDを含めるには、最初にそれを見つけなければなりません。それは簡単です！セッションにはWASID4Dキーがあることは分かっていますので、<span class="notranslate command"> <strong>Find in array</strong></span>コマンドを使ってヘッダーの値の中にこのキーを探すだけです：

<code class="fourd"><span class="notranslate command"> Find in array</span>(<span class="notranslate variable">$headerValues</span>;"WASID4D@")</code>

見つけたら解凍します。

<code class="fourd"><span class="notranslate variable">$start</span>:=<span class="notranslate command">Position</span>("WASID4D";<span class="notranslate variable">$cookie</span>) <br />
<span class="notranslate variable">$end</span>:=<span class="notranslate command">Position</span>(";";<span class="notranslate variable">$cookie</span>) <br />
<span class="notranslate variable">$uuid</span>:= <span class="notranslate command">Substring</span>(<span class="notranslate variable">$cookie</span>;<span class="notranslate variable">$start</span>;<span class="notranslate variable">$end</span>-<span class="notranslate variable">$start</span>)</code>

<span class="notranslate variable">$uuid</span>は、全ての後続のリクエストの中で送られるセッションIDをホストします。完全なサンプルは<a href="https://developer.4d.com/docs/ja/18.0/REST/authUsers.html">ここ</a>からご覧ください。

## セッション・タイムアウトをコントロール

初期設定では、セッションが無活動の<strong>タイムアウト</strong>は<strong>60分</strong>でそれより短くはできません。しかし、4directory/loginメソッドを伴ってPOSTヘッダー内へ渡すことのできる”<strong>session-4D-length</strong>”パラメータの値を使って、タイムアウトの長さを増やすことはできます。

## おまけ

4D Serverは、前回のクエリーやオーダー・コマンドをベースにしたエンティティー・セレクションを保存している<a href="https://doc.4d.com/4Dv18R2/4D/18-R2/Datastores.300-4824250.ja.html#4687963">セッション</a>を持っています。そのため、データの次の”範囲”（あるいはチャンク）が必要なとき、クエリー/オーダーを再度行う必要がありません。シンプルにデータの次のセットを送るだけです。このメカニズムは、トランザクションやペシミスティック・ロックなどの使用を可能にしています。

## 次回予告

RESTサーバーは4D v18で大きく拡張され、将来にはさらに多くの機能が登場します。しばらくの間、サンプルや実際の使用例を提供する予定です。<a href="https://forums.4d.com/MyHome/FR">4Dフォーラム</a>での意見交換にご参加ください。


