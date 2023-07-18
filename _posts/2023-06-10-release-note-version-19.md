---
layout: fix
title: "4D v19.6 修正リスト"
date: 2023-07-07 08:00:00
categories: 修正リスト
tags: v19
build: 287333
version: "19.6"
permalink: /2023/161/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104050 アプリケーション起動時に「*libcef.dll* のエントリーポイント`IsThirdPartyinitialized`がみつからない」というエラーが表示されることがありました。

* ACI0104032 Windows版のみ。SDIモードのクライアントまたはデスクトップ版アプリを標準アクションで終了した場合，エラーメッセージが表示されました。イベントログにもイベント`1000`が記録されました。ACI0103923が修正されたことによる副作用のようです。

* ACI0103928 `LDAP password MD5 (0)`モードで`LDAP LOGIN`と`LDAP LOGOUT`を繰り返した場合，予期しないエラー`-2`が返されました。ACI0103594が修正されたことによる副作用のようです。

* ACI0104022 メッセージIDにURLエンコードされた文字が含まれている場合，`IMAPTransporter.searchMails()`でメールを検索することができませんでした。
 
* ACI0104013 4D Viewスプレッドシートのセルに埋め込まれた`Substring`がView Proのフォーミュラに正しく変換されませんでした。

* ACI0103982 `Get current printer`がシステム変数`OK`を更新しませんでした。

* ACI0103980 フォーカスできるオブジェクトが他に存在しないフォームにサブフォームを`1`個だけ配置し，サブフォーム内で *tab* キーを使用した場合，タブ順の始まりまたは終わりでフォーカスが失われ，タブ移動でオブジェクトを巡回できませんでした。

* ACI0103971 Windows版のみ。4D View Proエリアにテンキーを使用して小数点を入力した場合，ロケール設定に関係なく，ピリオド（`.`）が表示されました。

* ACI0103991 `IMPORT DATA`でインポートダイアログを表示し，ポップアップメニューで固定長テキストを選択した場合，スタイルシートがみつからないというエラーが返されました。

* ACI0103990 Mac版のみ。パッケージの著作権情報が`2022`年のままでした。

* ACI0103998 データベース設定を開いた状態でサーバーを終了しようとした場合，アプリケーションがクラッシュしました。

* ACI0103904 送信しようとしたSOAPリクエストに無効なXML文字が含まれている場合，アプリケーションがクラッシュする恐れがありました。*xerces* ライブラリから返される例外が処理されていないようです。テキストではなく，DOM参照を *XMLIn* として使用した場合に問題が発生します。

* ACI0103957 `entitySelection.query()`でＮ対１リレーション属性が`null`のエンティティセレクションをクエリした場合，返される結果が正しくありませんでした。

* ACI0103984 Mac版のみ。最小値を負の値に設定したルーラーのハンドルを操作してゼロよりも左に移動した場合，サーモメーターの表示がゼロを指したまま止まりました。

* ACI0102580 フランス語版のみ。Write ProツールバーのヘルプTIpsにスペルミスがありました。

* ACI0103976 Windows版のみ。Write Proエリアの上部に表示されるツールバーを使用してWrite Proドキュメントを *.4wp* 形式でエクスポートした場合，拡張子を入力しないとエラーが返されました。

* ACI0103944 Write Proツールバー（上部に表示されるタイプ）の検索ウィジェットに文字列を入力して検索を実行した場合，エラーが返されました。

* ACI0103884 プロジェクトモードのみ。メンテナンス＆セキュリティセンターで直接プロジェクトを開いた場合，インデックスファイルが検出されませんでした。プロジェクトを開いてからMSCを起動すれば問題ありません。

* ACI0101877 インポート＆エクスポートダイアログの上部にあるオブジェクトがダークモードに対応していませんでした。
 
