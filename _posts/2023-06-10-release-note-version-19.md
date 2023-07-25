---
layout: fix
title: "4D v19.6 修正リスト"
date: 2023-07-21 08:00:00
categories: 修正リスト
tags: v19
build: 287481
version: "19.6"
permalink: /2023/161/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0102977 定数を括弧で括らずに`return`キーワードで返そうとした場合，すんタックスエラーになりました。

**注記**: 修正に伴い，定数の`Return key`が`ReturnKey`に変更されました。

* ACI0103613 Mac版のみ。[Devart ODBC Driver for Sybase v.3.3.1](https://www.devart.com/odbc/ase/download.htm) を使用して`SQL LOGIN`を実行した場合，エラー`9921`が返されました。

**注記**: [Microsoftの仕様](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlconnect-function?view=sql-server-ver16)に従い，4Dは`SQLConnectW`と`SQL_NTS`を使用しています。Apple Silicon版のDevart ODBC Driverはパスワードの処理で[`SQL_NTS(-3)`](https://github.com/microsoft/ODBC-Specification/blob/master/Windows/inc/sql.h)モードを正しく実装しておらず，*null-terminated string* がきちんと受け取れていません。Devart ODBC Driverのバグですが，文字数を渡すように4D側で回避することになりました。

* ACI0104080 Windows版のみ。VS Code Extensionの[4D-Analyzer](https://marketplace.visualstudio.com/items?itemName=4D.4d-analyzer)で4Dまたは4D ServerをLSPにすることができませんでした。

* ACI0104031 クラスの`property`宣言でコンポーネントのクラスをデータ型として参照した場合，シンタックスチェックでオブジェクトは未定義のクラスであるという警告が返され，プロパティ入力のタイプアヘッドでもクラスのメンバー関数やプロパティが候補として列挙されませんでした。

* ACI0104030 `#DECLARE`構文または`C_POINTER`でポインター型のパラメーターを宣言し，渡されたポインター型のパラメーター自体に別のポインターを代入した場合，呼び出し元のポインターも更新されました。パラメーターはたとえポインター型であってもローカル変数と同じように振る舞うべきです。

* ACI0104029 クラスのプロパティを *Integer* 型で宣言し，そのプロパティを`-This.prop`のように符号を反転して参照した場合，コンパイラーがエラーを返しました。

* ACI0103188 データベース設定と *settings* のそれぞれでHTTPとHTTPSの両方を無効化した場合，[`WebServer.start()`](https://developer.4d.com/docs/ja/API/WebServerClass/#start)がエラーを返しませんでした。サーバーを開始できなかった場合は`errors[]`が返されるべきです。

* ACI0103994 Mac版のみ。[iODBC Framework](https://www.iodbc.org/dataspace/doc/iodbc/wiki/iodbcWiki/WelcomeVisitors)がインストールされていない環境で`SQL LOGIN`を実行した場合，アプリケーションがクラッシュしました。

* ACI0104038 **VS Code** のLSPとして使用した場合，**tool4d** のCPU占有率がほぼ`100`%に達しました。

* ACI0103979 Apple Siliconターゲット向けにコンパイルされたMac版の4D ServerプロジェクトにWindows版の4D Remoteで接続した場合，クライアントがクラッシュしました。*On Startup* メソッドが存在しなければ問題ありません。

**注記**: Apple Siliconターゲット限定（Intelターゲット無し）のプロジェクトを検出する仕組みがありませんでした。修正により，内部的なマーカーおよび新しいエラーメッセージが追加されましたが，プロジェクトを再コンパイルする必要があります。

* ACI0104076 4D Write Pro Interfaceコンポーネントを使用し，Write Proドキュメントにフォーミュラを挿入した場合，バイナリ形式でフォーミュラが挿入されました。そのようなドキュメントが保存されたフィールドを「レコードの強制更新」モードで圧縮した場合，フォーミュラが失われました。

**注記**: 通常，`WP INSERT FORMULA`で挿入したフォーミュラは文字列として保存されます。

```html
<span style="-d4-ref:'Current date:C33'"> </span>
```

しかし，4D Write Pro Interfaceコンポーネントで挿入したフォーミュラは特殊な形式で保存されます。

```html
<span style="-d4-ref-data:'data:application/octet-stream;base64,Bf3/YW1mNF4AAAAAAAAA6////zQARAAgAFcAcgBpAHQAZQBQAHIAbwAgAEkAbgB0AGUAcgBmAGEAYwBlACAAAAAAAAQAAAAAAEVWU1JPSQ0AAQAhAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=='"> </span>
```

MSCは4D Write Pro Interfaceコンポーネントをロードしていないため，このようなフィールドを「レコードの強制更新」モードで圧縮した場合，フォーミュラが評価できずに空の文字列となりました。修正により，MSC圧縮のようにデータベースが実行されていない場面では，レコードに保存されたWrite Proドキュメントを開こうとするのではなく，データストリームをそのままコピーするようになりました。

* ACI0104067 プラグインSDKのエントリーポイント`PA_ExecuteObjectMethod`を使用し，パラメーターを渡してコンパイルモードでエンティティセレクションのメンバー関数を実行しようとした場合，アプリケーションがクラッシュしました。

* ACI0104037 プロジェクトモードのみ。配列型リストボックスの未定義列に`SELECTION TO ARRAY`で文字列フィールドをコピーした場合，データソースが`ARRAY TEXT`ではなく，`_o_ARRAY STRING`になりました。

* ACI0103994 Mac版のみ。[iODBC Framework](https://www.iodbc.org/dataspace/doc/iodbc/wiki/iodbcWiki/WelcomeVisitors)がインストールされていない環境で`SQL LOGIN`を実行した場合，アプリケーションがクラッシュしました。

* ACI0103613 Mac版のみ。[Devart ODBC Driver for Sybase v.3.3.1](https://www.devart.com/odbc/ase/download.htm) を使用して`SQL LOGIN`を実行した場合，エラー`9921`が返されました。

**注記**: [Microsoftの仕様](https://learn.microsoft.com/en-us/sql/odbc/reference/syntax/sqlconnect-function?view=sql-server-ver16)に従い，4Dは`SQLConnectW`と`SQL_NTS`を使用しています。Apple Silicon版のDevart ODBC Driverはパスワードの処理で[`SQL_NTS(-3)`](https://github.com/microsoft/ODBC-Specification/blob/master/Windows/inc/sql.h)モードを正しく実装しておらず，*null-terminated string* がきちんと受け取れていません。Devart ODBC Driverのバグですが，文字数を渡すように4D側で回避することになりました。

* ACI0104026 エクスプローラーのごみ箱にテーブルが残っている状態でごみ箱を空にした場合，アプリケーションがクラッシュしました。

* ACI0103950 プロジェクトモードのみ。既存のフォームと名前が重複するフォームを作成しようとした場合，ランタイムエラーが返されました。

* ACI0104061 Windows版のみ。Write ProドキュメントをPDF形式でエクスポートした場合，*Artdeco MN* フォントの文字が重ねて表示されました。Microsoft Print to PDFを使用すれば問題ありません。

**注記**: Write Proが内部的に使用している[PDF-Writer](https://github.com/galkahana/PDF-Writer)のローレベル処理（カーニング）に問題がありました。回避策として，*Artdeco MN* フォントファミリーは，DirectWriteのAPIでフォントのオフセット位置を計算するようになりました。

* ACI0103975 Mac版のみ。キーボードを長押しして拡張文字の候補を表示し，数字キーで選択した場合，アクセント付きの文字とそうでない文字の両方が入力されました。矢印キーやクリック操作で拡張文字を入力すれば問題ありません。

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
 

