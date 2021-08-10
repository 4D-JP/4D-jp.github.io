---
layout: fix
title: "4D v19.0 修正リスト"
date: 2021-08-05 08:00:00
categories: 修正リスト
tags: "19.0"
build: 269214
version: 19.0
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0102226 Mac版のみ。Macで作成したプロジェクトをWindowsで開き，ツールボックスを開いた場合，一番上の一般ユーザー（DesignerまたはAdministratorではないユーザー）が消滅しました。`GET USER LIST`でも当該ユーザーが返されません。Windowsで作成したプロジェクト，バイナリモード，v18では問題ありません。

* ACI0102222 コンパイルモードでクラスのメンバー関数がエラーを返した場合，問題が発生した箇所の次行のコードがエラー画面にプレビュー表示されました。

* ACI0102220 プロジェクトモードのみ。フォームエディター上で範囲を指定したオブジェクトを選択した場合，透明スプリッターやドロップダウンリストのボーダーが表示されました。スプリッターや透明ボタン（レンダリングしないボタン）のボーダーは，オブジェクトのサイズよりもおおきな領域をカバーする四角形として描画されました。

* ACI0102212 SpreadJS `14.1`以前に作成されたスプレッドシートを`VP IMPORT FROM OBJECT`でインポートした場合，無効なスプレッドシートオブジェクトが返されました。

* ACI0102118 Mac版プロジェクトモードのみ。高さが`23`ポイントを超過するポップアップドロップダウンメニューをクリックした場合，フォーカスが間違った位置に描画されました。オブジェクトの高さが`23`ポイント以下であれば問題ありません。

* ACI0102198 ODBC Proプラグインの*en.lproj*, *manifest.json*, *PkgInfo* ファイルが欠落しているため，プラグインがロードされませんでした。

* ACI0102010 エンティティセレクション型のリストボックスのメタ情報式から返されるオブジェクトの`unselectable`プロパティを使用して行を選択不可にした場合，画面上は行が選択できませんが，カレント項目およびカレント位置プロパティが更新されました。

* ACI0101963 Apple Siliconターゲットのみ。Xcode 12.5でSiliconターゲットのコンパイルを実行した場合，clangが *$constants.cpp* の処理に`10`分以上を要することがありました。
 
* ACI0102178 プロジェクトモードのみ。プロパティリストで線オブジェクトのスタイルを設定した場合，選択したのとは違う点線スタイルが適用されました。

* ACI0102160 クライアント/サーバー版のみ。ネットワーク設定を変更してから「最近使用したサーバー」画面からサーバーに接続しようとした場合，選択したサーバーに対する接続は失敗しますが，クライアントキャッシュには`unuse.txt`ファイルが作成されるため，再接続を試みるたびに新しいローカルキャッシュフォルダーが作成されました。`unuse.txt`ファイルは，サーバーとの接続が確立されるまで作成されるべきではなく。接続エラーの発生と同時に削除されるべきです。そうでないと，再接続時にサーバー側のセッションが消えず，接続ライセンスが回収されません。

* ACI0102002 ビルド版のサーバーアプリケーションのメニューにデバッガを有効化するためのメニュー項目が表示されました。

* ACI0102181 Write Proドキュメントのテキストを上付き文字または上付き文字に設定した場合，行間スペースが変化しました。

**注記**: 修正により，4D WriteプラグインやMicrosoft Wordと同じ仕様になりましたが，修正前のWrite Proドキュメントは，段落スタイルや改ページ処理の位置が変わるかもしれません。

* ACI0102189 Windows版のみ。SVGピクチャが挿入されたWrite ProドキュメントをPDF形式でエクスポートした場合，`textArea`要素のフォントカラーがすべてブラックになりました。プリンタードライバーでPDF出力した場合は問題ありません。

* ACI0102171 クライアント/サーバー版のみ。ローカルクライアントでフォームエディターを使用した場合，データクラスがエンティティセレクション型リストボックスのデータソース候補として表示されませんでした。

* ACI0102170 クライアント/サーバー版のみ。`On Startup`データベースメソッドにコードが記述されている場合，テーブル間にリレーションが設定されているデータベースに起動時にクライアント側でエラーが返されました。

* ACI0102159 コンパイルされたコンポーネントは，`.4DZ`形式のホストアプリケーションの共有メソッドに`METHOD GET PATHS`でアクセスできませんでした。
 
* ACI0102016 プロジェクトモードのみ。プロジェクトメソッドのドキュメンテーションのハイパーリンクが動作しませんでした。
 
* ACI0102169 タイトルカラーが設定されたボタンをdisabled状態に設定した場合，タイトルがグレーアウトされませんでした。

* ACI0102182 フランス語版のみ。アプリケーションビルドの確認メッセージに間違いがありました。"si vous voulez voulez..."とワードが重複していました。

* ACI0102176 クライアントキャッシュフォルダー内の`uuid.txt`ファイルが破損しているクライアントがサーバーに接続した場合，サーバー側で実行中のストアドプロシージャーが消滅しました。旧式ネットワークレイヤーでは問題ありません。

* ACI0102125 プロジェクトモードのみ。フィールド入力の確定を`REJECT`で拒むことができませんでした。

* ACI0102062 `SET DATABASE PARAMETER`のセレクター`98`（スリープ中のクライアントに対するタイムアウト）が適用されませんでした。スリープ中のクライアントに対するタイムアウトを過ぎてもユーザーがドロップされず，接続ライセンスも回復しませんでした。
 
* ACI0102145 バイナリモードのみ。プロジェクトモードにデータベースを変換した場合，リストボックスのヘッダーや列のフォントカラーや整列が変わってしまうことがありました。「自動」に設定されているプロパティ値が省略され，リストボックス全体の値を継承するようになってしまうことが原因です。

* ACI0102127 バイナリデータベースをプロジェクトに変換した場合，ピクチャボタンの`pathname`プロパティがエクスポートされないことがありました。昔のベータバージョンで作成されたボタンで問題が発生するようです。

* ACI0102106 プロジェクトフォームの`0`ページで入力順を変更した場合，設定が反映されませんでした。

* ACI0102094 Mac版のみ。Apple Magic Mouseで入力エリアをクリックし，`GOTO OBJECT(*; "")`でフォーカスを消すと同時に`ALERT`などで新しいウィンドウを表示した場合，元のフォームに復帰したときにタブ順が次のオブジェクトにフォーカス表示が移動し，かつ，どこをクリックしても前のオブジェクトのコードが実行される状態に陥りました。

* ACI0101948 RESTリクエストでプロジェクトメソッドが実行された場合，管理画面でRESTセッションがドロップできなくなりました。

* ACI0102146 Mac版のみ。4D for iOSのフォームセクションでリストフォームのギャラリー表示を右クリックし，テンプレートをダウンロードしようとした場合，HTTPのエラー（ステータスコード`302`）が返されました。

* ACI0102060 MSCのデータ検証で暗号化の問題が検出され，同じキーでデータを再暗号化して問題を解消した後，もう一度データを再暗号化した場合，MSCに表示されたエラーメッセージが消えませんでした。

* ACI0100450 HTTPのボディが`0x000D`から始まる場合，Webサーバーがリクエストを正しく処理しませんでした。受信に時間を要するだけでなく，ヘッダーの`Content-Length`と`GET HTTP BODY`で受信したBLOBのサイズが一致しませんでした。
 
* ACI0102087 表組内のマージフィールドにフォーマット（例：`MERGEFIELD pt_FC \# $,#.00`）が設定されている`.docx`ドキュメントをWrite Proにインポートした場合，マージフィールド名（`«pt_FC»`）は正しく取り出されますが，`WP Get text`から返されるテキスト値に改行コードが追加されました（`«pt_FC»\r\r`）。

* ACI0102150 4D for iOSのカスタムログインフォームを設定した場合，アプリケーションのビルドがエラーを返しました。

* ACI0102122 サーバーとの接続が閉じられてしまった場合，`SMTP Transporter.send()`メソッドがエラーを返しました。トランスポーターのkeepAliveが有効にされている場合，前回の`send()`から間隔が空いたときには，まず，リクエストの前に`NOOP`コマンドを送信し，必要であれば，サーバーに再接続するべきです。
 