---
layout: post
title: 複数の4Dデータソースに興味がありますか？
date: 2019-11-07 00:00:00
categories: ブログ
tags: 18.x programming
author: Marie-Sophie Landrieu-Yvert
---

![Multiple 4D datasource](/images/blog/11-1/HDIabout-1.png)

このタイトルが既にヒントかもしれませんが、ワクワクするような新しい機能が4D v18で告知されました！

この機能はクライアント/サーバーの動作に新しい可能性を開くものです。カレントのデータベースに限定するのではなく、永続的なネットワーク接続を必要とするのもなく、4D v18のアプリケーションは4D Server上に公開された、別の、リモートの、4Dデータベースからデータを入手できます！

この機能のおかげで多くのオプションが可能になりました。例えば、オフラインで動き、リモートデータにアクセス可能な時にだけローカルデータを同期するアプリケーションを構成することができます。あるいは、複数のサーバーにデータを公開し、必要に応じて切り替えることも考えられます。別のオプションとしては、異なるデータベース（例：ローカルデータ、インターナショナルデータ）上にデータモデルを分割しすることも可能です。別の場所にデータを配信して一つの４Dクライアント・コード（プロジェクト・メソッドとフォームオブジェクト）を通じてアクセスできるようにするのはいかがでしょう？これらすべてのシナリオは実現可能で、このブログでその方法を説明します。


{:.download}
[リモートデータストアと作業する方法](https://github.com/4D-JP/HDI/releases/download/18/HDI_Remote_Datastore.zip)

4D v18を使えば、他の4Dクライアントに対して、RESTサーバーとして公開できます。これは、4Dクライアントが公開したデータと相互通信（作成、読み込み、更新、削除）できることを意味します。さらに良いことに：この通信はORDAコンセプトをベースにしているので、完全にオブジェクト指向なのです！

#### どのように4Dデータベースをリモートアクセスに対して公開するのか？

データベース中のウェブ設定は：
* 設定タブで、HTTPポートを設定します。（セキュリティーのため、プロダクションモードではHTTPSを使うことを確認します！）
![Multiple 4D datastore](/images/blog/11-1/HTTPServer-1.png)

* RESTリソース・タブ上で、「RESTサーバーとして公開」オプションを選択します。
![Multiple 4D datastore](/images/blog/11-1/HTTPServer-2.png)

* Webサーバーを開始します。上記のサンプルでは、データベース起動時にサーバーを開始するを選択します。
* 4D Server上でデータベースを開きます。
* おめでとうございます！あなたのデータベースが、あなたのマシンのIPと設定したポートを経由して、リモートアクセスで接続可能になりました！

注意：Webサーバーを使ってRESTサーバーへアクセスするには、Webサーバー・ライセンスは必要ありません。接続には標準の4Dクライアント・ライセンスが使われます。

#### リモートデータベースを使って動作する
##### OPEN DATASTOREコマンド
前述のように、あなたのデータベースはORDAコンセプト経由で接続可能になります：データベースはdatastoreオブジェクトを使って操作されます。従って、最初のステップは、アクセスしたいリモートデータベースに関連したdatastoreオブジェクトを得ることです。問題ありません！Open datastoreコマンドで正確なホスト名を呼び出せば動きます。

datastoreオブジェクトをローカルID “students”に関連付けます。これでORDAを使ってリモートデータベースと作業（クエリーの起動、エンティティのロード/更新など）が出るようになります。

<code class="fourd"><span class="no translate command">C_OBJECT</span>(<span class="notranslate variable">$connectTo</span>;<span class="notranslate variable">$schoolDS</span>;<span class="notranslate variable">$s</span>)
<span class="no translate command">C_TEXT</span>(<span class="notranslate variable">$dataClass</span>)

//The database contains a Students data class

<span class="notranslate variable">$connectTo</span>:=<span class="notranslate command">New object</span>("hostname";"school.acme.com")
<span class="notranslate variable">$schoolDS</span>:=<span class="notranslate command">Open datastore</span>(<span class="notranslate variable">$connectTo</span>;"students")  <span class="notranslate comment">//local id of this remote datastore is "students"</span>
<span class="notranslate comment">//Start working with ORDA means</span>
<span class="notranslate command">ALERT</span>("They are "+<span class="notranslate command">String</span>(<span class="notranslate variable">$schoolDS</span>[<span class="notranslate variable">$dataClass</span>].<span class="notranslate objectfunction">all()</span>.<span class="notranslate objectattribut">length</span>)+" students")

<span class="notranslate comment">//Run an ORDA query on the Students dataclass</span>
<span class="notranslate variable">$s</span>:=<span class="notranslate variable">$schoolDS</span>[<span class="notranslate variable">$dataClass</span>].<span class="notranslate objectfunction">query</span>("lastname=:1";"Smith").<span class="notranslate objectfunction">first()</span>
<span class="notranslate keyword">If</span> (<span class="notranslate variable">$s</span>#<span class="notranslate command">Null</span>)
  <span class="notranslate command">ALERT</span>("Student "+<span class="notranslate variable">$s</span>.<span class="notranslate objectattribut">lastname</span>+" lives in "+<span class="notranslate variable">$s</span>.<span class="notranslate objectattribut">address</span>.<span class="notranslate objectattribut">city</span>)
<span class="notranslate keyword">End if</span>
</code>

Open datastoreドキュメントをチェックして、安全な接続(TLS)でリモートデータベースにアクセスする方法を参照してください。

### 複数のリモートデータベースを使う
以下は、複数のリモートデータベースで動作させるのがいかに簡単かを説明した短い例です。二つのデータベースがあります：一つはフランス人の生徒が含まれていて、もう一つにはイギリス人の生徒が含まれています。

フランス人の生徒を見るか、イギリス人の生徒を見るか選択できます。
![Multiple 4D datastore](/images/blog/11-1/HTTPServer-3-left.png)
![Multiple 4D datastore](/images/blog/11-1/HTTPServer-3-right.png)

フォームメソッド：

<code class="fourd"><span class="notranslate keyword">Case of</span>  
 :(<span class="notranslate command">FORM Event</span>.<span class="notranslate objectattribut">code</span>=<span class="notranslate constant">On Load</span>)
<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">frenchServer</span>:="french.acme.com"
<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">englishServer</span>:="english.acme.com"
<span class="notranslate keyword">End case</span></code>


「フランス人の生徒を見る」ボタンの背後にあるオブジェクトメソッドです：

<code class="fourd"><span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$connectTo</span>;<span class="notranslate variable">$students</span>)
<span class="notranslate variable">$connectTo</span>:=<span class="notranslate command">New object()</span>
<span class="notranslate variable">$connectTo</span>.<span class="notranslate objectattribut">hostname</span>:=<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">frenchServer</span>
<span class="notranslate variable">$students</span>:=<span class="notranslate command">Open datastore</span>(<span class="notranslate variable">$connectTo</span>;"french") <span class="notranslate comment"> //datastore containing French students</span>
<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">students</span>:=<span class="notranslate variable">$students</span>.<span class="notranslate objectattribut">Students</span>.<span class="notranslate objectfunction">all()</span>
</code>

「イギリス人の生徒を見る」ボタンの背後にあるオブジェクトメソッドです：

<code class="fourd"><span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$connectTo</span>;<span class="notranslate variable">$students</span>)
<span class="notranslate variable">$connectTo</span>:=<span class="notranslate command">New object()</span>
<span class="notranslate variable">$connectTo</span>.<span class="notranslate objectattribut">hostname</span>:=<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">englishServer</span>
<span class="notranslate variable">$students</span>:=<span class="notranslate command">Open datastore</span>(<span class="notranslate variable">$connectTo</span>;"english") <span class="notranslate comment">//datastore containing English students</span>
<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">students</span>:=<span class="notranslate variable">$students</span>.<span class="notranslate objectattribut">Students</span>.<span class="notranslate objectfunction">all()</span></code>

Open datastoreコマンドを最初に呼び出した時は、データストアオブジェクトはメモリーにロードされ、セッションはサーバーで開かれます。その後の呼び出しでは、このデータストアオブジェクトの参照を返すだけです。

#### リモートデータベースへのアクセスを管理

公開したデータベースを安全に保つために、アクセスにフィルターをかけることができます。Open datastoreコマンドを別の面で見てみましょう。以下のようにユーザーとパスワードを渡すことができます。

<code class="fourd"><span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$connectTo</span>;<span class="notranslate variable">$myStudents</span>)
<span class="notranslate command">ON ERR CALL</span>("manageErrors")
<span class="notranslate variable">$connectTo</span>:=<span class="notranslate command">New object()</span>
<span class="notranslate variable">$connectTo</span>.<span class="notranslate objectattribut">hostname</span>:="students.acme.com"
<span class="notranslate variable">$connectTo</span>.<span class="notranslate objectattribut">user</span>:="mary@4d.com"
<span class="notranslate variable">$connectTo</span>.<span class="notranslate objectattribut">password</span>:=<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">password</span>
<span class="notranslate comment">//local id of this remote datastore is "students"</span>
<span class="notranslate variable">$myStudents</span>:=<span class="notranslate command">Open datastore</span>(<span class="notranslate variable">$connectTo<span>;"students") 
<span class="notranslate command">ON ERR CALL</span>("")
</code>

4Dは二つの方法で権限のあるユーザーのアクセスを制限できます。

### 4Dユーザーグループを使う
4Dユーザーグループを使ってアクセスを制限できます。データベースを公開した時に、Web設定ページのRESTリソース・タブでアクセスを許可するグループを選択します。

![Multiple 4D datastore](/images/blog/11-1/HTTPServer-4.png)

もしもOpen datastoreコマンドで与えられたユーザーが、選択されたグループに属している場合、アクセスは受け入れられますが、そうでない場合は承認エラーが生成されます。

### ON REST AUTHENTICATIONデータベース・メソッドを使う
また、新しいOn REST authenticationデータベース・メソッドを使って、公開したデータベースへの独自のアクセスコントロールをコード化することもできます。このメソッドは、Open datastoreコマンド中のユーザーの資格を受け取ります。もしユーザーがリモートデータベースでの作業を許されている場合はシンプルにTrueを返します。

下記はサンプルです：

<code class="fourd"><span class="notranslate command">C_TEXT</span>(<span class="notranslate variable">$1</span>;<span class="notranslate variable">$name</span>;<span class="notranslate variable">$2</span>;<span class="notranslate variable">$password</span>)
<span class="notranslate command">C_BOOLEAN</span>(<span class="notranslate variable">$0</span>;<span class="notranslate variable">$result</span>;<span class="notranslate variable">$3</span>;<span class="notranslate variable">$digest</span>)
<span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$user</span>)

<span class="notranslate variable">$name</span>:=<span class="notranslate variable">$1</span> <span class="notranslate comment">// The user to provide in Open datastore command</span>
<span class="notranslate variable">$password</span>:=<span class="notranslate variable">$2</span> <span class="notranslate comment">// The password to provide in Open datastore command</span>
<span class="notranslate variable">$digest</span>:=<span class="notranslate variable">$3</span> <span class="notranslate comment">// True if password is hashed</span>

<span class="notranslate variable">$result</span>:=<span class="notranslate command">False</span><span class="notranslate comment">

//Search for the user in our Users dataclass</span>
<span class="notranslate variable">$user</span>:=<span class="notranslate command">ds</span>.<span class="notranslate tablename">Users</span>.<span class="notranslate objectfunction">query</span>("name=:1";<span class="notranslate variable">$name</span>).<span class="notranslate objectfunction">first()
</span>
<span class="notranslate keyword">If</span> (<span class="notranslate variable">$user</span>#<span class="notranslate command">Null</span>)
<span class="notranslate comment">// Passwords are hashed in Users dataclass </span>
     <span class="notranslate keyword">If</span> (<span class="notranslate variable">$digest</span> &amp; (<span class="notranslate variable">$user</span>.<span class="notranslate objectattribut">password</span>=<span class="notranslate variable">$password</span>)) 
           <span class="notranslate variable">$result</span>:=<span class="notranslate command">True</span>
       <span class="notranslate keyword">End if
End if</span>

<span class="notranslate variable">$0</span>:=<span class="notranslate variable">$result</span></code>


<strong>注意</strong>：<a href="https://doc.4d.com/4Dv18/4D/18/ds.301-4505926.en.html"><span class="no translate command">ds</span></a>と<a href="https://doc.4d.com/4Dv18/4D/18/dataStoregetInfo.305-4505928.en.html"><span class="notranslate command">datastore.getInfo()</span></a>コマンドは更新されて、新たに三つのメソッドが追加されました：<a href="https://doc.4d.com/4Dv18/4D/18/dataStorestartTransaction.305-4688526.en.html"><span class="notranslate command">datastore.startTransaction()</span></a>、<a href="https://doc.4d.com/4Dv18/4D/18/dataStorecancelTransaction.305-4688550.en.html"><span class="notranslate command">datastore.cancelTransaction()</span></a>、<a href="https://doc.4d.com/4Dv18/4D/18/dataStorevalidateTransaction.305-4688592.en.html"><span class="notranslate command">datastore.validateTransaction()</span></a>です。

では、HDI（例題）をダウンロードしてこの素晴らしい機能を学びましょう！
