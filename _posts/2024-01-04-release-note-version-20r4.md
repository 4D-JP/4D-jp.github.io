---
layout: fix
title: "4D v20r4 修正リスト"
date: 2024-01-29 08:00:00
categories: 修正リスト
tags: 20r4
build: 100150
version: "20r4"
permalink: /2024/4/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104480 ドイツ語版のみ。設定画面のドキュメントURLが正しくありませんでした。ドイツ語のドキュメントは公開されていないので，英語版と同じ *https://developer.4d.com/docs/Preferences/overview* を開くべきです。

* ACI0104523 `&&`または`||`演算子で結合したリレーション属性のクエリ条件が評価されませんでした。v20.1では問題ありません。

* ACI0104520 4D View Proのフォーミュラエディターパネルが正しく動作しませんでした。

* ACI0104516 *shift* キーを押しながらサーバー管理画面（プロセスページ）のスプリッターを縦に移動した場合，内部エラーが返されました。

* ACI0104513 「自動行高」プロパティが有効にされているエンティティセレクション型のリストボックスに表示されているエンティティセレクションを変更した場合，正しい高さで行が表示されませんでした。ウィンドウをリサイズすると，正しい高さで行が再描画されます。

* ACI0104503 *WebAdmin* のポートからリクエストを受信した場合でも*On REST Authentication* データベースメソッドが実行されました。

**注記**: 修正により，ホストではなくコンポーネントの*On REST Authentication* データベースメソッドが実行されるようになりました。

* ACI0104452 クイックレポートのフィールドタイトルを編集中に*escape* キーを入力した場合，エラー`9850`が返されました。

**注記**: リストボックスのセル入力確定前にフォームをアンロードした場合のイベントサイクルに問題がありました。入力エリアでは問題ありません。

* ACI0103597 ドイツ語版またはスペイン語版では`VP REMOVE COLUMNS`が正しく動作しませんでした。

**注記**: SpreadJS 16.2.0で問題が修正されました。

* ACI0103977 自動セッション管理を無効にした場合，RESTアクセスのたびにエラースタックがおおきくなりました。

* ACI0104402 `4D.HTTPRequest`にオブジェクト型のメモリーリークがありました。

* ACI0104478 Intelコンパイルモードのみ。BLOBのインデックス添字にBlob sizeぴったり（つまり`1`バイトオーバー）の位置を渡した場合，範囲チェックが働きませんでした。バッファーオーバーフローにより，アプリケーションがクラッシュする恐れがあります。ARMコンパイラーでは問題ありません。

* ACI0104472 メンテナンス＆セキュリティセンターのアクティビティログの日付フォーマットが正しくありませんでした。`2023-12-21`と出力されるべきところが`12--0021`のように出力されます。

* ACI0104446 Mac版のみ。共有フォルダー内のファイルやフォルダーに対し，`File.rename()`や`Folder.rename()`を使用した場合，「Operation not supported」というPOSIXエラーが返されました。ターミナルで`mv`コマンドを使用すればリネームできるので，アクセス権限の問題ではありません。

**注記**: 4Dは内部的に`renamex_np`をコールしています。修正により，エラー`45`（option not supported by network share）が返された場合，`RENAME_EXLC`を[指定せずに](https://developer.apple.com/documentation/foundation/nsurlvolumesupportsexclusiverenamingkey)リネームを再試行するようになりました。

* ACI0104510 データファイルのサイズ増加に伴い，レコードの保存に要する時間が長くなりました。たとえば`0`GBのデータファイルであれば`10`秒間に約`110,000`件のレコードが作成できるのに対し，`100`GBでは約`42,000`件，`1100`GB（`1.1`TB）では約`6,000`件のレコードしか作成できませんでした。

* ACI0104497 外部プロジェクトに公開オプションの「Webサービス」が有効にされたメソッドが存在する場合，`Compile project`がエラーを返しました。

* ACI0104462 * /RESOURCES/en.lproj* に *syntaxEN.json* が存在する場合，「コンパイル時にコード補完用のシンタックスファイルを生成する」を無効にして再コンパイルしてもファイルが削除されませんでした。

* ACI0104444 `var`シンタックスで複数の変数名と序数引数をまとめて宣言している場合，ローカル変数の再宣言に関するシンタックスチェックの警告メッセージに間違った変数名またはパラメーター名が表示されました。

* ACI0104435 フィールド属性の「必須入力」はプロジェクトモードで廃止されており，ストラクチャエディターのプロパティリストからも項目が削除されていますが，ストラクチャをプロジェクトに変換した場合，`.4DCatalog* ファイルには`mandatory`属性が残され，変換ログにも警告やエラーが出力されませんでした。変換後，当該フィールドを未入力のまま保存するとデータベースエラーが返されます。

**注記**: 修正により，変換ログに下記のエラーが出力されるようになりました。

> "No longer supported 'mandatory' attribute in project found on field '<Field name>' of table '<Table name>'. Please use instead 'Reject NULL value input' (or 'Map NULL values to blank values')"

* ACI0104415 Windows版のみ。複数のモニターが接続されている環境で最大化されたSDIモードのウィンドウを最小化し，タスクバーのアイコンをクリックして復元した場合，元のディスプレイにウィンドウが表示されませんでした。

* ACI0104506 ベベルスタイルのボタンのポップアップメニューをリンクに設定した場合，*.4DForm* ファイルにはフォームイベントの *On Alternate Click* に相当するプロパティが追加されますが，フォームエディターのプロパティリストにはイベント名が表示されませんでした。

* ACI0104499 QUICネットワークレイヤーのみ。ビルド版のクライアントからサーバーに接続しようとした場合，ストラクチャを開くことができない，というエラーが表示されることがありました。特定の変数が正しく初期されていないことが関係しています。

* ACI0104487 *raw* フォーマットのアイテムが`1`個だけ存在する場合，`NetKit.GoogleMailIdList.getMailIds()`が`null`を返しました。*minimal* フォーマットでは問題ありません。

* ACI0104468 ピクチャポップアップメニューのデータソースに`Form`を使用することができませんでした。

* ACI0104433 *.docx* 形式または*.pdf* 形式でWrite Proドキュメントをエクスポートした場合，ソフトハイフンが標準のハイフンに変換されました。

* ACI0104504 メンテナンス＆セキュリティセンター，ツールバー，ライセンス更新などのダイアログのアイコンのタイトルが途切れて表示されました。

* ACI0104490 データクラスに計算属性が存在する場合，フォームエディターのリストボックスビルダーがエラーを返しました。

* ACI0104486 Mac版プロジェクトモードのみ。ツールボックスのヘルプTipsのテキストエリアがダークモードに対応していませんでした。白色の文字が明るい黄色の背景色に表示されます。

* ACI0104485 */$lib/studio* にアクセスしても，*WEBJS/studio* のファイルが返されませんでした。REST APIをコールした後であれば問題ありません。

* ACI0104450 Write Proインタフェースのドロップダウンメニューでフォントを選択した場合，ポップアップの選択項目が変更前のフォント名に戻りました。

* ACI0104445 Mac版のみ。アプリケーションビルドキーの*ServerEmbedsProjectDirectoryFile* を使用した場合，*directory.json* ファイルが非表示ファイルとしてコピーされました。

* ACI0103660 `IMPORT DATA`で読み込みダイアログを開いた場合，テーブルを選択することができませんでした。ファイルメニューからダイアログを起動した場合は問題ありません。

* ACI0104203 プロジェクトモードのみ。ボタンがフォーカスされた状態で`WA OPEN WEB INSPECTOR`を実行した場合，アプリケーションがクラッシュしました。Webエリアがフォーカスされていれば問題ありません。

* ACI0104401 Write Proドキュメントの末尾に段落あるいは行以外のブレークを削除することができませんでした。

* ACI0104386 アプリケーションをビルドした場合，QodlyのWebフォームが表示されませんでした。`PackProject`を`True`に設定し，プロジェクトフォルダーを*.4DZ* 形式に圧縮しなければ問題ありません。

* ACI0104216 `VP IMPORT FROM OBJECT`を実行した場合，メモリーリークが発生しました。*CefProcessHandler* が`15`GBを超えるRAMを占有することがあります。

**注記**: SpreadJS 16.0.xの問題でした。問題は16.2.4で修正されています。

* ACI0104471 `TEXT TO BLOB`に空の文字列を渡した場合，結果が正しくありませんでした。`1`バイトのデータが返されました。