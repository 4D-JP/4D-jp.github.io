---
layout: fix
title: "4D v19.3 修正リスト"
date: 2022-06-04 08:00:00
categories: 修正リスト
tags: "19.3"
build: 279871
version: "19.3"
permalink: /153/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0102972 プロジェクトモードのみ。バイナリモードからデータベースを変換した場合，*Designer*アクセスグループからユーザーが外されました。*Administrator*グループの設定だけが正しくエクスポートされます。

* ACI0102923 SQLで`8001`バイト以上のデータをSybaseの画像フィールドに送信した場合，`255`バイトでデータが途切れました。ODBC Proプラグインでは問題ありません。

**注記**: 修正により，[`SQL SET OPTION:`](https://doc.4d.com/4Dv19/4D/19.1/SQL-SET-OPTION.301-5653382.ja.html)に新しいオプション*SQL data chunk size*が追加されました。デフォルト値は`8000`です。Sybase ODBC driverは，断片化された*PutData*命令に対応していないため，バイナリデータを一気に送信する必要があります。Oracle・MySQL・Microsoft SQL Serverなどのデータベース管理システムでは，特に設定を変更する必要はないはずです。

* ACI0102959 デバッガが接続されていないサーバーで直接RESTリクエストを処理した場合，予備プロセスおよび10分後に消滅するRESTプロセスが作成されました。

**注記**: [`Open datastore`](https://developer.4d.com/docs/ja/API/DataStoreClass.html)を使用せずにREST APIをダイレクトに呼び出した場合，セッション識別子（クッキー）は送信されません。修正により，そのような場合は新規RESTプロセスを作成するのではなく，予備プロセスが利用されるようになりました。

* ACI0102943 Write Proドキュメントで表の最終行を削除した場合，最終行と一緒に直後のセクションブレークも削除されました。

* ACI0102968	プラグインSDKのエントリーポイント`EX_GET_FIELD`でBLOBフィールドの値を取得できませんでした。

* ACI0102940 `MAIL New attachment`で作成したメールオブジェクトの添付ファイルをパラメーターとして別プロセスに渡すことができませんでした。

* ACI0102931 MIMEのバウンダリー文字列に`"boundary Wed, 27 Apr 2022 08:46:59 +0200 boundary"`のような文字列が使用されていた場合，`MAIL Convert from MIME`で添付ファイルが抽出できませんでした。

* ACI0102929 *SVG_New_embedded_image*でSVGにSVGを挿入した場合，エクスポートしたピクチャがブラウザに表示されませんでした。`xlink:href`が`data:image/svg+xml;base64,`から始まっていないためです。

* ACI0102908 コンパイルモードのみ。*collection.map()*や*collection.find()*のようなファンクションで実行したメソッドのポインター型で宣言されているパラメーターに`Null`を渡した場合，シンタックスエラー`#54`が返されました。

* ACI0102489 Mac版のみ。タブコントロールのアイコンが正しく表示されませんでした。右側のタブほど左に位置がずれて表示されます。
