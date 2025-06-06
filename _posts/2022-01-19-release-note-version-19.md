---
layout: fix
title: "4D v19.2 修正リスト"
date: 2022-03-07 08:00:00
categories: 修正リスト
tags: "19.2"
build: 276674
version: "19.2"
permalink: /19/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0102738 タブコントロールをクリックしてフォームのページを切り替えた場合，入力オブジェクトが入力不可になり，編集メニューも使用できなくなることがありました。

* ACI0102671 Mac版のみ。デザインモードでフォームエディターを開き，オブジェクトのプロパティリストにカーソルが入っている状態でツールバーの検索エリアをクリックした場合，検索エリアにキャレットが表示されず，テキストの入力や選択ができませんでした。

* ACI0102600 `HTTP Request`が`0`や`1`といった不明なステータスコードを返すことがありました。アプリケーションを長時間にわたって運用していると発生するようです。

**注記**: まれなことですが，ソケットの読み取り中に`VE_SOCK_CONNECTION_BROKEN` `VE_SOCK_PEER_OVER`が返された場合，すでに受信したデータを処理していたことが関係していました。修正により，そのような場合には読み取りを中止するようになりました。

* ACI0102535 プロジェクトモードのみ。コンポーネントメソッドをWebサービスとして公開できませんでした。ホストがバイナリモードであれば問題ありません。

* ACI0102719 Mac版のみ。WindowsにインストールしたInternet CommandsプラグインがmacOSでは認識されませんでした。*Info.plist+ファイルにビルド用のプレースホルダー文字列が残っているためです。

* ACI0101408 `HTTP SET OPTION`の`HTTP timeout`オプションが`HTTP Get`の動作に反映されませんでした。つまり，サーバー接続に成功し，なかなか応答が返されず，切断もされない場合，いつまでもレスポンスを待ちました。
 
* ACI0102715 `19.2`インストーラーでインストールしたInternet Commandsプラグインのバージョン名が`19.1`のままでした。

* ACI0102680 リモートデータストア（[`Open datastore`](https://doc.4d.com/4Dv19/4D/19.1/Open-datastore.301-5653084.ja.html)）のオプション`idleTimeout`が機能していませんでした。指定したタイムアウトが経過した後，接続は閉じられ，ライセンスが解放されるべきです。

* ACI0102678 4D ViewスプレッドシートをView Proに変換した後，デバッガーでトレースし，セルのフォーミュラを表示した場合，`=LIBELLE("";A1)`のようなフォーミュラ式が`=LIBELLE(""A1)`のようになり，セパレーター記号が失われました。

* ACI0102632 `SQL EXECUTE`で`SELECT`を実行した場合，長さが`1032`文字以上のテキストは最後の一文字が出力されませんでした。

**注記**: SyBaseドライバに問題があるようです。`SQLGetData`が常に`1032`を返します。

* ACI0100764 バックアップ設定「指定時間経過後に再試行：時間・分・秒」のデフォルト値がMacでは`0000-00-00T00:00:00.561`，Windowsでは`0000-00-00T00:00:00.000`となっています。v16では`60`秒でした。

**注記**: リソースの*Backup.4DSettings*ファイルが修正されました。

* ACI0102698 特定の4D Writeドキュメントを`WP New`に渡した場合，アプリケーションがクラッシュしました。
 
* ACI0102690 クライアント/サーバー版のみ。キャッシュの空きが少ない状況でデータクラスメソッドを実行した場合，ランゲージコンテキストが不足しているというエラーが返されました。

* ACI0102676 プロジェクトモードのみ。ジャーナリングを停止することができませんでした。

**注記**: 修正により，ログファイルを使用するかどうかは，データファイルではなく，プロジェクトファイルで決まるようになりました。データベース設定を変更したり，`SELECT LOG FILE(*)`を実行した後，数秒後に*.4DCatalog*ファイルの`journal_file_enabled`プロパティが更新されます。

* ACI0102646 Mac版のみ。システムWebエリアで`WA EXECUTE JAVASCRIPT FUNCTION`を実行することができませんでした。
 
* ACI0102653 `SET DATABASE LOCALIZATION`でローカライズ言語を変更した場合，Write Proエリアのコンテキストメニューにシステム言語とローカライズ言語が混ざって表示されました。

**注記**: ドロップダウンメニューや`FONT STYLE LIST`から返されるフォントスタイル名は，常にシステム言語で表示されます。これは仕様です。修正により，シンタックスチェックなどの項目がローカライズ言語で表示されるようになりました。

* ACI0102665 Mac版のみ。*On After Edit*イベントが有効にされたテキスト入力エリアでカラーピッカーを表示し，ボタンを押したままピッカー上でマウスを移動した場合，*On After Edit*イベントが大量に発生しました。期待されるのは，ボタンをリリースしたタイミングでイベントが発生することです。

* ACI0102659 Mac版のみ。フォームエディター上でオブジェクトを選択し，プロパティリストからカラーピッカーを表示した直後など，プロパティリストがアクティブであれば，ピッカーでカラーを選択することができますが，別のフォームオブジェクトを選択した場合など，プロパティリストがアクティブではなくなった場合，ピッカーでカラーを選択することができませんでした。

* ACI0102651 `SVG_SET_OPACITY`を`image`に対して使用し，`opacity`に`-1`を渡した場合，画像が透明になりました。`-1`を渡した属性は変更されないはずです。

* ACI0102645 v18でコンパイルできたストラクチャファイルをv19でコンパイルしようとすると，アプリケーションがクラッシュすることがありました。特定のコードで発生するようです。

* ACI0102642 プロジェクトモードのみ。入力順ツールを選択した状態でフォームのページ`0`に表示を切り替えた場合，オブジェクトの入力順が表示されませんでした。ページ`0`に表示を切り替えた後に入力順ツールを選択すれば，ページ`0`の入力順が表示されます。

* ACI0102663 インタープリターモードのみ。数日以上にわたってアプリケーションを運用し，プロセスの作成と破棄を繰り返した場合，ローカル変数に対するポインターが未定義となることがありました。

* ACI0102644 プロジェクトを開くたびにカタログファイル（*catalog.4DCatalog*）が変更されることがありました。データファイルを切り替えた場合，データファイルに合わせてカタログのインデックスUUIDが更新されるためです。

**注記**: 修正により，データファイルとカタログファイルのインデックスUUIDが一致しない場合，カタログに合わせてデータのUUIDが更新されるようになりました。

* ACI0102629 クラスを削除した場合，再コンパイルせずにビルドアプリケーションが実行できました。
 
* ACI0102424 View Proスプレッドシートに統合されたセルが含まれている場合，SVG形式のエクスポートが正しく変換されませんでした。

* ACI0102635 *On Load*イベントでタブコントロールに対して`SELECT LIST ITEMS BY POSITION`を実行することにより，フォームのページを切り替えることができませんでした。
 
* ACI0102641 `WP Get position`が`1`回目と`2`回目以降で異なるページ番号を返すことがありました。正しいのは`2`回目以降の値です。

* ACI0102634 日本語入力モードでスペースバーを押しても半角スペース（`U+0020`）が入力されました。全角スペース（`U+3000`）が入力されるべきです。

* ACI0102622 BLOB型フィールドの保存オプションが「データファイル内」に設定されており，一部のレコードが暗号化されていない場合，MSCでデータファイルの暗号化または圧縮を実行しても，当該レコードが暗号化されないことがありました。
  
* ACI0102593 プロジェクトモードのみ。フォームの最小サイズを最大サイズよりも上に設定した場合，右位置が最大サイズを超えているオブジェクトが完全に表示されませんでした。矛盾した設定ですが，フォームのプロパティは`.json`ファイルまたはオブジェクト型で設定できる以上，あり得ないことではありません。バイナリモードでは，最大サイズと最小サイズの大きいほうが最大サイズになりました。

* ACI0102507 クライアント/サーバー版プロジェクトモードのみ。入力フォームでトランザクションを開始し，フォームを閉じると同時にトランザクションをキャンセルした場合，約`3`分後に「サーバーとの接続が壊れました」エラーが返されました。トランザクション中に`ARRAY TO LIST`を実行した場合に問題が発生します。

* ACI0102546 フランス語版のみ。Write Proウィジェットに英語とフランス語のローカライズが混在していました。

* ACI0102560 データベース設定で「Webサービスリクエストを許可する」を無効にした場合，`/4DWSDL`にアクセスするとXMLエラーが表示されました。
 
* ACI0102636 ページ・カラム・セクションのブレークで終了する段落に`WP INSERT DOCUMENT`でドキュメントの断片を挿入した場合，`WP Get position`が正しい値を返さなくなりました。

* ACI0102630 クライアント/サーバー版のみ。ORDAのHTTPリクエストがgzipではなくzlibを使用するためにメモリーリークが発生しました。

* ACI0102618 Write Proドキュメントの表組の直前にハイバーリンクを挿入した場合，列の幅を変更することができませんでした。`WP SET LINK`でハイパーリンクを設定した場合は問題ありません。

* ACI0102601 View Proスプレッドシートのセルスタイルに`wordWrap`が適用されている場合，`VP EXPORT DOCUMENT`がエラーを返しました。

* ACI0102589 Apple Siliconのみ。プラグインコマンドの整数型パラメーターに定数の`0xffff`が渡されている場合，コンパイルエラーが返されました。

* ACI0101791 コンパイルされていないプロジェクトの*On Startup*データベースメソッドで`BUILD APPLICATION`を使用した場合，コンパイラーのエラーログファイルが出力されませんでした。*On Startup*のタイミングでは，デザインモードがセットアップされていないためです。

* ACI0102606 コンパイルモードでは`#DECLARE`構文で宣言したパラメーター名の大文字と小文字が区別されました。

* ACI0102357 Apple Siliconのみ。メソッドが追加されていない空のプロジェクトをコンパイルしようとした場合，内部エラーが返されました。

* ACI0102425 クラス関数の中で`WEB SET HTTP HEADER`を使用した場合，常に`200 OK`のHTTPステータスコードが返されました。プロジェクトメソッドで使用すれば問題ありません。

* ACI0102313 日本語のテーブルタイトルを`VP SET FIELDS`で登録した場合，テーブル名の濁点や半濁点が除去されました。

* ACI0102555 `LISTBOX SET PROPERTY`に空の文字列を渡してリストボックスの詳細フォーム名（`lk detail form name`）をリセットすることができませんでした。

* ACI0102474 Mac版のみ。マウス操作でウィンドウをリサイズした場合，リサイズ中は`GET WINDOW RECT`から返される`top`位置が上下に変動しました。

* ACI0102388 詳細フォーム型のサブフォーム（ウィジェット）に対して`OBJECT SET SCROLL POSITION`または`OBJECT GET SCROLL POSITION`を使用することができませんでした。

**注記**: コマンドが改良され，詳細フォーム型のサブフォームも操作できるようになりました。ただし，`OBJECT SET SUBFORM`でサブフォームの内容をセットした場合は注意が必要です。サブフォームのロードは同期処理ではないため，複数のイベントサイクルにコードを分散する必要があります。具体的には
1. `OBJECT SET SUBFORM` → `CALL FORM`
1. サブフォームがロードされる → `CALL FORM`（２回目）
1. スクロール位置の操作ができるようになる

サブフォームを一旦ロードしてからスクロールするため，画面が一瞬ちらつくかもしれません。

* ACI0102225 ビルドしたサーバーアプリケーションにコマンドラインオプションの`--cache-folder-name`を渡してサーバーのキャッシュフォルダーをカスタマイズすることができませんでした。
