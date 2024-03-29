---
layout: fix
title: "4D v19.5 修正リスト"
date: 2022-12-05 08:00:00
categories: 修正リスト
tags: "19.5"
build: 283893
version: "19.5" 
permalink: /293/:slug/
---

* ACI0103485 クライアント/サーバー版のみ。データファイルに保存されたオブジェクト型フィールドに未定義のオブジェクトを代入した場合，オーファンBLOBが発生しました。

* ACI0103459 macOS 13 Venturaのみ。マウントされたネットワークドライブのパスが認識されませんでした。また，`Get system info`もネットワークドライブのパスを返しませんでした。

* ACI0103503 プリンタードライバーを経由せずに直接Write ProドキュメントをPDF形式でエクスポートした場合，埋め込められたSVGピクチャが低クオリティに変換されました。

* ACI0103497 バイナリデータベースをプロジェクトに変換した場合，フォームエディターにピクチャオブジェクトのタイトルが自動スタイルシートで描画されませんでした。

* ACI0103496 バイナリデータベースをプロジェクトに変換した場合，フォント属性などテキスト特有のプロパティ（`stroke, fontTheme, textDecoration, fontWeight, fontStyle, fontFamily, fontSize`）がピクチャオブジェクトに付与されました。

* ACI0103437 `OPEN URL`にブラウザ名と`*`オプションの両方を渡した場合，`#`などエンコードするべきでない文字を含むURLを開くことができませんでした。

* ACI0103518 Windows版のみ。ビルドしたクライアントアプリがクラッシュすることがありました。

* ACI0103493 mac OS 13 Venturaのみ。アプリケーションが最前面ではないときにパレット型のウィンドウを作成した場合，アプリケーションを最前面に移動してもウィンドウが表示されませんでした。パレット型のウィンドウには*Controller form window*, *Palette form window*, *Toolbar form window* が含まれます。

* ACI0103457 mac OS 13 Venturaのみ。高さが`23`に満たないコンボボックスにフォーカスが移動されたときの表示が正しくありませんでした。

* ACI0103086 4D ViewスプレッドシートをView Proに変換した場合，複数行セルが単一行セルになりました。

* ACI0103498 フォームオブジェクトのデータソースをテキストからピクチャに変更した場合，フォント属性などテキスト特有のプロパティ（`stroke, fontTheme, textDecoration, fontWeight, fontStyle, fontFamily, fontSize`）がリセットされませんでした。

* ACI0103150 プロジェクトをv19にアップグレードした場合，データベース設定には，Webセッション管理が「旧式」と表示されましたが，実際の振る舞いおよび`WEB Server.keepSession`は`false`でした。データベース設定を再保存すれば問題が解消されます。

* ACI0102997 クライアント/サーバー版のみ。`Selection to JSON`の速度に問題がありました。また以前のバージョンと比較してCPUを多く消費しました。外部ストレージにSSDではなくHDDを使用している場合に違いが顕著です。
 
* ACI0103434 Windows版のみ。SDIモードですべてのウィンドウを閉じても，アプリケーションが自動的に終了しないことがありました。タスクバーからアイコンが消えますが，タスクマネージャーに*4D Volume Desktop* というタスクが残されました。

* ACI0103423 クライアント/サーバー版のみ。あるクライアントが`NEXT RECORD`でレコードをロードしようとした場合，別のクライアントまたはプロセスが`CREATE SET`で当該テーブルのセットを作成するのに通常の`100`倍の時間がかかりました。ビルド`280058`に問題があるようです。

* ACI0103422 4D for OCIプラグインのバージョン表示からマイナーバージョンが欠けていました。

* ACI0103463 Write Proドキュメントにメソッドコールのハイパーリンクを設定した場合，参照として渡されたフィールドにカレントレコードの値が渡されませんでした。
 
* ACI0102095 オブジェクト配列を含むスキーマに対して`JSON Validate`でJSONを検証した場合，２個目以降の要素が検証されませんでした。

* ACI0100550 `WP New`でオブジェクト型のデータソースが初期化されていないWrite Proエリアをコマンドで更新していると，アプリケーションがクラッシュしました。

**注記**: 問題は修正されましたが，フォームにWrite Proエリアを表示してからコマンドで更新した場合，取り消し/やり直しメニューの履歴が作成され，ルーラーなどの再計算が発生するため，速度に問題があります。`WP New`で作成したドキュメントをメモリ上で更新してからフォームに表示してほうが効率的です。

* ACI0100533 `Char(0)`が含まれるテキストを`WP SET TEXT`をWrite Proドキュメントに挿入した場合，`Char(0)`以降のテキストが更新できなくなりました。

* ACI0103461 `LISTBOX SET ARRAY`で`k row height array`以外の制御配列を設定するたびにメモリーリークが発生しました。

* ACI0103465 ブール型の変数を`Formula`で作成した`4D.Function`オブジェクトにパラメーターとしてキャプチャさせることができませんでした。

* ACI0103401 マウスまたはキーボード操作でメソッドエディターでUnicodeのサロゲートペアをハイライト選択した場合，文字の半分が選択され，*delete* または `backspace` を入力した場合，文字の半分が削除されました。

* ACI0103438 Mac版のみ。文字列定数に`U+02DC`（`˜`）が使用されている場合，Apple Siliconターゲットのコンパイルがエラーを返しました。

* ACI0103395 `WP SET ATTRIBUTES`の定数`wk page orientation`の後にセレクターとは無関係の定数`wk section index`が候補として表示されました。

* ACI0103345 `WP INSERT DOCUMENT` `WP New` `WP Import document` コピー/ペースト操作でテキストのレンジが崩れてしまうことがありました。

* ACI0103176 スプレッドシートを4D View Proにインポートした場合，`96,07887`のよう値が`96,07887000000001`に変換されました。

**注記**: SpreadJSの不具合です。ライブラリが修正されるまで，パッチが適用されることになりました。

* ACI0102974 Windows版のみ。スタンドアロン版で`_O_Gestalt`を実行した場合，アプリケーションがクラッシュしました。
 
* ACI0103412 リストボックスと列に別々の交互背景色が設定されていた場合，フォームをプロジェクトに変換すると列にリストボックスの交互背景色が継承されました。

* ACI0103245 エクスプローラーのプレビュー画面にサブフォームのスタイルシート設定が反映されませんでした。

* ACI0103355 複数の4D ServerでSQLサーバーを公開した場合，SQLパススルー（ODBCを介さない直接的なSQLアクセス）の処理速度が低下しました。

* ACI0103236 `IMAP Transporter.getMails()`で大量のメールを受信した場合，エラー`200`（ストリームの末端を超えた読み込み）が返されました。

* ACI0103427 ORDAで日付型のシーケンシャル検索を実行した場合，クラシックなクエリよりも時間がかかりました。

* ACI0103417 すでに接続が確立されているメールボックスを更新した後，`IMAPTransporter.checkconnection()`を実行した場合，*success* に`false`が返されました。

* ACI0103219 ストラクチャエディターの検索エリアでフィールドを検索することができませんでした。入力した文字列の`2`文字目以降が考慮されませんでした。

* ACI0103215 クライアント側でタイムアウトを設定してサーバーを再起動しようとした後，他のクライアントで`Current time(*)`のようなサーバー側処理を実行した場合，エラーが返されて接続が切断されました。サーバー側でタイムアウトを設定してサーバーを再起動した場合は問題ありません。

* ACI0103405 Windows版のみ。PDFを出力先にしてプリントジョブを開始した後，何もせずに終了した場合，空のファイルが作成されました。

* ACI0103227 REST APIの`$compute=$all`をコールした場合，テキスト/文字列型・日付型のプロパティ値が正しく返されませんでした。テキスト/文字列型は`min` `max`に`0`が返され，日付型は`count`以外が実数で返されました。

**注記**: 修正により，テキスト/文字列型・日付型のプロパティ`min` `max`はそれぞれのデータ値で返されるようになりました。`sum` `average`には，`0`が返されます。
