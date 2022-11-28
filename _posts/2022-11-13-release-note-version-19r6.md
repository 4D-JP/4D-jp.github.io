---
layout: fix
title: "4D v19r6 Hotfix 1 修正リスト"
date: 2022-11-13 08:00:00
categories: 修正リスト
tags: 19r6 hotfix
build: 283540
version: 19r6
permalink: /326/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0103197 Windows版のみ。初期化されていない空のポップアップ/ドロップダウンメニューをクリックした場合，同じフォームに表示されたテキスト入力オブジェクトがクリックに反応しなくなりました。

* ACI0103226 Windows版のみ。Write Proドキュメントのスプール名がプリントジョブのキューに表示されませんでした。

* ACI0103242 Windows版のみ。ドロップダウンメニューのアイコンが正しく表示されませんでした。

* ACI0103244 文字列フィールドの最大文字数にサロゲート文字がかかってしまい，片側だけ（例: `Char(55356)`）がレコードに保存された場合，`LOG FILE TO JSON`のようにフィールド値をダンプするコマンドで二重引用符（`"`）が制御文字に飲み込まれてしまい，JSONを解析することができませんでした。半端なサロゲート文字は切り捨てられるべきです。

* ACI0103355 複数の4D ServerでSQLサーバーを公開した場合，SQLパススルー（ODBCを介さない直接的なSQLアクセス）の処理速度が低下しました。

* ACI0103377 プロジェクトモードのみ。プロジェクトを共有ドライブに置き，複数のクライアントから開発モードでサーバーにアクセスし，別のユーザーが編集しているためにロックされているフォームを開いた場合，そのユーザーがフォームを保存した後に他方のユーザーがフォームをリロードするとロック表示が解除されました。

* ACI0103417 すでに接続が確立されているメールボックスを更新した後，`IMAPTransporter.checkconnection()`を実行した場合，*success* に`false`が返されました。

* ACI0103418 `CALL WORKER`の第２パラメーターに渡したフォーミュラにローカル変数をパラメーターとして渡した場合，オブジェクト型のパラメーターが関数内関数のパラメーターとしてキャプチャされませんでした。

* ACI0103423 クライアント/サーバー版のみ。あるクライアントが`NEXT RECORD`でレコードをロードしようとした場合，別のクライアントまたはプロセスが`CREATE SET`で当該テーブルのセットを作成するのに通常の`100`倍の時間がかかりました。ビルド`280058`に問題があるようです。

* ACI0103430 大量のRESTリクエストを処理するとサーバーがクラッシュすることがありました。

* ACI0103440 インタープリターモードのみ。`#DECLARE`構文で戻り値を宣言せず，コンパイラー宣言（`C_DATE` `C_LONGINT`など）で`$0`を宣言した場合，アプリケーションがクラッシュしました。コンパイルモードでは問題ありません。

* ACI0103456 4D Go Mobileのデータセクションでプロダクションサーバーのデータファイルを選択した場合，テーブル名のフィルターを確定することができませんでした。フィルターを確定してからプロダクションサーバーのデータファイルを選択すれば問題ありません。

* ACI0103465 ブール型の変数を`Formula`で作成した`4D.Function`オブジェクトにパラメーターとしてキャプチャさせることができませんでした。