---
layout: fix
title: "4D v18.4 修正リスト"
date: 2021-02-09 08:00:00
categories: 修正リスト
tags: "18.4"
build: 261070
version: 18.4
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

• ACI0100904 数週間にわたってストアドプロシージャを実行した場合，作成したローカル配列の最後の要素に対するアクセスが範囲チェックエラー-20001になることがありました。

* ACI0101630 `PRINT LABEL`で行毎に出力されるラベルの数が正しくありませんでした。

* ACI0101570 `DELETE SELECTION`でレコードを削除した場合，オブジェクト型フィールドのインデックスに問題が発生し，データファイルが破損しました。クラスターインデックスが削除されたレコードを参照しているというエラーであり，MSCによる修復が必要です。

* ACI0101563 `VP Convert from 4D View`で4D Viewドキュメント（`.4PV`ファイル）を変換できないことがありました。

**注記**: SpreadJS 12の不具合により，「名前の重複」例外が発生した場合，再描画がブロックされ，エリアがレンダリングされなかったことが原因でした。

* ACI0101487 Windows版のコンパイルモードのみ。`DIALOG`コマンドでアプリケーション全体がフリーズすることがありました。

* ACI0101648 View Proスプレッドシートの``ROUND``関数にセルの参照ではなく，数式を渡した場合，正しくない値が返されることがありました。たとえば，`=ROUND((0,54+0,57)/2;2)`のようなセルには`0.55`ではなく`0.56`と表示されます。v18が使用しているSpreadJS 12の問題です。R5（SpreadJS 13）R5（SpreadJS 14）では問題ありません。

**注記**: SpreadJSをアップデートするのではなく，問題のコード部分にパッチがあてられました。

```js
// Code v12
function mt_round(number, numDigits) {
        return MathHelper._round(number, numDigits);
}
// Code v13
function mt_round(number, numDigits) {
    number = Common_1.Common._NumberHelper._fixNumber(number, 15 );
    return MathHelper._round(number, numDigits);
}
```

* ACI0101643 メソッドをコンパイルすると，「ローカル変数の合計サイズが32KBを超えています」というエラーが返されることがありました。ACI0101186が修正されたことによる副作用のようです。

* ACI0101534 `MSG_Extract`で添付ファイルを保存した場合，ファイル名のアクセント文字が無視されました。ACI0098362が修正されたことによる副作用のようです。

* ACI0101610 `$name:=Field name(variable.prop)`および`$name:=Field name(variable.prop->)`のようなコードがコンパイルエラー（パラメーター不足）になりました。

* ACI0101323 `WEB Get server info`のプロパティ`webInactiveProcessTimeout`および`webMaxConcurrentProcesses`には，デフォルト値が常に返されました。データベース設定または`WEB SET OPTION`で変更した値が返されるべきです。

* ACI0100986 Write Proドキュメントに挿入されたフォーミュラを`ST Get expressions`と`ST get content type`でループ処理した場合，アプリケーションが無反応になりました。

**注記**: 18r2以降，フォーミュラを処理するだけであれば，最適化された`WP Get formulas`を使用することができます。

* ACI0101581 CEF版Webエリアに空のページを表示した状態で`WA OPEN WEB INSPECTOR`を実行した場合，アプリケーションがクラッシュしました。

* ACI0101460 `IMAP_MsgLst`でアクセント付き文字（`é` `ê` `ë` `â`）が正しく返されませんでした。

* ACI0101578 View Proエリアのフォーミュラ`COLUMNLETTER`のパラメーターを省略した場合，カレント列の文字が返されるはずですが，無効なフォーミュラであるというエラーが返されました。

* ACI0101465 View Proエリアは`SET ALLOWED METHODS'`に対応しているはずですが，ワイルドカード文字（`@`）による一括指定ができませんでした。

* ACI0101600 ヌル終点エラー（ネットワーク切断）が突発的に発生しました。ネットワークリクエストログ（サーバー側）を解析すると，プロセスがアイドル接続タイムアウトから復帰するタイミングでネットワーク接続の例外が発生していることがわかります。

```
900562 2020-12-11 22:47:48 [APPL] INFO - 4D application, resume connection, task #-1
900563 2020-12-11 22:47:48 [APPL] ERROR - 4D client session, restore, failed to create connection, task #-1
900564 2020-12-11 22:47:48 [APPL] ERROR - 4D connection, failed to use, task #-1
900565 2020-12-11 22:47:48 [srvr] ERROR - [16] 4D connection, write exactly, failed to write, task #-1, socket -1
900566 2020-12-11 22:47:48 [APPL] ERROR - 4D request, send, critical net trigger, error -10002, task #-1
900567 2020-12-11 22:47:48 [APPL] ERROR - 4D controller task, critical net error signal, task #-2
```
**注記**: 接続リクエストは２ステップで構成されていますが，第１ステップが不成功に終わった場合，特殊な条件で第２ステップに進むことがあり，その場合が想定されてなかったことが原因でした。Microsoftのソケット実装は，この点で仕様に曖昧な点があることも関係しています。

> -Until the connection attempt completes on a nonblocking socket, all subsequent calls to connect on the same socket will fail with the error code `WSAEALREADY`, and `WSAEISCONN` when the connection completes successfully. Due to ambiguities in version 1.1 of the Windows Sockets specification, error codes returned from connect while a connection is already pending may vary among implementations. As a result, it is not recommended that applications use multiple calls to connect to detect connection completion. If they do, they must be prepared to handle `WSAEINVAL` and `WSAEWOULDBLOCK` error values the same way that they handle `WSAEALREADY`, to assure robust operation.
  
<i class="fa fa-external-link" aria-hidden="true"></i> https://docs.microsoft.com/en-us/windows/win32/api/winsock2/nf-winsock2-connect

* ACI0101579 フォーミュラのパラメーターに4D Viewエリアの参照変数が使用されているスプレッドシートをView Proに変換した場合，エリアの参照変数が消えました。

* ACI0101575 プロジェクトモードのみ。オブジェクトメソッドが定義されているフォームオブジェクトをコピー＆ペーストした後，そのオブジェクトをコピーして別のフォームにコピー＆ペーストした場合，コピーされたオブジェクトおよびコピーからコピーされたオブジェクトのメソッドに制御コードが追加されました。元のオブジェクトは問題ありません。フォームオブジェクトのコピー＆ペーストで問題が発生し，オブジェクトの複製では発生しません。

**注記**: コードのバイトオーダーマーク（BOM）が重ねてコピーされていたことが原因でした。

* ACI0101484 Webサービス（SOAP）でオブジェクト型を入力変数に使用した場合，サーバーがクラッシュしました。

**注記**: `SOAP DECLARATION`は`Is collection`や`Is object`をサポートしていません。修正により，エラーが返されるようになりました。

* ACI0101611 Windows版のみ。Citrixプラットフォームでタスクパーのウィンドウを閉じた場合，アプリケーションが正常に終了しませんでした。Citrixでタスクパーを右クリックしてウィンドウを閉じると`WM_SYSCOMMAND`の`SC_CLOSE`ではなく`WM_CLOSE`イベントが送信されますが，4DのMDIウィンドウがこのイベントを処理しないためにアプリケーションが終了せず，バックグランドで非常に高いCPU使用率のまま動き続けてしまうことが原因です。

* ACI0101608 プロジェクトモードのみ。MSCでデータファイルの暗号化を設定した後にMSCの検証を実行した場合，「テーブルの暗号化が設定されていないのにレコードが暗号化されている」という趣旨のエラーが返されました。

* ACI0101599 macOS Big Surのみ。4D Serverの管理画面にシステムバージョンが「macOS 10.16」と表示されました。

* ACI0101535 Write ProのHunspellスペルチェッカーをオランダ語（`nl_NL`）に設定した場合，「t.a.v.」というアクロニムがワードとして認識されませんでした。

**注記**: 追加の辞書は[freeoffice.com](https://www.freeoffice.com/fr/telecharger/dictionnaires)からダウンロードできます。

* ACI0101446 macOS Big Surのみ。`command`+`.`（キャンセル）のキーボードショートカットを設定することも入力することもできませんでした。

* ACI0101432 `Field name`にオブジェクト型のプロパティを渡した場合，コンパイルエラーになりました。

* ACI0101556 データの暗号化が有効にされたテーブルにレコードがまだ登録されていない場合，MSCの検証でエラー`5`（テーブルの暗号化が有効にされているのにデータが暗号化されていない）が返されました。

* ACI0101398 Windows版のみ。日本語入力の変換メニューとコード補完のポップアップウィンドウの両方が表示された場合，日本語入力が確定されて最初の変換候補が入力されました。

**注記**: 修正により，Visual Studioと同じような動作になりました。つまり，コード補完のポップアップウィンドウが表示された状態でも日本語入力が続けられるようになりましたが，画面上の低い位置でテキストを入力している時は，両方の候補ウィンドウがキャレットの上方に表示され，コード補完のポップアップウィンドウが日本語入力の変換メニューの裏に隠されることになります。

* ACI0101378 View Proエリアのリボンインターフェースで拡張子`.csv`以外の一般的なテキストファイルをインポートすることができませんでした。

* ACI0101486 `IMAP_SetPrefs`で指定したフォルダーパスに記号が含まれる場合，`IMAP_MsgLst`がエラー`-38`を返しました。

* ACI0101483 `POP3_SetPrefs`で指定したフォルダーパスに記号が含まれる場合，`POP3_MsgLst`がエラー`-38`を返しました。

* ACI0101457 カレントレコードが存在しない状態で`String`にテキスト型フィールドを渡した場合，ランタイムエラーが返されました。

* ACI0101549 macOS Big Surのみ。エクスプローラーのプレビュー画面にドロップダウンリストが正しく表示されませんでした。フォームエディターでは問題ありません。

* ACI0101468 フォーカス可で入力不可のオブジェクト（階層リスト・ルーラー・ステッパー・リストボックス）にフォーカスが移動した場合，日本語IMEが無効になりませんでした。ボタン・ラジオボタン・チェックボックスであれば問題ありません。そのようなオブジェクトにテキストをタイプ入力することはないので，日本語IMEは自動的に切られるべきです。

* ACI0101553 `LAUNCH EXTERNAL PROCESS`に４個未満のパラメーター（`cmd` `stdIn` `stdOut`）を渡し，エラーストリーム（`stdErr`）を省略した場合，CPU消費が異常に高くなり，ハングしたような状態になりました。

* ACI0101538 オブジェクトメソッドが設定されているフォームオブジェクトの名称をフォームエディターのプロパティリストで変更した場合，大文字を小文字に変えただけであれば，オブジェクト名の重複とみなされ，新しいオブジェクト名に連番が付けられました。

* ACI0101427 Write Proウィジェットのタブを１個に限定し，単独のパネルとして使用した場合，シンタックスエラーが返されました。ウィジェット全体を使用すれば問題ありません。

* ACI0101541 プロジェクトモードのみ。リストボックス列をブール型に設定した場合，表示形式はチェックボックスになりますが，プロパティリストの項目としてタイトルが表示されませんでした。ポップアップメニューで表示形式をチェックボックスに再設定すれば，タイトルが入力できるようになります。

* ACI0101501 ストラクチャエディターのインスペクターでフィールド名を入力した後，別のフィールドを選択した場合，入力した内容がキャンセルされました。確定するためには，`tab`キーを使用するか，インスペクター上のアクティブオブジェクトをクリックする必要があります。

* ACI0101441 Windows版のみ。リストフォームでは，入力状態ではないオブジェクトの`%password`フォントが無視されました。

* ACI0101366 macOS Big Surのみ。ダウンロードしたディスクイメージを開き，アプリケーションフォルダーに4Dをインストールした場合，「開発元を確認できないため，開けません」というエラーメッセージが表示されました。Volume Desktopと4D Serverは問題ありません。

* ACI0101437 macOS Big Surのみ。` Get system info`の`osVersion`には"macOS 11"ではなく`macOS 10.16"が返されました。

**注記**: マイナーバージョンおよびパッチバージョンは付加されず，単純に"macOS 11"が返されます。

* ACI0101521 Write Proドキュメントのインデント（`wk text indent`）が負の値に設定されている場合，MIMEフォーマットでHTMLエクスポートすると，行の先頭部分が切り捨てられました。webフォーマットでHTMLエクスポートすれば問題ありません。HTMLエクスポートでは，逆インデントが無視されるべきです。

* ACI0100969 4D for iOSのカスタムデータフォーマッターがＮ対１リレーションフィールドに適用されませんでした。

* ACI0101447 コレクションメソッドのコールバックがバリアント型でパラメーターを宣言している場合，コンパイルモードでは`2`巡目以降のパラメーターが未定義になりました。

* ACI0101374 View Proスプレッドシートのセルに「2020年10月26日」を入力すると「2020年10月2**5**日」に変換されました。

* ACI0101323 `WEB Get server info`のプロパティ`webInactiveProcessTimeout`および`webMaxConcurrentProcesses`には，デフォルト値が常に返されました。データベース設定または`WEB SET OPTION`で変更した値が返されるべきです。

* ACI0099000 `4DLOOP`ブロックの中に`4DIF` `4DELSE` `4DELSEIF` `4DENDIF`ブロックが`3`回記述されている場合，２巡目のループで`PROCESS 4D TAGS`がエラー（`4DENDIF`がありません）を返しました。`3`回の`4DIF` `4DELSE` `4DELSEIF` `4DENDIF`ブロック全体を`4DIF True` `4DELSEIF`で囲えば問題ありません。

* ACI0101013 Mac版のみ。View ProエリアのツールバーからPDF形式でエクスポート使用とした場合，テンポラリフォルダーがデフォルトの書き出しフォルダーとして表示されました。
