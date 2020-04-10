---
layout: post
title: 強力な4D RESTサーバーをPOSTMANでテストする
date: 2020-04-10 01:00:00
categories: ブログ
tags: 18.x programming RESTserver  web
author: Intissar Elmezrouai
---

![Postman](/images/blog/04-20/postman_rest.png)

4Dは、あなたの4Dデータベースに保存したデータへ直接アクセスできる強力な<a href="https://developer.4d.com/docs/en/REST/gettingStarted.html">RESTサーバー</a>を提供しています。これによって、例えば、モダンなフロントエンド・テクノロジー（Angular、Reactなど）を使ったAPIの構築が可能です。このブログでは、4Dの堅牢なRESTサーバーを初めてご紹介します。また、APIテストツール、<a href="https://www.postman.com/">Postman</a>を使用して、作成、取得、更新、削除 (CRUD) の各操作をテストする方法を説明します。

## RESTサーバーの構成

<strong>注意</strong>：もしすでにRESTサーバーと4Dデータベースの構成方法をご存知の場合は、この後の２章はスキップしてください。

4D RESTサーバーを使えるようにするには、最初に構成が必要です（シングル・クリックで起動して動作します）。「データベース設定」の「Web / RESTリソース」ページの「RESTサーバーとして公開」にチェックするだけでRESTリクエストを処理することができます。

![Postman](/images/blog/04-20/postman2.png)

## 4Dデータベースを作成して構成する

このステップは、すでにデータベースを作成してRESTサーバーを有効にしていると仮定しています。ストラクチャーに新しいテーブル [Tasks]とその２つの属性：Title (Alpha)とComplete (Boolean)を作成します。初期設定では、全てのテーブルはRESTで公開されます：

<strong>重要</strong>：テーブルとフィールド名はJSONに準拠（発音区別文字やスペースは不可）しなければなりません。

![Postman](/images/blog/04-20/postman3.png)

- では、入力と出力のフォームを作成します。Tasksテーブルにいくつかのタスクを入力します。
- 『実行メニューから「<strong>WEBサーバーを開始</strong>」（もしまだ開始していない場合）を選択し、次に「<strong>WEBサーバーをテスト</strong>」を選択します。
- おめでとうございます！RESTリクエストだけを使って4D内のデータを読んだり、編集できるようになりました

指示する方法は簡単です。WEBブラウザーを開いて、<strong>ADDRESS/PORT</strong>の後に”<strong>/rest</strong>”を挿入します。（全ての4D REST URLリクエストは/restで始まります。）
例えば、[Task]データクラスの全てのエンティティーを得たい場合は、以下のように処理できます：

![Postman](/images/blog/04-20/postman4.jpg)

## Postmanを使ってAPIをテスト

4D RESTサーバーについて驚くべきことは、<strong>CRUD</strong>（と<a href="https://developer.4d.com/docs/en/REST/%7BdataClass%7D.html">それ以上の</a>）操作をAPIが提供することです…では、見てみましょう！
エンティティーの作成、読み込み、更新あるいは削除にあたっては<strong>1行のコードも必要ありません</strong>。全てがセットアップされています。よく知られているように、CRUDはデータベース操作の中で最も重要なグループです。ユーザーがデータを作成し、管理するのに必要なメインの機能だからです。

この驚異的なAPIをテストするために、<a href="https://www.postman.com/">Postman</a>（RESTに最適のAPIをテストするための素晴らしいツール）を使います。Postmanは、GET、POST、PUT/UPDATE、DELETEや様々な他のリクエスト・メソッドのように、HTMLメソッドを作るための洒落たユーザー・インターフェイスを提供します。

注意：Postmanの使用は単純明快ですが、もし始めるにあたってヘルプが必要であれば、この<a href="https://www.youtube.com/watch?v=7E60ZttwIpY&list=PLM-7VG-sgbtAgGq_pef5y_ruIUBPpUgNJ">ビデオ</a>を見てください。

## タスクのリストを得る

Postmanをダウンロードしたら、異なるリクエストを作ります。とても明快なリクエストから始めましょう。タスクのリストを（[Tasks]テーブルから）検索します。前に述べたように、[Task]データクラスの全てのエンティティーを得るためには、<strong>ADDRESS/PORT</strong>の後に<strong>/rest/NameOfTheDatabase</strong>を挿入します。

1. メソッドのリストからGETメソッドを選択します。
2. URLをコピーします。
3. 送信をクリックします。
4. ほら、できました。

![Postman](/images/blog/04-20/postman5.png)

ご覧の通り、タスクのリストを検索するためには１行のコードも必要ありません

## 新しいタスクを作る

データクラスに新しいタスクを加えることもできます… これもコード不要です。
APIはすでに設定されています！

新しいエンティティーを作成するために、このURLは新しいポスト・リクエストを起動します：　<strong>ADDRESS/PORP/rest/NameOfTheDataclass/?$method=update</strong>。それを実行するには、アプリケーションにJSONリクエストを送る必要があります。もしGETリクエストから結果をチェックすれば、新しいタスクを作成するのに必要な鍵となるアイデアが得られるでしょう。では、このロジックに従って、私たちにはタイトルと完全なフィールドだけが必要で、その他（キー、タイムスタンプ、スタンプ、ID）は4Dが対応します。

1. メソッドをPOSTに変更します。
2. URLを挿入します。
3. 送信をクリックします。
4. 新しいタスクを追加します。
5. 成功=trueを確認します。

![Postman](/images/blog/04-20/postman6.png)

最初のタブ（GETメソッド）に戻り、<strong>送信</strong>をクリックしてタスクが追加されたことを確認します。4Dの出力フォームにも行き、新しいタスクが追加されているか確認します。

![Postman](/images/blog/04-20/postman7.jpg)

## タスクの更新

エンティティーを更新するには、エンティティーを作成したのと同じメソッドを使います。<strong>$method=update</strong>は１つのPOST中の１つ以上のエンティティーを更新できます。それを実行するには、オブジェクトの中の_KEYと_STAMPパラメータを修正した属性とともに渡す必要があります。

サンプルでは、ヘミングウェイの不朽の名作のひとつ『老人と海』を読みました。従いまして、タスクの<strong>complete</strong>ステータスをtrueに変える必要があります。簡単にできます：

![Postman](/images/blog/04-20/postman8.png)

## タスクの削除

エンティティーの削除もシンプルです。サンプルでは、ID=3 (“test”のコール）のタスクを削除します。問題ありません！deleteメソッドを呼び出して、そのIDを特定します：<strong>dataclass(ID)?$method=delete</strong>。

![Postman](/images/blog/04-20/postman9.png)

データベースに戻り、エンティティーが削除されてことを確認します。

## この次には

ご覧の通り、4D RESTサーバーはとても強力です。たった今、デモしたようなこと以上にリッチな<a href="https://developer.4d.com/docs/en/REST/manData.html">API</a>を提供します。わずかな時間でできることはもっとあります。詳細な<a href=“https://developer.4d.com/docs/en/REST/%7BdataClass%7D.html“>ドキュメント</a>を参照してください。この先のブログで、認証についてのtipを共有し、その後で、4DデータベースへwebアクセスするためにAngular 7とRESTで書かれた完全なフロントエンド・アプリケーションも説明します。
