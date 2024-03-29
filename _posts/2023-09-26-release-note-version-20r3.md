---
layout: fix
title: "4D v20r3 修正リスト"
date: 2024-01-04 08:00:00
categories: 修正リスト
tags: 20r3
build: 100285
version: "20r3"
permalink: /2023/269/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104386 アプリケーションをビルドした場合，QodlyのWebフォームが表示されませんでした。`PackProject`を`True`に設定し，プロジェクトフォルダーを*.4DZ* 形式に圧縮しなければ問題ありません。

* ACI0104442 タイトルが中央揃えのボタンをプロジェクトモードに変換した場合，タイトルが右揃えになりました。

* ACI0104441 Windows版/Intel Mac版のみ。クラスのメンバー関数をフォーミュラとしてリストボックスに表示した場合，アプリケーションがクラッシュしました。

* ACI0104426 コンパイルモードのみ。ホストデータベースのローカル配列に対するポインターをコンポーネントメソッドに渡した場合，ポインターに対する参照が失われました。３億回ほどプロセスの起動と終了を繰り返したところでランタイムエラー（ポインターの不正な使用）が返されます。

**注記**: 修正により，変数に対するポインターは，カレントプロセスコンポーネントのランゲージ実行コンテキストで優先的に逆参照されるようになりました。その後，別プロセスのランゲージ実行コンテキストで逆参照を試みます。

* ACI0104404 Windows版のみ。プロパティリストに游ゴシックがふたつ表示されました。

**注記**: 修正により，游ゴシックミディアムと游ゴシックが表示されるようになりました。

* ACI0104366 並び替えのプロパティパスにリレーション属性とオブジェクト属性の両方を使用した場合，アプリケーションがクラッシュしました。ACI0097511が修正されたことによる副作用です。

* ACI0104434 ピクチャ型またはBLOB型フィールドにパスを代入した場合，コンパイルエラーが返されました。

* ACI0104431 *NetKit* コンポーネントの`google.mail.getMail()`がテキスト型でMIMEを返しました。BLOBを返すべきです。

* ACI0104432 ３レベル以上の`AND`および`OR`で構成されたJOINクエリの処理が正しくありませんでした。

* ACI0104418 コンパイルモードのみ。*ObjectTools* プラグイン`v5.1r1`の`OT GetPointer`が正しいポインターを返しませんでした。ACI0104030が修正されたことによる副作用です。

* ACI0104436 3Dチェックボックスがクリックに反応しませんでした。ACI0104409が修正されたことによる副作用のようです。

* ACI0104400 フォームウィザードで作成したリスト画面をプロジェクトモードに変換した場合，スプリッターのプッシャー属性（以降のオブジェクトを移動）が失われました。スプリッターモードで動作する透明ボタンが正しく変換されていないことが原因です。標準のスプリッターオブジェクトは問題ありません。

* ACI0104365 Windows版コンパイルモードのみ。`PRINT LABEL`が１ページに１毎しかラベルを出力しませんでした。高解像度ディスプレイでなければ問題ありません。

* ACI0104360 クラスを作成していないプロジェクトで`Compile Project`を実行した場合，`entity.save()`がシンタックスエラーを返しました。

* ACI0104023 *Alt* キーを押さなくても，複数のリストボックス行をドラッグできるようになりましたが，複数の行が選択されている場合は最後にクリックで選択した行が表示されるまでスクロールしてからドラッグが始まりました。行をコマンドで選択したり，下から上に選択したりした場合は問題ありません。

* ACI0104416 証明書と鍵ペアがない状態でTLSを有効にしてSQLサーバーを開始した場合，特にエラーが表示されませんでした。

* ACI0104180 *On Web Connection* データベースメソッドでランタイムエラーが発生した場合，正しくないエンコーディングでエラーページが返されるため，ブラウザ側でXML解析エラーになりました。

* ACI0104409 チェックボックスに対して`OBJECT SET ENTERABLE`を使用した場合の動作が過去のバージョンと違いました。コマンドを実行しても，チェックボックスの外観が変化せず，クリックすることができました。

* ACI0104388 マルチスタイル設定のリストボックスのセルに選択リストを関連付けている場合，セルの入力を確定すると値のソース（`<span>`タグ）がそのまま表示されました。

* ACI0104337 Windows版のみ。メソッドエディターに入力された半角の濁点または半濁点を含むテキストを削除した場合，正しくない位置にカーソルが表示され，カーソルの位置とは違う位置の文字が削除されるようになりました。

* ACI0104047 `LISTBOX SET AUTO ROW HEIGHT`で自動行高リストボックスの行の最大高さを変更した後，`OBJECT SET SCROLL POSITION`で行をスクロールした場合，間違った位置の行にスクロールしました。

* ACI0104046 `LISTBOX SET AUTO ROW HEIGHT`で自動行高リストボックスの行の最大高さを変更した後，行をスクロールした場合，セルの内容が正しく描画されないことがありました。セルの内容が行の最大高さに収まらない場合に問題が発生します。

* ACI0104411 Windows版のみ。リサイズ制約のあるフォームをサブフォームとして表示しているウィンドウを最大化した場合の動作が正しくありませんでした。組み込まれたフォームの最大幅ではなく，最大高さが幅に反映されました。

* ACI0104381 Window版のみ。高DPIモードのディスプレイにピクチャポップアップメニュー小さく表示されました。

* ACI0104410 `dataClass.query()`に渡したクエリ条件の最後に`null`との比較演算を記述した場合，正しい結果が返されませんでした。ACI0104235が修正されたことによる副作用です。最後に`null`との比較演算が来ないようにクエリ条件の順序を変えれば問題ありません。

* ACI0104387 Windows版のみ。大量（`1000`レベル以上）の`<div>`要素で構成されるHTMLを4D Write Proで開こうとした場合，アプリケーションがクラッシュしました。

**注記**: `100`を超える入れ子をHTMLに記述することは推奨されていません。修正により，クラッシュはしないようになりましたが，`100`レベル以降の入れ子は無視されます。

* ACI0104360 クラスを作成していないプロジェクトで`Compile Project`を実行した場合，`entity.save()`がシンタックスエラーを返しました。

* ACI0104276 クライアント/サーバー版のみ。`On Startup`にブレークポイントをセットし，クライアントでデザインモードに移行しようとした場合，空のメソッドエディターウィンドウが表示され，デッドロック状態に陥ることがありました。旧式ネットワークレイヤーで問題が発生します。

**注記**: コード補完および診断ログはプリエンプティブプロセスを使用しており，旧式ネットワークレイヤーには対応していません。修正により，一部のコード補完（インタープロセス変数および未定義オブジェクトのメンバー
関数）および診断は旧式ネットワークレイヤーで無効化されるようになりました。

* ACI0104397 オブジェクトリテラルを`\`で複数行に分割した場合，先頭に記述したプロパティ名がプロセス変数としてトークナイズされ，シンタックスエラーを返しました。ACI0103903が修正されたことによる副作用です。

* ACI0104111 `1ECostBasis`のような変数名を宣言し，`+`または`-`演算子に続けて記述した場合，演算子が変数名の一部としてトークナイズされました。`1e`は指数標記の接頭辞であり，本来，変数名に使用するべきではありませんが，過去のバージョンでは変数名として認識されました。

* ACI0104384 OEMではない標準ライセンスを`Create deployment license`に渡した場合，無効な組み込みライセンスが発行されました。OEMライセンスでなければ，コマンドはエラーを返すべきです。

* ACI0104369 View Proスプレッドシートの数値型セルにユーロ通貨フォーマットを設定した場合，カンマとピリオドの使い方に間違いがありました。フランス語またはドイツ語ではカンマが小数点，ピリオドが桁区切りとなるべきです。

* ACI0104138 ループ処理で`VP PASTE FROM OBJECT`を実行した場合，メモリが大幅に消費されました。`VP MOVE CELLS`も同じ問題を抱えています。

* ACI0104352 チェコ語版のみ。アプリケーション起動時にエラーが表示されました。ローカライズ設定に不正なJSONがあるためです。

* ACI0104370 *WebAdmin* は空いているポート番号（デフォルトは`7080`および`7443`）を自動的にインクリメントしますが，`WebServer`のプロパティが動的に更新されないため，デザインモードから起動したデータエクスプローラーは常にデフォルトのURLにアクセスしました。

* ACI0104367 Windows版のみ。Windows 11 23H2で無効なプリンター名を指定し，`SET CURRENT PRINTER`を実行した場合，アプリケーションがクラッシュする恐れがありました。

* ACI0104133 プロジェクトモードのストラクチャ設定でデフォルトユーザー設定を変更した場合，*directory.json* が更新されませんでした。クライアントでは問題ありません。サーバーまたはシングルユーザーモードのストラクチャ設定に問題があります。

* ACI0104348 データソースに時間型が設定された入力オブジェクトにフォーカスを移動した場合，`00:00:00`と表示されました。ACI0104214が修正されたことによる副作用です。

* ACI0104271 *4D Server* ライセンスの有効性をチェックするリクエストが`5`秒間隔でサーバーに送信されました。*4D Team Developer Professional* ライセンスでは問題ありません。ライセンスはクライアントがサーバーに接続したタイミングでチェックすれば良いはずです。

* ACI0104332 `COPY BLOB`でBLOB自体のデータを上書きコピーした場合，*malloc* 保護またはページヒープによるメモリ違反が発生し，アプリケーションがクラッシュしました。

* ACI0104253 自動行高が設定されたエンティティセレクションまたはコレクション型リストボックスに大量のデータを表示した場合，スクロールができませんでした。ACI0103946が修正されたことによる副作用です。

* ACI0104248 QUICレイヤーのみ。アプリケーションをタスクバーまたはDockに移動し，`5`分間，Keep-Alive以外のネットワークアクティビティがない状態を作り出した場合，大量の *ping* フレームがサーバーに送信されました。`15`秒間隔で送信されるべきです。

* ACI0104308 コンパイルモードのみ。`FORM GET NAMES`がエラーを返しました。

* ACI0104338 メンバー関数のパラメーターリストにカーソルを移動した場合，コードエディターのステータスバーにメンバー関数のパラメーターリストが表示されませんでした。

* ACI0104285 配列のサイズ宣言に`Size of array`およびタイプの異なる配列名を記述した場合，ヘルプTipsに間違った配列タイプが表示されました。

* ACI0104327 配列の要素に対するポインターの逆参照をエンティティの属性に代入しようとした場合，シンタックスエラーが返されました。

* ACI0104307 [`4D.SystemWorker`](https://developer.4d.com/docs/ja/API/SystemWorkerClass/)のコンストラクターに渡す *options* オブジェクトのプロパティを計算属性として定義した場合，ランゲージコンテキストが不足しているというエラーが返されました。

* ACI0104289 Windows版のみ。`OBJECT GET BEST SIZE`をテキストオブジェクトに対して使用した場合，正しい値が返されませんでした。

* ACI0104287 Windows版のみ。`CONFIRM`または`ALERT`のテキストが途切れて表示されることがありました。ACI0104289が関係しています。

* ACI0104284 空のジャーナルを`LOG FILE TO JSON`でテキストファイルに変換した場合，`[]`ではなく`[`という内容が出力されました。

* ACI0104228 デザインモードの「変数名…を以下の名称に変更」ダイアログにはチェックボックスがありますが，そのタイトルが「-- set by C code --」となっていました。

* ACI0104211 プラグインSDKのエントリーポイント経由でピクチャ配列にアクセスした場合，メモリ違反でアプリケーションが終了することがありました。

* ACI0104329 `FileHandle.readText()`でUTF-8エンコーディングのテキストファイルを読み込んだ場合，バイトオーダーマーク（BOM）が除外されず，それが原因で`JSON Parse`がエラーを返しました。

* ACI0104015 空白を含む定数をオブジェクトリテラルに記述した場合，ワードがプロセス変数として解釈されました。

* ACI0104290 ビット`4` (`16`) を指定せずに *Current process debug log* を有効化した場合，プラグインコマンドの呼び出しでアプリケーションがクラッシュしました。さきに全プロセスのデバッグログを有効化していれば問題ありません。

* ACI0104129 Write Proツールでテキストの前面に表示されたアンカー画像のフォーミュラ（オブジェクト記法で記述）を変更することができませんでした。

**注記**: 修正に伴い，[Formula from string](https://developer.4d.com/docs/ja/API/FunctionClass/#formula-from-string)のシンタックスが拡張されました。新しいシンタックスにより，コンポーネントからホストデータベースのコンテキストでフォーミュラを評価することができます。

* ACI0104310 Mac版のみ。*Movable form dialog box* タイプのウィンドウにサイズ固定のフォームを表示した場合，タイトルバーに閉じるボタンが表示されませんでした。

* ACI0104251 *keep-alive* オプションを有効にして`HTTP Request`を実行し，HTTPステータスコード`204`が空のボディとともに返された場合，レスポンス処理に`2`分近くを要しました。自動的に`Content-Length`ヘッダーを追加するプロキシサーバーなどが間に介在すれば問題ありません。

* ACI0104286 Windows版のみ。`CONFIRM`ダイアログのキャンセルボタンにデフォルトでフォーカスが設定されていました。

* ACI0104300 ビルド288506以降でショートカット設定を操作するとエラーが返されました。

* ACI0104295 `4D.Filehandle.readLine()`で改行を含まないファイルの読み込みを試みた場合，空の文字列が返されました。

* ACI0104302 `File.open("write")`を実行した場合，返された`4D.FileHandle`の`eof`プロパティが`True`を返しました。

* ACI0104270 `FileHandle.readLine()`が先頭行をスキップしました。仕様が見直され，オフセットの開始値が`0`に変更されたことによる副作用です。

* ACI0104208 `4D.FileHandle.readText()`でファイルの終わりを超えて読み込みを試みた場合，*undefined* が返されました。

* ACI0104207 `4D.FileHandle.readBlob()`に無効なオフセットを渡して読み込みを試みた場合，*undefined* が返されました。

* ACI0104206 `4D.FileHandle.readBlob()`でファイルの終わりを超えて読み込みを試みた場合，*undefined* が返されました。

* ACI0104205 `4D.FileHandle.readText()`のオフセット値を省略した場合，カレントのオフセット位置ではなく，ファイルの先頭からデータの読み込みを開始しました。

* ACI0104257 ツールボックスの選択タブのハイライト色が描画されませんでした。ユーザータブおよびグループタブは問題ありません。

* ACI0104204 `4D.FileHandle`のオフセットが`0`ではなく`1`から始まりました。

* ACI0104250 QUICネットワークレイヤーのみ。サーバー管理画面のアプリケーションサーバーページにTLSが無効と表示されました。QUICは常にTLS接続なので，有効と表示されるべきです。

* ACI0104273 印刷ジョブを実行中のプロセスをアボートした場合，内部的なフラグが解除されず，アボートしたプロセスと同じ番号のプロセス以外で印刷を実行しようとすると，プリントマネージャーがデッドロックに陥りました。

* ACI0104223 `WebSocket`クライアントで暗号化されたデータが受信できないことがありました。
	
* ACI0104272 QodlyアプリケーションのWebフォームで参照したエンティティが解放されず，データベース終了時にCRONプロセスのクラッシュを引き起こす可能性がありました。

* ACI0104265 ウィンドウが最前面にない場合，デフォルトボタンが正しく描画されませんでした。

* ACI0104263 計算属性が評価中のエンティティを再起的に参照することにより，すでに解放されたオブジェクトを含む参照を返し，アプリケーションがクラッシュする恐れがありました。

* ACI0104187 `Get process activity`を実行している間に新規プロセスを起動してHTTPリクエストを実行した場合，アプリケーションがクラッシュする可能性がありました。

* ACI0103939 ボタンとリンクされたポップアップメニューの間に区切りが表示されませんでした。