---
layout: fix
title: "4D v19r5 修正リスト"
date: 2022-07-06 08:00:00
categories: 修正リスト
tags: 19r5
build: 280918
version: 19r5
permalink: /111/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0102868 View Proスプレッドシートの通貨フォーマットリストにユーロ記号`€`が含まれていませんでした。

* ACI0102587 Mac版のみ。Apple Siliconマシンでは，システムスリープを解除した後，アプリケーションが無反応になることがありました。

* ACI0103062 4D Go MobileでiOSアプリをデバイスにインストールすることができませんでした。エラーは表示されませんが，USB接続されたデバイスを確認すると，アプリがインストールされていません。

* ACI0103072 4D Go Mobileでプライマリーキーが公開フィールドに含まれている場合，Android版アプリをビルドすることができませんでした。

* ACI0103003 `Compile project`から返される変数タイプの定数が間違っていました。ポインター型`40`・ピクチャ型`10`・テキスト型`33`のタイプがランゲージの定数と違います。ポインター型`23`・ピクチャ型`3`・テキスト型`2`が返されるべきです。

**注記**: テキスト型とピクチャ型はv11で内部的なフォーマットが変更されました。ポインター型はv16以降で新しいフォーマットが使用されています。コマンドはコンパイラーが内部的に使用している定数をそのまま返していました。修正により，`Is text` `Is pointer` `Is picture`と同じ値が返されるようになりました。

* ACI0103044 4D Go Mobileでパーセンテージ形式のフォーマットが設定された整数フィールドに対して編集アクションを実行した場合，アプリがクラッシュしました。

* ACI0103005 MacでコンパイルしたアプリケーションをWindowsでインポートすればでApple Silicon対応のクライアント/サーバー版アプリケーションがビルドできるはずですが，ビルドプロジェクトの`PackProject`キーを使用して.4DZファイルの代わりに*Compiled Database*フォルダーをビルドした場合，「正しい.4DZフォルダーではない」というエラーが表示されました。.4DZの代わりに*Compiled Database*フォルダーを組み込んでも問題がないはずです。

* ACI0102922 Write Proエリアのフォーミュラエディターにプロジェクトメソッドを入力した場合，ドキュメントに数式の評価値が表示されませんでした。

**注記**: ベータ版では`ST INSERT EXPRESSION`の代わりに`WP Insert formula`が使用されていました。コマンドの改良と検証が間に合わないため，リリース版では`ST INSERT EXPRESSION`が使用されることになりました。

* ACI0100583 HTTPサーバーの停止と開始を繰り返した場合，TLSの証明書チェーンに同一の証明書が何度も追加されました。

* ACI0103046 Mac版のみ。タブコントロールの上下どこをクリックしてもイベントが発生しました。

* ACI0102768 Mac版のみ。macOS 10.14.6 Mojaveで起動した場合，アプリケーションがクラッシュしました。

* ACI0103023 `#DECLARE`構文やクラスのメンバー関数の宣言で重複するパラメーターや戻り値を使用した場合，シンタックスチェックで警告が表示されるものの，コンパイルには成功しました。コンパイルエラーが返されるべきです。

* ACI0102830 クライアント/サーバー版のみ。クライアント側でサーバー管理画面を表示してから閉じた場合，終了時にクライアントがフリーズしました。

* ACI0103029 診断ログにデバッグレベルで出力されるべき情報が警告レベルで出力されました。
 
* ACI0103016 Windows版のみ。Windows 2012 R2では，ドロップダウンメニューの隣にある矢印がオブジェクトよりも低い位置に表示されました。

* ACI0102867 Windows版のみ。モニターの解像度が`100%`に設定された状態でフォームを表示し，アプリケーションを終了した後，モニターの解像度を`125%`に変更して再表示した場合，スタティックピクチャが正しい位置に表示されませんでした。モニターの解像度が`100%` `200%` `300%`など`100`の倍数であれば問題ありません。また4Dの高DPI対応を無効にすれば問題ありません。

* ACI0103004 *On Load*イベントで`FORM SET INPUT`を実行した場合，リストボックスをダブルクリックしたときに使用される入力フォームが変更されないことがありました。

* ACI0102934 バイナリモードのみ。クライアント側でツールボックスのリソース画面にファイルをドラッグ＆ドロップした場合，アプリケーションがハングしました。

* ACI0103008 Windows版のみ。２台のモニターをコンピューターに接続し，メインモニターの解像度を`125%`に設定した場合，`SCREEN COORDINATES`から返される値が正しくありませんでした。解像度が変更されていないほうのモニターは正しい値が返されます。

* ACI0102942 レコードを削除した場合，削除したレコードが*__DeleteRecords*テーブルに追加されますが，エンティティセレクションを削除した場合，削除したエンティティセレクションが*__DeleteRecords*テーブルに追加されませんでした。

* ACI0103011 ユーザー名に空の文字列を指定した場合，SMTPのOAuth 2.0トークン認証は失敗しますが， トランスポーターの`checkConnection()`が`True`を返しました。

* ACI0102968 プラグインSDKのエントリーポイント`EX_GET_FIELD`でBLOBフィールドの値を取得できませんでした。

* ACI0102883 4D Go Mobileプロジェクトのアクションを編集しようとした場合，アプリケーションがクラッシュすることがありました。CoreDataで予約されているフィールド名（*description*）で問題が発生するようです。

* ACI0102858 Mac版プロジェクトモードのみ。リストフォームの余剰行にチェックボックスやラジオボタンが表示されました。レコードのない行にフィールドが表示されるべきではありません。
 
* ACI0102997 クライアント/サーバー版のみ。`Selection to JSON`の速度に問題がありました。また以前のバージョンと比較してCPUを多く消費しました。外部ストレージにSSDではなくHDDを使用している場合に違いが顕著です。

* ACI0102861 データファイルとインデックスファイルを圧縮した後，新規レコードを保存しようとしたタイミングでアプリケーションがクラッシュする場合がありました。プリエンプティブスレッド（Webプロセスなど）からスレッドアンセーフな（例：インタープロセス変数にアクセスしている）メソッドをコンパイルモードで呼び出そうとした場合，問題が発生するようです。

* ACI0102988 フォームに配置されたテキスト入力オブジェクトのスクロール位置がテキストサイズに応じて冒頭・中間・末尾に設定されました。デフォルトのスクロール位置はテキストサイズとは無関係のはずです。

* ACI0102984 4D Go Mobileのデフォルトフィールド名が正しくキャメルケースに変換されませんでした。

* ACI0102948 診断ログの記録レベルがデフォルトで「デバッグ」モードに設定され，瑣末な情報が大量に記録されました。デフォルトは「情報」レベルに設定されるべきです。

* ACI0102996 `SMTP New Transporter`で送信したメールが途中で途切れることがありました。

**注記**: メールにSMTPプロトコルで本文を終わりを意味する`\r\n.\r\n`という文字列が含まれている場合に問題が発生しました。

* ACI0102972 プロジェクトモードのみ。バイナリモードからデータベースを変換した場合，*Designer*アクセスグループからユーザーが外されました。*Administrator*グループの設定だけが正しくエクスポートされます。
 
* ACI0102923 SQLで`8001`バイト以上のデータをSybaseの画像フィールドに送信した場合，`255`バイトでデータが途切れました。ODBC Proプラグインでは問題ありません。

**注記**: 修正により，[`SQL SET OPTION:`](https://doc.4d.com/4Dv19/4D/19.1/SQL-SET-OPTION.301-5653382.ja.html)に新しいオプション*SQL data chunk size*が追加されました。デフォルト値は`8000`です。Sybase ODBC driverは，断片化された*PutData*命令に対応していないため，バイナリデータを一気に送信する必要があります。Oracle・MySQL・Microsoft SQL Serverなどのデータベース管理システムでは，特に設定を変更する必要はないはずです。

* ACI0102987 4D Go Mobileのフォームにパラメーターを設定せずにアクションを追加した後，有効なフィールド名に設定を変更した場合，*defaultField*属性が設定に追加されませんでした。

* ACI0102985  4D Go Mobileのフォームにフィールドのアクションを追加した後，無効なフィールド名に設定を変更した場合，*defaultField*属性が設定から削除されませんでした。

* ACI0102973 `Drag Window`を使用した場合，ウィンドウが即座に画面の外に移動しました。

* ACI0102970 オブジェクト型をポップアップメニューのデータソースに使用することができませんでした。

* ACI0102959 デバッガーが接続されていないサーバーで直接RESTリクエストを処理した場合，予備プロセスおよび10分後に消滅するRESTプロセスが作成されました。

**注記**: [`Open datastore`](https://developer.4d.com/docs/ja/API/DataStoreClass.html)を使用せずにREST APIをダイレクトに呼び出した場合，セッション識別子（クッキー）は送信されません。修正により，そのような場合は新規RESTプロセスを作成するのではなく，予備プロセスが利用されるようになりました。

* ACI0102994 環境設定ダイアログで「Project ソースファイルにトークンを含める」チェックボックスを有効にしても，設定が保存されませんでした。

* ACI0102814 Mac版のみ。ビルドプロジェクトファイルの`CommonCopyright`を設定して`BUILD APPLICATION`を実行した場合，アプリケーションがクラッシュしました。

* ACI0102938 Windows版プロジェクトモードのみ。グループボックスの描画にDirectWriteが使用されませんでした。スタティックテキストとレンダリングが違います。

* ACI0102940 `MAIL New attachment`で作成したメールオブジェクトの添付ファイルをパラメーターとして別プロセスに渡すことができませんでした。
 
* ACI0102953 コンポーネントの名前空間でエクスポートされたクラスを`#DECLARE`でパラメーターの型に指定した場合，コード補完の入力候補にオブジェクトのプロトタイプに応じたプロパティや関数が表示されませんでした。`var`キーワードで宣言した場合は問題ありません。

* ACI0102943 Write Proドキュメントで表の最終行を削除した場合，最終行と一緒に直後のセクションブレークも削除されました。

* ACI0102941 View ProエリアでエクスポートしたCSVファイルをView Proエリアにインポートすることができませんでした。
 
* ACI0102906 診断ログを有効にした場合，デバッグレベルの軽微なネットワークエラーが大量に記録されました。

* ACI0102955 プロジェクトモードのみ。個別のドロップダウンメニュー項目にフォントを設定することができませんでした。

**注記**: Mac版だけが修正されました。Windows版は，技術的な制約により，メニュー項目にフォントを設定することがサポートされていません。

* ACI0102825 Webサーバーの「セッションなし」オプションが外部ファイルのユーザー設定に保存されませんでした。v19にアップグレードしたプロジェクトで問題が再現します。v19で作成したプロジェクトでは問題ありません。一旦「旧式セッション管理」などの新しいオプションを選択し，設定を保存した後であれば，問題ありません。

* ACI0102936 Windows版のみ。SDIモードで`MODIFY SELECTION`を実行し，入力フォームを閉じてリストフォームに戻った場合，フォームが完全に更新されず，入力フォームの一部が画面上に残されました。ウィンドウをリサイズしたり，画面をクリックしたりすれば，リストフォームが完全に描画されます。ACI0102751およびACI0102766が修正されたことによる副作用のようです。

* ACI0102949 `LISTBOX SET PROPERTY`でリストボックスのプロパティを書き換えるたびにメモリーリークが発生しました。
 
* ACI0102919 バックアップ実行中にクライアント接続が切断されることがありました。クライアントからバックアップを開始し，バックアップの完了に１時間以上を要する場合に問題が発生するようです。

* ACI0102913 4D Go Mobileの指数表記または文字列表記のフォーマッターが設定されたフィールドに値を入力して追加アクションを実行した場合，サーバーに値が送信されませんでした。

* ACI0102857 View Proスプレッドシートの`printInfo.paperSize.kind`が`A4`のように文字列ではなく`9`のように数値で返されました。

* ACI0102489 Mac版のみ。タブコントロールのアイコンが正しく表示されませんでした。右側のタブほど左に位置がずれて表示されます。

* ACI0102874 View Proスプレットシートのコンテキストメニュー「セルの表示設定…」のダイアログに表示されないフォントがありました。リボンメニューと同じフォントが表示されるべきです。

* ACI0102434 コンパイル実行中にアプリケーションを終了した場合，クラッシュすることがありました。

* ACI0102193 View Proスプレッドシートの`printInfo.paperSize.kind`を`a4`のように小文字で指定する必要がありました。

* ACI0101068 4D View Proスプレッドシートのセルを``delete``キーで直接クリアした場合，``designer.actions.isFileModified``が``true``になりませんでした。セルを編集状態にして値を削除すれば問題ありません。
 
* ACI0101694 4D Write Pro Interfaceコンポーネントのメソッド`WP ShowTabPages`を使用した場合，タブは正しいものが表示されますが，ページの割り当てが正しくありませんでした。つまり，タブをクリックしたときに表示されるページが間違っていました。

* ACI0102916 4D Write Pro Interfaceウィジェットで「画像」以外のタブを表示し，*command*キーを押しながらドキュメントに埋め込まれた画像を選択した場合，ランタイムエラーが返されました。

* ACI0102896 Windows版のみ。クライアント/サーバー接続に新ネットワークレイヤーを使用しており，TLSが有効にされている場合，4D Remoteから別の4D Remoteに対してSOAPリクエストを送信するとサーバーとの接続が切断されました。

* ACI0102884 `PHP Execute`でTCPソケットコマンドを実行し，ローカルアプリケーションのWebサーバーにアクセスした場合，アプリケーションがフリーズしました。
 
* ACI0102897 バイナリモードのみ。コンパイル済みコードが存在するメソッドをクライアント側で変更して保存した場合，サーバーとの同期でメモリーリークが発生しました。

* ACI0102852 プロジェクトモードのみ。リストボックスの行フォントカラー配列にプロジェクトメソッドが設定されている場合，シンタックスチェックまたはコンパイルを実行するとアプリケーションがクラッシュしました。

* ACI0102791 データベース設定のタブをクライアント/サーバーからバックアップに切り替えた場合，OKボタンが有効になりました。設定を変更したわけではないので，保存するものは何もないはずです。
 
* ACI0102825 Webサーバーの「セッションなし」オプションが外部ファイルのユーザー設定に保存されませんでした。v19にアップグレードしたプロジェクトで問題が再現します。v19で作成したプロジェクトでは問題ありません。一旦「旧式セッション管理」などの新しいオプションを選択し，設定を保存した後であれば，問題ありません。

* ACI0102887 プロジェクトモードのみ。CSSでオブジェクトのサイズを設定した場合，`OBJECT GET BEST SIZE`が正しい値を返さないことがありました。

* ACI0102864 入力フィルターが設定されている入力不可の日付型フィールドを表示中にコマンドで入力可に切り替えた場合，正しい日付が表示されませんでした。ナイトリービルドだけの問題です。
 
* ACI0102911 4D Go Mobileの「データ」セクションで「ビルド毎のデータを再生成しない」チェックボックスを有効にせずにAndroidアプリケーションのビルドを開始した場合，進捗ダイアログが閉じられ，バックグラウンドでビルドが実行されました。

* ACI0102907 プロジェクトモードのみ。ピクチャ型の変数が設定されたリストボックスのヘッダーに対して`OBJECT GET FORMAT`を使用した場合，空の文字列が返されました。

**注記**: リストボックスのヘッダーにピクチャ型を変数を使用する場合，プロジェクトモードでは，`var:myVariable`のように接頭辞が追加されます。

* ACI0102903 リストボックスのCSSクラスに`@media`を使用した場合，デザインモードではダーク/ライトモードに応じたプロパティが適用されますが，アプリケーションモードでは無視されました。

* ACI0102783 ストラクチャ設定でカスタマイズしたキーボードショートカットがユーザー設定に継承されませんでした。

* ACI0102846 Windows版のみ。高解像度モード（スケーリング）が有効にされている場合，v19で終了したプロジェクトを19r5で開くとウィンドウの位置とサイズが正しく復元されませんでした。

* ACI0102826 クエリ条件を`.4DF`ファイルに保存した場合，日付型の値が`!00-00-00!`になりました。
 
* ACI0102732 メソッドエディターのコンテキストメニューに「名称変更」が表示されないことがありました。マウスを右から左に操作してトークン文字列を選択した場合に問題があります。左から右に選択すれば問題ありません。

* ACI0102685 View Proエリアのフィルターツールで列のフィルターを適用した後，編集ツールのフィル＞下方向へコピーを実行した場合，フィルターで除外されたセルにもコピーが適用されました。

**注記**: SpreadJS `15.0.4`で修正されました。

* ACI0102677 `HTTPRequest`クラスの`terminate()`関数を実行した場合，`onTerminate()`コールバック関数が呼ばれますが，コールバック関数の完了を待たずに`terminate()`関数を実行したメソッドが継続されました。

* ACI0102666 極端な文字列を`Match regex`で解析しようとした場合，アプリケーションがフリーズすることがありました。

* ACI0102656 コンポーネントのデータストアを拡張したクラスがホスト側のメソッドエディターにコード補完の候補として表示されました。

**注記**: 正規表現の処理で無限ループに陥ったり，致命的なバックトレースが発生した場合，最終的にタイムアウトエラー（`30`秒）が返されるようになりました。

* ACI0102655 コンポーネントの非公開のクラスから派生した公開クラスをメソッドエディターに入力した場合，ウィンドウ下部のステータスパーにクラスのプロトタイプ情報が表示されませんでした。

* ACI0102658 `SQL EXPORT DATABASE`でエクスポートしたファイルにバイトオーダーマークが追加されました。

* ACI0102609 `WEB SERVICE SET OPTION`の`Web Service HTTP timeout`でWebサービスのタイムアウト設定を設定した場合，時間の精度があまり正確ではありませんでした。設定したタイムアウトよりも`1`秒以上遅れて処理が返されました。
 
* ACI0102628 クライアント/サーバー版のみ。ユーザー認証ダイアログの「パスワードを保存」チェックボックスを有効にしても，次回のログインでパスワードの入力を求められました。

* ACI0102607 View Proエリアのステータスパーが一部ローカライズされていませんでした。末尾の項目（ズーム）が表示されるべき位置に"undefined"と表示されました。

* ACI0102498 クライアント/サーバー版のみ。ORDAのコンテキストにない属性を参照しようとした場合，未定義が返されることがありました。必要に応じて属性をフェッチし，コンテキストに追加されるべきです。

* ACI0100766 バイナリモードのみ。クライアント側で`Get 4D file`を使用し，ビルドアプリケーション設定ファイルのパスを参照しようとした場合，アプリケーションがクラッシュしました。

* ACI0098106 データベースパラメーターの`Dates inside objects`が`String type without time zone`に設定されていても，`COLLECTION TO ARRAY`でISO 8601フォーマットの日付文字列が日付型に変換されませんでした。`OB GET ARRAY`では問題ありません。
 
* ACI0102773 対象ファイルが存在しない場合，`Get 4D file`はデフォルトのファイルパスを返しました。空の文字列が返されるべきです。

**注記**: 修正により，ビルドアプリケーション設定ファイルが存在しない場合には空の文字列が返されるようになりました。過去バージョンとの互換性を維持するため，他の項目はこれまでどおりに返されます。

* ACI0102756 Webサーバーのプリエンプティブモードを有効にした場合，*On Web Connection*データベースメソッドなど，スレッドセーフなメソッドで使用されている*4D Mobile App Server*コンポーネントの`Mobile App Active Session`コマンドがコンパイルエラーを返しました。

**注記**: メソッドプロパティの「実行モード」が「特に設定しない」にセットされている場合，メソッドがスレッドセーフなメソッドで使用されており，特に問題がなければ，スレッドセーフになります。ただし，コンポーネントとホスト間プロジェクト間で共有されたメソッドは，ホスト側の呼び出しメソッドがどちらのモードがわからないため，強制的に「プリエンプティプロセスでは実行不可」となります。コンポーネントメソッドをスレッドセーフにするためには，公開メソッドのプロパティを「プリエンプティプロセスで実行可能」にセットしなければなりません。

* ACI0102846 Windows版のみ。高解像度ディスプレイで19r5のMIDIウィンドウのサイズと位置を変更した後，19r4または19.xでプロジェクトを開いた場合，ウィンドウの位置とサイズが正しく再現されませんでした。

* ACI0102823 Mac版のみ。4D Go Mobileの「ストラクチャ」セクションにＮ対１リレーション属性のフィールド名がダークモードでは表示されませんでした。

* ACI0102790 共有オブジェクトではないオブジェクトに対して`Use`を使用した場合，エラーが返されました。

**注記**: 従来の動作は不具合ではありません。19r5で仕様が変更されました。リリースノートをご覧ください。

* ACI0102859 Mac版のみ。インストーラーを展開したときにマウントされるディスクイメージにアプリケーションフォルダーのエイリアスが表示されませんでした。

* ACI0102842 `VP SET CELL STYLE`でセルの`backColor`を設定した場合，指定したレンジだけでなく，周囲のレンジにも背景色が適用されることがありました。

* ACI0102755 クライアント/サーバー版のみ。`entitySelection.toCollection()`を実行した場合，処理に時間がかかりました。

* ACI0102734 サーバー側でメソッドを実行した後，`LOCKED BY`および`Get locked records info`がサーパー側のユーザー名とワークステーション名を返すようになりました。

* ACI0102668 `SQL LOGIN`を実行するとアプリケーションがフリーズすることがありました。

* ACI0102804 新ネットワークレイヤーでクライアント/サーバー接続のTLSモードを有効にし，ローカル接続でクライアントを接続した場合，しばらくすると接続が切断されました。リモート接続であれば問題ありません。

* ACI0102121 入力フォームにView Proエリアを表示し，自動アクションのナビゲーションを使用して別レコードに移動した場合，View Proエリアのデータソースオブジェクトが空になりました。

* ACI0101857 `LAUNCH EXTERNAL PROCESS`で実行したCLIプログラムの出力ストリームに無効な文字列が含まれる場合，空の文字列が返されました。

**注記**: 修正により，UTF-8からUTF-16に変換できない無効な文字は`?`として出力されるようになりました。

* ACI0101791 コンパイルされていないプロジェクトの*On Startup*データベースメソッドで`BUILD APPLICATION`を使用した場合，コンパイラーのエラーログファイルが出力されませんでした。*On Startup*のタイミングでは，デザインモードがセットアップされていないためです。

* ACI0101229 クライアント側で`SET DATABASE PARAMETER`を使用してクライアント側WebサーバーのHTTP"ポート番号（`Client HTTPS port ID`）を変更した場合，設定したポート番号ではなく，スタンドアロン版のポート番号が使用されました。

* ACI0100764 バックアップ設定「指定時間経過後に再試行：時間・分・秒」のデフォルト値がMacでは`0000-00-00T00:00:00.561`，Windowsでは`0000-00-00T00:00:00.000`となっています。v16では`60`秒でした。

* ACI0102290 空のコレクションに対して`IN`比較演算子を使用して`collection.query()`を実行した場合，アプリケーションがクラッシュしました。

* ACI0102225 ビルドしたサーバーアプリケーションにコマンドラインオプションの`--cache-folder-name`を渡してサーバーのキャッシュフォルダーをカスタマイズすることができませんでした。

* ACI0102197 クライアント/サーバー版のみ。ストアドプロシージャを起動したクライアントのネットワーク接続が強制的に切断された場合，ユーザー数とライセンス数の計算が合わなくなりました。クライアントがクラッシュしたり，ネットワーク接続が切断された場合には，クライアント接続ライセンスが解放されるべきです。

* ACI0102194 `VP SET PRINT INFO`で用紙サイズを文字列で指定した場合，`VP Get print info`から返されるオブジェクトの`paperSize.kind`プロパティが正しくありませんでした。用紙サイズの名称ではなく，SpreadJSの定数値が返されました。

* ACI0102158 `VP Get cell style`コマンドを一回のメソッドで何度も呼び出した場合，スタイル情報の取得に時間がかかりました。

* ACI0102124 View Proエリアから別のView Proエリアにセルの内容をコピー＆ペーストした場合，フォーミュラではなく値が転写されました。リボンインターフェースを使用すれば問題ありません。標準キーボードショートカットを使用した場合に期待したようなコピー＆ペーストができません。

* ACI0102357 Apple Siliconのみ。メソッドが追加されていない空のプロジェクトをコンパイルしようとした場合，内部エラーが返されました。

* ACI0102337 バイナリモードのみ。リストボックスの列に64ビット整数フィールドを表示した場合，数値フォーマットを適用できませんでした。

* ACI0102313 日本語のテーブルタイトルを`VP SET FIELDS`で登録した場合，テーブル名の濁点や半濁点が除去されました。

* ACI0102292 `New OAuth2 provider`に無効なパラメーターが渡された場合，エラーが返されませんでした。

* ACI0102488 クライアント/サーバー通信の暗号化を有効にした場合，クライアントからのアクセスが集中するとサーバーがフリーズすることがありました。

* ACI0102487 Windows版のみ。`entity.fromObject()`でエンティティの外部キーを更新しようとした場合，リレーション属性の値ではなく，プライマリーキーが代入されました。

* ACI0102474 Mac版のみ。マウス操作でウィンドウをリサイズした場合，リサイズ中は`GET WINDOW RECT`から返される`top`位置が上下に変動しました。

* ACI0102464 `WP Get view properties`は，スペルチェックの情報（標準アクションの`spell/enabled`）ではなく自動スペルチェックの情報（`OBJECT Get auto spellcheck`）を返しました。

* ACI0102454 プリエンプティブプロセスでSQLコードを実行し，`FN`ステートメント経由でメソッドをコールした場合，サーバーがクラッシュしました。

* ACI0102433 コレクションにオブジェクト型を追加し，そのプロパティにエンティティを追加した場合，`property == null`のような条件でコレクションをクエリするとエンティティが返されました。`File`や`Folder`でも同じような結果になり，標準の`Object`と振る舞いが違います。

* ACI0102425 クラス関数の中で`WEB SET HTTP HEADER`を使用した場合，常に`200 OK`のHTTPステータスコードが返されました。プロジェクトメソッドで使用すれば問題ありません。

* ACI0102424 View Proスプレッドシートに統合されたセルが含まれている場合，SVG形式のエクスポートが正しく変換されませんでした。

* ACI0102388 詳細フォーム型のサブフォーム（ウィジェット）に対して`OBJECT SET SCROLL POSITION`または`OBJECT GET SCROLL POSITION`を使用することができませんでした。

* ACI0102380 データ言語が日本語に設定されている場合，`Compare strings`を`sk strict`モードで使用すると，`sk case insensitive`を指定しなくても常に大文字と小文字が同等とみなされました。日本語版は，大文字と小文字を同等とみなさないのがデフォルトの動作です。

* ACI0102379 `IMAP_MsgLst`から返される件名のアクセント文字が間違っていることがありました。

* ACI0102374 インタープリターモードのみ。配列型リストボックスの制御配列プロパティに倍長整数型の配列が使用されている場合，フォームのロード時に配列がブール型で再初期化されました。

* ACI0102573 バイナリモードのみ。インタープリターモードではREST公開したメソッドをサーバー側でデバッガーすることができませんでした。また，コンパイルモードではREST公開したメソッドをサーバー側のコオペラティブプロセスで実行できませんでした。

* ACI0102838 Windows版のみ。DirectWriteレンダリングを有効にした場合，バイナリモードで自動的に生成されたリストフォームのフィールドがオブジェクトの境界を超えて表示されました。

* ACI0102822 入力不可フィールドに表示フォーマットが設定されている場合，値が完全に表示されないことがありました。ACI0102747が修正されたことによる副作用のようです。

* ACI0102813 XML要素の値に`Char(29)`のような制御文字が含まれている場合，`DOM EXPORT TO VAR`または`DOM EXPORT TO FILE`を実行するとアプリケーションがクラッシュしました。

* ACI0102836 ビルド版アプリケーションを起動し，初回にデータファイルの場所を指定した場合，`lastDataPath.xml`が更新されず，次回もデータファイルの場所を指定するよう求められました。ビルド`277038`よりも前のバージョンでは問題ありません。

* ACI0102801 Mac版のみ。4Kまたは5KのRetinaディスプレイにフォームを表示した場合，線。四角形・円などのオブジェクトが正しく表示されませんでした。図形とはずれた位置に外縁が描画されました。

* ACI0102847 フォームメソッドで`SystemWorker.wait()`を実行した場合，システムワーカーからのメッセージが返されませんでした。

* ACI0102831 *On Server Startup*データベースメソッドで`OPEN DATABASE`を使用した場合，管理画面を閉じるまで再起動がブロックされました。

* ACI0102834 Apple Siliconコンパイルモードのみ。「サーバー側で実行」メソッドで`Count parameters`を使用した場合，正しい数が返されませんでした。

* ACI0102789 フォームエディターの実行ボタンをクリックした場合，フォームがアプリケーションプロセスで実行されるため，プロセス変数が使用されているフォームオブジェクトのプロパティがリセットされませんでした。

* ACI0102731 バイナリモードのみ。クライアント側で`FORM LOAD`を使用し，空のフォームをロードした場合，終了時にアプリケーションがクラッシュしました。

* ACI0102534 クライアントが終了してもサーバー側のエンティティセレクションが解放されないことがありました。

* ACI0102533 Mac版のみ。関連フォルダーを含めずにプロジェクトをコンパイルした場合，*Librairies*フォルダー内の*lib4d-arm64.dylib*ファイルが上書きされませんでした。

* ACI0102531 Mac版のみ。4D Go Mobileでコレクション型のテンプレート（例：`simpleCollection`）を使用してカレントエンティティをスコープとしたアクションを設定した場合，ロングクリック操作ではなく，スワイプ操作でアクションのリストが表示されました。

* ACI0102530 新規データファイルを作成した直後にトランザクションを開始し，レコードを追加してトランザクションを確定しないままインデックスフィールドの並び替えを実行した場合，アプリケーションがクラッシュしました。

* ACI0102525 Windows版のみ。「Silicon macOSクライアントからの接続を許可」を有効にし，コンパイル済みストラクチャの場所を指定してビルド版のサーバーアプリケーションとコンパイル版のプロジェクトを同時にビルドしようとした場合，コンパイル版のプロジェクトが作成されませんでした。「Silicon macOSクライアントからの接続を許可」を有効にしなければ問題ありません。

* ACI0102524 同一ドキュメント内で`4DEACH`タグと`4DLOOP`タグの両方を実行することができませんでした。

* ACI0102513 統合Webエリアの`$4d`オブジェクトを使用してJavaScriptからメソッドを実行することができませんでした。CEFのアップデートに伴う不具合のようです。

* ACI0102507 クライアント/サーバー版プロジェクトモードのみ。入力フォームでトランザクションを開始し，フォームを閉じると同時にトランザクションをキャンセルした場合，約`3`分後に「サーバーとの接続が壊れました」エラーが返されました。トランザクション中に`ARRAY TO LIST`を実行した場合に問題が発生します。

* ACI0102506 アカウント情報の氏名または会社名にアクセント記号が使用されている場合，ライセンスのアクティベーションができませんでした。

* ACI0102497 リモートデータストアにORDAでアクセスした場合，パスの中間または最後に記述されたエイリアス属性が`null`として評価されました。

* ACI0102495 クライアント/サーバー版のみ。「サーバー側で実行」メソッドを実行した後，クライアント側のプロセスでレコードをロックした場合，`LOCKED BY`や`Get lock record info`がサーバー側のユーザー名およびマシン名を返しました。

* ACI0102567 Apple Siliconのみ。時間型の除算がコンパイルエラーになることがありました。

* ACI0102565 ポインターの逆参照でフォーミュラを作成した場合（例：`Formula(gPtr->:=2)`）逆参照の演算子（`->`）が取り除かれました。

* ACI0102562 Mac版のみ。Webエリアに表示したページでカメラの使用は許可できるようになりましたが，マイクの使用は許可できませんでした。

* ACI0102560 データベース設定で「Webサービスリクエストを許可する」を無効にした場合，`/4DWSDL`にアクセスするとXMLエラーが表示されました。

* ACI0102558 クライアント/サーバー版のみ。リレーション属性と一緒にエンティティセレクションを`entitySelection.toCollection()`でコレクションに変換した場合，クライアント接続が切断されるまでエンティティセレクションが解放されずにメモリーリークが発生しました。

* ACI0102556 メソッド名に日本語が使用されている場合，Apple Siliconターゲットのコンパイルが失敗することがありました。`LAUNCH EXTERNAL PROCESS`で日本語のファイル名が`clang`に渡されていますが，UTF-8の日本語はShift_JISよりもバイト数を必要とすることが考慮されていないようです。

* ACI0102555 `LISTBOX SET PROPERTY`に空の文字列を渡してリストボックスの詳細フォーム名（`lk detail form name`）をリセットすることができませんでした。

* ACI0102550 プロジェクトモードのみ。プロジェクトが膨大な数のフォームやメソッドなどのソースファイルで構成されている場合，ハードディスクから*.4DZ*ファイルを起動するのに時間がかかりました。`32,000`個のフォームをロードするのに約`20`秒を要するかもしれません。バイナリモードであれば`2`秒ほどで起動できます。SSDでは問題ありません。

* ACI0102549 Apple Siliconのみ。負の値を減算するようなコードがコンパイルエラーになりました。

* ACI0102548 `#DECLARE`宣言を記述せずに`return`キーワードを使用し，プロジェクトメソッドを単独で実行した場合，アプリケーションがクラッシュしました。サブルーチンとして呼び出せば問題ありません。

* ACI0102546 フランス語版のみ。Write Proウィジェットに英語とフランス語のローカライズが混在していました。

* ACI0102542 モバイルプロジェクトエディターの「ストラクチャ」セクションでリレーションを追加した場合，リレーションで結ばれたデータクラスの計算属性が公開（`exposed`）されていなくても，フィールドリストに表示されました。そのような計算属性をフォームに追加しようとすると，エラーが返されました。明示的に公開されていないリレーション計算属性は，フィールドのリストに表示されるべきではありません。

* ACI0102541  Mac版のみ。Intelターゲット専用のアプリをビルドした場合，アプリケーションが起動できませんでした。`LSArchitecturePriority`プロパティキーをセットし，Siliconターゲットが存在しない場合には自動的にRosettaで起動するべきです。

* ACI0102539 Windows版のみ。4D for Androidに必要なファイル（内部コンポーネント「4D Mobile App.4dbase」のdatabaseフォルダー）がインストールされませんでした。

* ACI0102537 バーチャルストラクチャでフィールドタイトルが設定されている場合，`PRINT LABEL`を実行すると，フィールド値ではなくフィールド名がラベルに出力されました。

* ACI0102536 未確定（入力中）の日本語変換文字列を`delete`キーですべて削除した場合，確定済の文字列も`1`文字削除されました。

* ACI0102535 プロジェクトモードのみ。コンポーネントメソッドをWebサービスとして公開できませんでした。ホストがバイナリモードであれば問題ありません。

* ACI0102810 Windows版のみ。電源に接続されていないノートパソコンからサーバーに接続し，クライアントを起動したままシステムを放置した場合，スリープの解除後にクライアントがサーバーに自動再接続できませんでした。

* ACI0102808 Windows版のみ。タブコントロールの描画に問題がありました。タブの数が多く，フォームの幅にすべて収まらない場合，矢印ボタンが縦スクロールバーに重ねて表示されました。Windows 11では，矢印ボタンが表示されません。

* ACI0102806 クライアント/サーバー版のみ。クラス関数からエンティティセレクション型のオブジェクトを返した場合，メモリーリークが発生する可能性がありました。

* ACI0102802 IMAPトランスポーターを使用してdovecotメールサーバーからメールを受信しようとした場合，アプリケーションがフリーズすることがありました。GmailやExchangeサーバーでは問題ありません。

* ACI0102795 [`Web Server`](https://developer.4d.com/docs/ja/WebServer/webServerObject.html)オブジェクトを使用して複数のHTTP/HTTPSサーバーを起動した場合，すでにポートが使用されている場合はエラーが返されるべきですが，特定の条件が揃うと，待ち受けポート番号が勝手にインクリメントされてサーバーが開始されました。

* ACI0102792 オブジェクト型のクラスを`4D.System Worker`と宣言した場合，`wait()`などの関数コールに対してコンパイラー警告`550.2`が表示されました。

* ACI0102785 `VP All`でレンジを作成し，`VP SET CELL STYLE`で*backColor*を`Null`に設定してデフォルトのスタイル属性をクリアした後，`VP Cells`で作成したレンジの*backColor*を設定しようとした場合，*backColor*以外の属性はクリアされ，*backColor*は変更されませんでした。

* ACI0102782 すべてのセクションが横向きに設定されたWrite Proドキュメントからセクションを削除した場合，一部のセクションが縦向きになりました。

* ACI0102781 Windows版のみ。`VP Copy to object`を実行するとView Proエリアが真っ白になりました。

* ACI0102780 Windows版のみ。*Alt*キーを押しながら下矢印キーを入力した場合，コンボボックスまたはポップアップメニューに関連づけられた選択リストの表示がトグルされるべきですが，何も起きませんでした。

* ACI0102779 4D ViewスプレッドシートをView Proに変換した場合，フォーミュラが正しく変換されないことがありました。フォーミュラの冒頭に`-1`という値が使用されている場合に問題が発生します。

* ACI0102777 旧バージョンで作成されたインタープリター版のストラクチャをサーバーで開いた場合，クライアントのログイン画面と同時にデッドロック状態が発生し，アプリケーションが使用できないことがありました。

* ACI0102774 Mac版のみ。4D for iOSのフォームセクションで１対Ｎリレーションフィールドを追加した後，ＮテーブルをREST公開し，フォームセクションで追加した場合，*.4dmobileapp*ファイルに`isToMany`属性が追加されないため，生成されたストーリーボードに必要な`relationIsToMany`がありませんでした。

* ACI0102772 `Begin SQL`という文字列を`Parse formula`で解析した場合，トークン（`Begin SQL:C949`）が返されませんでした。`End SQL`も同様です。

* ACI0102771 プロジェクトモードのみ。ボタンが「フォーカス可」に設定されている場合，「サブレコード追加」および「サブレコード削除」の標準アクションが動作しませんでした。

* ACI0102766 リサイズプロパティが「拡大」に設定されたオブジェクトが配置された入力フォームを`DISPLAY RECORD`で表示した場合，アプリケーションがクラッシュしました。

* ACI0102764 View Proスプレッドシートのチャートをコピー＆ペーストすることができませんでした。

* ACI0102763 プロジェクトモードのみ。v18から変換したプロジェクトで内部にリストボックスが表示されたサブフォームの「自動サイズ」プロパティをコンテキストモードで有効にした場合，アプリケーションがクラッシュしました。

* ACI0102757 Mac版のみ。リストボックスのヘッダーの表示に問題がありました。上側の罫線が描画されません。ヘッダーの高さを２行以上にすると上側の罫線が描画されます。

**注記**: Macでは，リストボックスのヘッダーに相当するネイティブオブジェクトは高さが決められています。高さをカスタマイズした場合，ヘッダーは4Dによって描画されるため，macOS 11/12特有のデザインに左右されません。macOS 10.15 Catalina以前のデザインでは，ヘッダーに上側の罫線がありました。

* ACI0102578 `WP Get position`から返される`bounds.left`の値が正しくないことがありました。段落の直後にある空行にカーソルを置いた場合，`WP Text range`はカーソルの位置ではなく段落の最終位置を返すようです。

* ACI0102577 プロパティリストでボタンのタイトルを変更し，項目の入力を確定せずにフォームを閉じた場合，値が更新されませんでした。

* ACI0102576 リストボックスのヘッダーの画像ソースに値が設定されていない場合，ストラクチャをプロジェクトに変換すると，当該プロパティが存在しないリストボックスになりました。

* ACI0102575 バイナリモードの新規ストラクチャを作成した場合，リストボックスのヘッダーの画像ソース（変数名）がプロパティリストに表示されませんでした。

* ACI0102574 メニューバーにピクチャライブラリのスプラッシュ画像が設定されている場合，ストラクチャをプロジェクトに変換すると，スプラッシュ画像の参照が失われました。

* ACI0102572 クライアント/サーバー版のみ。新規プロセスで`Create entity selection`を実行し，エンティティセレクションを作成した場合，メモリーリークが発生しました。

* ACI0102606 コンパイルモードでは`#DECLARE`構文で宣言したパラメーター名の大文字と小文字が区別されました。

* ACI0102605 4D Go MobileでＮフィールドの追加アクションを実行した場合，リレーションの１フィールドに関する情報がデータベースメソッドに返されませんでした。

* ACI0102604 パラメーターが設定されたアクションビューを4D for Androidで開いた場合，ビューのタイトルにはアクション名ではなく"Action Parameters"が表示されました。

* ACI0102603 メソッドエディターでクラスを開いた場合，メソッドエディターのタイプアヘッドに同じ候補が何度も表示されることがありました。`Function get`で問題が発生するようです。

* ACI0102602 整数型のフィールドを4D Go Mobileで開いた場合，入力エリアに小数の`.0`も表示されました。

* ACI0102601 View Proスプレッドシートのセルスタイルに`wordWrap`が適用されている場合，`VP EXPORT DOCUMENT`がエラーを返しました。

* ACI0102600 `HTTP Request`が`0`や`1`といった不明なステータスコードを返すことがありました。アプリケーションを長時間にわたって運用していると発生するようです。

* ACI0102599 Mac版のみ。4D for iOSのリストフォームまたは詳細フォームにフィールドを追加してから削除し，再び追加した場合，そのフィールドは表示されませんでした。`defaultField`プロパティが追加されないためです。

* ACI0102598 ピクチャ型のパラメーターが設定されたアクションのビューを4D for Androidで開こうとした場合，アプリがクラッシュしました。

* ACI0102597 日付型のフィールドに設定されたアクションビューを開こうとした場合，4D for Androidがクラッシュしました。

* ACI0102593 プロジェクトモードのみ。フォームの最小サイズを最大サイズよりも上に設定した場合，右位置が最大サイズを超えているオブジェクトが完全に表示されませんでした。矛盾した設定ですが，フォームのプロパティは`.json`ファイルまたはオブジェクト型で設定できる以上，あり得ないことではありません。バイナリモードでは，最大サイズと最小サイズの大きいほうが最大サイズになりました。

* ACI0102592 メソッドエディターでクラスを開いた場合，エディターのヘッダーに関数名が表示されますが，長い関数名は途中で切れてしまうことがありました。

* ACI0102589 Apple Siliconのみ。プラグインコマンドの整数型パラメーターに定数の`0xffff`が渡されている場合，コンパイルエラーが返されました。

* ACI0102584 4D Go Mobileの「データ」セクションから「公開」セクションに移動し，プロダクションサーバーのアドレスを入力してから「データ」セクションに戻った場合，ランタイムエラーが返されました。

* ACI0102579 プロジェクトモードのみ。フォームエディターとプロパティリストを表示した状態でプロジェクトを閉じた場合，次回の起動でフォームエディターは表示されますが，プロパティリストは表示されませんでした。

* ACI0102626 サーバーアプリケーションが非公開で，サービス名をブロードキャストされていない場合，初回の起動時にアドレスを手入力する必要がありますが，直後にビルド版クライアントの自動アップデートが実行された場合，アップデート後にアドレスの再入力を求められました。`LastServer.xml`ファイルが作成または更新されないためです。

* ACI0102625 コンパイル版のコンポーネントから呼び出されたホストの共有メソッドで`Current method path`または`Current method name`を使用した場合，間違った値が返されることがありました。ホストの共有メソッドでプロジェクトメソッドを実行した後にいずれかのコマンドを使用すると問題が発生します。インタープリター版のコンポーネントから呼び出した場合は問題ありません。

* ACI0102623 ストラクチャファイルをプロジェクトにエクスポートした場合，データベース設定でソースファイルのトークナイズが無効にされていても，コードがトークン形式で書き出されました。

* ACI0102622 BLOB型フィールドの保存オプションが「データファイル内」に設定されており，一部のレコードが暗号化されていない場合，MSCでデータファイルの暗号化または圧縮を実行しても，当該レコードが暗号化されないことがありました。

* ACI0102618 Write Proドキュメントの表組の直前にハイバーリンクを挿入した場合，列の幅を変更することができませんでした。`WP SET LINK`でハイパーリンクを設定した場合は問題ありません。

* ACI0102617 サーバーに接続中のクライアントをしばらく操作しなかった場合，接続が延期状態になりますが，これが同時に複数のクライアントで発生すると，一部のクライアントがクラッシュすることがありました。

* ACI0102616 クライアント/サーバー版のみ。ドメインサーバーによるユーザーの認証」が有効にされている場合，旧式ネットワークレイヤーではクライアント側にエラーが表示され，新ネットワークレイヤーではサーバーがクラッシュしました。サービス名にハイフン記号が含まれていなければ問題は発生しません。

* ACI0102613 有効な[三項演算子](https://developer.4d.com/docs/ja/Concepts/operators.html#ternary-operator)がシンタックスエラーになることがありました。コロンの後にマイナス記号を記述した場合にシンタックスエラーとなるようです。数値をカッコで括れば問題ありません。

* ACI0102610 `File(Debug log file)`が*null*を返しました。

* ACI0102754 macOS 12 Montereyのみ。ボタンタイトルにハイフン記号（U+002D, `-`）を単独で使用した場合，非アクティブ時にはハイフンが通常よりも長くなり，垂直揃えの位置も変化しました。U+2212であれば問題ありません。

* ACI0102753 *On Clicked*および*On Double Clicked*イベントがView Proエリアでは`2`回発生しました。

* ACI0102751 Windows版のみ。Webエリアを使用して入力フォームにPDFファイルを表示した場合，ダイアログを終了して出力フォームに戻ると，入力フォームの一部が出力フォームに重ねて描画されました。

* ACI0102750 Windows版のみ。SDIモードのアプリケーションをビルドした場合，100% (96 DPI) よりも高解像度のディスプレイにフォームが正しく表示されませんでした。

* ACI0102748 オブジェクト型フィールドにはクラスのインスタンスを保存することができますが，バックアップからデータファイルを復元した場合，そのようなオブジェクトのメンバー関数が失われました。

* ACI0102747 入力不可かつフォーカス可のテキスト入力エリアに入力フィルターを設定した場合，オブジェクトをスクロールしたりクリックしたりして表示を更新するとデータソースの値に入力フィルターが適用されました。値をタイプ入力したわけではないので，入力フィルターは適用されるべきではありません。

* ACI0102746 Mac版のみ。無名のインタープロセス変数に値を代入するようなコード（例：`<>:=0`）をコンパイルした場合，Intelターゲットは成功しますがApple Siliconターゲットはエラーになりました。

* ACI0102745 パラメーターの間接指定にンタックスエラーがあり，`C_VARIANT(${$})`と記述されている場合，シンタックスチェックがクラッシュしました。

* ACI0102739 データ言語が日本語に設定されている場合，`WP Find all`を`sk strict`モードで使用すると，`sk case insensitive`を指定しなくても常に大文字と小文字が同等とみなされました。日本語版は，大文字と小文字を同等とみなさないのがデフォルトの動作です。

* ACI0102738 タブコントロールをクリックしてフォームのページを切り替えた場合，入力オブジェクトが入力不可になり，編集メニューも使用できなくなることがありました。

* ACI0102735 Webリクエストの処理中にデバッガーが表示され，数回，ステップオーバーを実行した場合，デバッガーが途中で閉じられ，それ以降，デバッガーが表示されなくなりました。

* ACI0102727 予約されたクラス名（DataStoreImplementation, DataClass, Entity, EntitySelection）と同名のクラスを作成しようとした場合，警告が表示されませんでした。

* ACI0102725 `var`シンタックスを使用して同じ変数を別々のクラスで宣言した場合，シンタックスエラーにもコンパイルエラーにもなりませんでした。

* ACI0102724 予約されたクラス名（`cs.DataStore` `cs.Entity` `cs.EntitySelection`）をメソッドに入力した場合，警告が表示されませんでした。

* ACI0102723 拡張できる`4D`クラス（例：`4D.Signal`）のカスタムプロパティをメソッドに入力した場合，警告が表示されました。

* ACI0102720 `SQL EXECUTE`でSybaseに対して実行したクエリが`null`を返した場合，空の要素１個の配列が返されました。`null`が返された場合は空の配列が返されるべきです。

* ACI0102718 クライアント/サーバー版のみ。`$entitySelection.toCollection()`の速度が以前のビルドと比較して３倍ほど低下しました。

* ACI0102711 Windows版のみ。ドロップダウンメニューの右側に表示される矢印ボタンの垂直揃えが正しくありませんでした。ドロップダウンメニューの高さを`20`以外にした場合，中央ではなく下に表示されます。

* ACI0102710 `VP SET CELL STYLE`に`Null`を渡した場合，指定したレンジの最初のセルは背景がクリアされましたが，残りのセルは背景がクリアされませんでした。

* ACI0102709 `VP SET@`コマンドを一回のメソッドで何度も呼び出した場合，スプレッドシートの更新に時間がかかりました。

* ACI0102708 `MAIL Convert from MIME`で解析したメールの本文が正しくデコードされないことがありました。コマンドが文字セット`Windows-1258`に対応していません。

* ACI0102707 `MAIL Convert from MIME`で解析したメールの件名が正しくデコードされないことがありました。コマンドが文字セット`unicode-1-1-utf-7`に対応していません。

* ACI0102705 *On Losing Focus*イベントで`EDIT ITEM`を実行し，リストボックスのシングルクリック編集と同時に別のリストボックスの編集を開始した場合，一方のセルに点滅カーソルが表示され，他方のセルがテキスト入力の対象になりました。

* ACI0102698 特定の4D Writeドキュメントを`WP New`に渡した場合，アプリケーションがクラッシュしました。

* ACI0102693 Mac版のみ。macOS 12.3 beta 3でアプリケーションを起動することができませんでした。4D Write Proがアプリケーションではなくシステムの*liblzma.5.dylib*とリンクされているためです。

* ACI0102692 Windows版のみ。OEM版のサーバーアプリケーションが起動できませんでした。OEM版でなければ問題ありません。

* ACI0102690 クライアント/サーバー版のみ。キャッシュの空きが少ない状況でデータクラスメソッドを実行した場合，ランゲージコンテキストが不足しているというエラーが返されました。

* ACI0102689 `Char(2)`のようなASCII制御コードをセパレーターに使用して`Split string`で文字列をコレクションに分解した場合，正しい結果が返されませんでした。

* ACI0102684 デバッグログを有効にしてサーバー側で`OPEN DATA FILE`を何度も実行した場合，サーバーが終了しました。

* ACI0102683 クライアントが接続していない4D ServerにORDAのREST APIでアクセスした場合，セッション数の上限に達したというエラーメッセージが返されました。RESTライセンス数がない場合，余分のクライアント同時接続ライセンスがREST APIのセッション管理に回されるべきです。

* ACI0102680 リモートデータストア（[`Open datastore`](https://doc.4d.com/4Dv19/4D/19.1/Open-datastore.301-5653084.ja.html)）のオプション`idleTimeout`が機能していませんでした。指定したタイムアウトが経過した後，接続は閉じられ，ライセンスが解放されるべきです。

* ACI0102678 4D ViewスプレッドシートをView Proに変換した後，デバッガーでトレースし，セルのフォーミュラを表示した場合，`=LIBELLE("";A1)`のようなフォーミュラ式が`=LIBELLE(""A1)`のようになり，セパレーター記号が失われました。

* ACI0102676 プロジェクトモードのみ。ジャーナリングを停止することができませんでした。

**注記**: 修正により，ログファイルを使用するかどうかは，データファイルではなく，プロジェクトファイルで決まるようになりました。データベース設定を変更したり，`SELECT LOG FILE(*)`を実行した後，数秒後に*.4DCatalog*ファイルの`journal_file_enabled`プロパティが更新されます。

* ACI0102674 フランス語版のみ。View Proエリアの「書式を別の場所にコピーして適用」ツールは，Microsoft Excelに倣い，"eproduire la mise en forme"と表示されるべきです。

* ACI0102671 Mac版のみ。デザインモードでフォームエディターを開き，オブジェクトのプロパティリストにカーソルが入っている状態でツールバーの検索エリアをクリックした場合，検索エリアにキャレットが表示されず，テキストの入力や選択ができませんでした。

* ACI0102670 4D ViewスプレッドシートをView Proに変換した場合，セルの参照が正しくコンバートされないことがありました。*AB*のような後方のセルで問題が発生します。`Sheet1!$AB$2`となるべきところが`Sheet1!$\\\\$2`のような参照に変換されました。

* ACI0102669 Windows版のみ，高解像度モードで`DISPLAY RECORD`を実行し，入力フォームを表示した場合，DPI設定が反映されず，フォームの内容がズーム表示されました。

* ACI0102643 `VP SET DATE TIME VALUE`で空の日付値（`!00-00-00!`）を渡した場合，1899年11月30日になりました。無効な日付は`null`になるべきです。

* ACI0102642 プロジェクトモードのみ。入力順ツールを選択した状態でフォームのページ`0`に表示を切り替えた場合，オブジェクトの入力順が表示されませんでした。ページ`0`に表示を切り替えた後に入力順ツールを選択すれば，ページ`0`の入力順が表示されます。

* ACI0102641 `WP Get position`が`1`回目と`2`回目以降で異なるページ番号を返すことがありました。正しいのは`2`回目以降の値です。

* ACI0102636 ページ・カラム・セクションのブレークで終了する段落に`WP INSERT DOCUMENT`でドキュメントの断片を挿入した場合，`WP Get position`が正しい値を返さなくなりました。

* ACI0102635 *On Load*イベントでタブコントロールに対して`SELECT LIST ITEMS BY POSITION`を実行することにより，フォームのページを切り替えることができませんでした。

* ACI0102634 日本語入力モードでスペースバーを押しても半角スペース（`U+0020`）が入力されました。全角スペース（`U+3000`）が入力されるべきです。

* ACI0102633 メソッドエディターの検索ツールに入力したテキストがハイライト表示されませんでした。

* ACI0102632 `SQL EXECUTE`で`SELECT`を実行した場合，長さが`1032`文字以上のテキストは最後の一文字が出力されませんでした。

* ACI0102630 クライアント/サーバー版のみ。ORDAのHTTPリクエストがgzipではなくzlibを使用するためにメモリーリークが発生しました。

* ACI0102629 クラスを削除した場合，再コンパイルせずにビルドアプリケーションが実行できました。

* ACI0102653 `SET DATABASE LOCALIZATION`でローカライズ言語を変更した場合，Write Proエリアのコンテキストメニューにシステム言語とローカライズ言語が混ざって表示されました。

* ACI0102652 プロジェクトの*Settings*フォルダーが欠落している場合，サーバー管理画面でログ設定ファイル（[*logConfig.json*](https://developer.4d.com/docs/ja/Admin/debugLogFiles.html)）を読み込むことができませんでした。必要であればフォルダーを作成し，そこにファイルをコピーするべきです。

* ACI0102651 `SVG_SET_OPACITY`を`image`に対して使用し，`opacity`に`-1`を渡した場合，画像が透明になりました。`-1`を渡した属性は変更されないはずです。

* ACI0102649 クイックレポートエディターを閉じると「ポインターの使用が間違っているか，未知の変数に対するポインター」ランタイムエラーが返されました。

* ACI0102648 19r3以前に作成されたプロジェクトを19r4で開いた場合，`POST KEY`の定数`Return Key`に余計な`return`トークンが挿入され，`return ReturnKey`に補正されました。

* ACI0102647 Windows版のみ。「印刷時可変」オブジェクトのテキストが途切れることがありました。DirectWriteモードでなければ問題ありません。

* ACI0102646 Mac版のみ。システムWebエリアで`WA EXECUTE JAVASCRIPT FUNCTION`を実行することができませんでした。

* ACI0102644 プロジェクトを開くたびにカタログファイル（*catalog.4DCatalog*）が変更されることがありました。データファイルを切り替えた場合，データファイルに合わせてカタログのインデックスUUIDが更新されるためです。

* ACI0102665 Mac版のみ。*On After Edit*イベントが有効にされたテキスト入力エリアでカラーピッカーを表示し，ボタンを押したままピッカー上でマウスを移動した場合，*On After Edit*イベントが大量に発生しました。期待されるのは，ボタンをリリースしたタイミングでイベントが発生することです。

* ACI0102664 View Proの`HYPERLINK`関数でパス名に日本語が使用されているローカルファイルを開くことができませんでした。

* ACI0102663 インタープリターモードのみ。数日以上にわたってアプリケーションを運用し，プロセスの作成と破棄を繰り返した場合，ローカル変数に対するポインターが未定義となることがありました。

* ACI0102662 データベース設定でWebサーバーの文字セットをUTF-8以外に設定されていても，ユーザーエージェントから`GET`または`POST`で送信したフォーム変数が常にUTF-8でデコードされました。

* ACI0102659 Mac版のみ。フォームエディター上でオブジェクトを選択し，プロパティリストからカラーピッカーを表示した直後など，プロパティリストがアクティブであれば，ピッカーでカラーを選択することができますが，別のフォームオブジェクトを選択した場合など，プロパティリストがアクティブではなくなった場合，ピッカーでカラーを選択することができませんでした。

* ACI0102657 ラベルエディターのフォーマットページに表示されているポップアップメニューがいずれも空でした。

* ACI0102143 `Get process activity`または`OB Get`（テキスト型のプロパティを参照した場合）を実行するたびにメモリーリークが発生しました。

* ACI0102882 4D Go Mobileの「データ」セクションで「ビルド毎のデータを再生成しない」チェックボックスを有効にし，データを再生成した場合，テーブル毎のデータサイズが表示されなくなりました。

* ACI0102875 4D Go Mobileの「ラベル＆アイコン」セクションにＮ対１リレーションで結ばれたデータクラスの計算属性のフィールド名が表示されませんでした。

* ACI0102803 プロジェクトモードのみ。ユーザーIDの欠番がある場合，プロジェクトを開き直すと*directory.json*ファイル内のユーザーやグループの順序が入れ替わりました。

* ACI0102521 コンパイルモードのみ。`SET DATABASE PARAMETER`でデバッグログ（`Debug log recording`）を実行した場合，メソッドのパラメーターが正しく記録されませんでした。

**注記**: コンパイルモードでメソッドのパラメーターを記録することはできません。修正により，設定はインタープリターモード限定のオプションとなりました。

* ACI0102856 Mac版のみ。コンボボックスの水平揃えを「右揃え」に設定した場合，クリックしたときに表示される項目の右端の文字が完全に表示されませんでした。スクロールバーの有無やオブジェクトの幅とテキストの長さが関係しています。Catalina/Big SurとMontereyでは現象が少し違います。

* ACI0102442 Write Proエリアの表示モードを下書きからページに切り替えた場合，垂直ルーラーがすぐに表示されませんでした。

* ACI0102491 外部ディスプレイの座標を`SCREEN COORDINATES`で取得し，`Open form window`にそのまま渡した場合，正しい位置にウィンドウが表示されませんでした。
