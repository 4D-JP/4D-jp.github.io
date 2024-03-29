---
layout: fix
title: "4D v19.5 Hotfix 2 修正リスト"
date: 2023-02-08 08:00:00
categories: 修正リスト
tags: 19.5 hotfix
build: 284932
version: "19.5"
permalink: /2023/39/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0102569 ツールボックスの「新パスワード」フィールドには，最大`15`文字しか入力できませんでした。「確認用パスワード」にはいくらでも入力できます。

* ACI0103209 エクスプローラーで編集状態のプロジェクトメソッド名の末尾にキャレットを移動し，名称を変更した場合，`33`文字以降が切り捨てられませんでした。プロジェクトを再起動すれば超過文字列が切り捨てられます。

* ACI0103225 ネイティブSQLコマンドで`SELECT`を実行して数値をテキスト配列で受け取った場合，整数値が文字列に自動変換されませんでした。ODBC Proであれば問題ありません。

* ACI0103452 とても長いフォーミュラをクイックレポートエディターのカラムに記述した場合，ヘッダーのタイトルにフォーミュラの全文が表示され，スクロールすることもできないために，他のカラムを編集することができませんでした。

* ACI0103514 フォームエディターでスタティックピクチャをペーストまたは複製した場合，重複するオブジェクト名が発行され，既存のスタティックピクチャが失われる可能性がありました。

* ACI0103533 テキストフィールドの背景色が透明に設定されたラベルをラベルエディターにインポートした場合，グレーの背景色が表示されました。

* ACI0103537 Windows版のみ。Write Proツールバーのタブがビットマップフォントで表示されました。

* ACI0103541 フォームに埋め込まれたクイックレポートエディターのカラムをドラッグ＆ドロップした後，右クリックメニューが正しく更新されませんでした。

* ACI0103550 フォームに配置したクイックレポートエディターに列を追加しようした場合，エラーが返されました。

* ACI0103570 スケーラブルセッション管理が有効にされている場合，*On Web Connection* データベースメソッドはスレッドセーフであることが求められますが，コンパイラーがプリエンプティブモードに対応していないコードを検出しませんでした。一旦，セッションなしを選択してから，スケーラブルセッション管理を有効にすれば問題ありません。

* ACI0103577 １対Ｎリレーション属性（複合インデックス）をORDAで検索した後，同じ属性をORDAでシーケンシャル検索した場合，アプリケーションがフリーズまたはクラッシュしました。

* ACI0103579 クイックレポートエディターのマスターテーブルに非表示フィールドが存在する場合，間違ったフィールドが挿入されました。

* ACI0103608 クライアント/サーバー版のみ。*On Startup* で`CHANGE CURRENT USER`を使用した場合，デザインモードでセットしたブレークポイントが保存されませんでした。

* ACI0103610 `LOAD VARIABLES`で空のピクチャ変数をロードした場合，アプリケーションがクラッシュしました。

* ACI0103621 データファイルを開いていない状態でメンテナンス＆セキュリティセンターの復元ボタンをクリックすると，アプリケーションがクラッシュしました。

* ACI0103626 データべース設定のセキュリティページには，「フォーミュラエディターと4D Write Proドキュメントで使用できるコマンドとプロジェクトメソッドの制限」という項目があります。この設定は4D View Proにも適用されるものですが，そのことが項目名に反映されていませんでした。

* ACI0103629 リストボックスの交互に使用する背景色（`alternateFill`）をCSSで自動交互色（`automaticAlternate`）に設定した場合，CSS解析エラーが返されました。

* ACI0103632 クライアント接続ライセンスとREST拡張ライセンスの両方がインストールされているサーバーにクライアントとRESTの両方でアクセスし，RESTセッションがタイムアウトに達した場合，一部のRESTライセンスが解放されませんでした。

* ACI0103639 フォームの異なるページに同名のオブジェクトが存在する場合，Apple Siliconターゲットのコンパイルで*Internal error while compiling with clang* というエラーが返されました。

* ACI0103645 Mac版のみ。タブコントロールのベースラインが低くレンダリングされました。

* ACI0103649 クライアント/サーバー版のみ。プロジェクトをフィーチャーリリースで開いた後にLTSバージョンで開いた場合，*Extras* *Plugins* *Components* フォルダー同期エラーが返されました。

* ACI0103652 テキスト入力の*On Getting Focus* イベント中に`Pop up menu`を実行した後，`POST KEY`で`Tab`を送信した場合，フォームのどこをクリックしてもテキスト入力が再フォーカスされてイベントが繰り返されました。フォームイベントをトレースすれば問題ありません。

* ACI0103653 テーブルのレコードがすべてキャッシュされている場合，複数条件のインデックス検索速度が大幅に低下しました。ACI0103507が修正されたことによる副作用のようです。

* ACI0103673 ビルドしたデスクトップ版アプリケーションが正常に終了しませんでした。スポンサーメッセージを表示した後にアプリケーションがクラッシュします。

* ACI0103683 リストボックスのセルにピクチャを表示した場合，画像の右端が罫線の上に描画されました。

* ACI0103689 共有オブジェクトである`Signal`オブジェクトを非共有オブジェクトのプロパティに代入することができました。そのようなそのようなオブジェクトを`OB Copy`の`ck shared`オプションでコピーしようとするとエラー`-10719`が返されました。`Signal`オブジェクトに対して`Use`を使用すれば問題ありません。
