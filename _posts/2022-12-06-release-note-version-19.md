---
layout: fix
title: "4D v19.5 Hotfix 1 修正リスト"
date: 2023-01-04 08:00:00
categories: 修正リスト
tags: 19.5 hotfix
build: 284278
version: "19.5" 
permalink: /341/:slug/
---

* ACI0103595 プロジェクトを開かずに*WebAdmin* を起動している4Dに対してRESTリクエストを送信した場合，アプリケーションがクラッシュすることがありました。

* ACI0102704 メソッドエディターで`Is table number valid`コマンドを選択し，*F1* キーまたは`command`+`K`を入力した場合，間違ったドキュメントのページにジャンプしました。リダイレクトが正しく機能していないようです。

* ACI0103462 Mac版のみ。システム環境設定の地域を英国，言語をオランダ語に設定し，日付フォーマット*Internal date short* を使用した場合，`DD-MM-YYYY`ではなく`DD/MM/YYYY`形式で日付が表示されました。
 
* ACI0103447 Mac版のみ。Retinaスクリーンとそうでないスクリーンを使用し，前者に表示したフォームを後者に移動してからリサイズした場合，四角オブジェクトが消滅しました。ACI0103572と同じ問題です。

* ACI0103360 クイックレポートでクロスタブレポートを印刷した場合，左側の罫線の幅が半分欠けて出力されました。特定のプリンター（例：Brother 2710DW, HP Color Laser MFP 178nw）で問題が再現します。

* ACI0103578 Windows版のみ。ローカルクライアントをサーバーに接続し，インタープリターモードとコンパイルモード何度も切り替えた場合，クライアントがクラッシュすることがありました。旧式ネットワークレイヤーでは問題ありません。

* ACI0103542 Mac版のみ。Apple Siliconターゲットに対してコンパイルされたコンポーネントメソッドの「サーバー上で実行」メソッドプロパティが無視されました。

* ACI0103499 コンパイルパスを「すべて定義する」に設定した場合，パラメーター型の間接指定（`${2}`）のシンボルが宣言したタイプではなく，`C_VARIANT`としてシンボルファイルに出力されました。シンボルファイルの問題であり，生成されるコードは間違っていません。

* ACI0103575 Windows版のみ。Window 10 1703以前でフォームを開いた場合，アプリケーションがクラッシュしました。

* ACI0103572 Mac版のみ。第二スクリーンにフォームを移動した場合，サブフォーム内の四角オブジェクトが消滅することがありました。

* ACI0103573 Windows版のみ。`PRINT SETTINGS`でプリント設定ダイアログを表示した場合，アプリケーションがクラッシュすることがありました。

* ACI0103562 バイナリモードのみ。ハイライトボタンを3Dボタンに変更した場合，キーボードショートカットの設定がクリアされました。

* ACI0103560 Write Proドキュメントに`WP Add picture`で複数の画像を挿入し，`WP SET ATTRIBUTES`で`wk anchor layout`属性を`wk in front of text`に設定した場合，画像がテキストの前面ではなく，背面に表示されました。

* ACI0103556 オブジェクト配列の要素に`Null`を代入した場合，ランタイムエラーが返されました。

* ACI0103487 クライアント/サーバー版のみ。ORDAでアクセスしたBLOB属性を変数に代入しようとした場合，「ストリームの終端を超えた読み込みを行おうとしました」エラーが返されました。すでに圧縮されているBLOBをさらにgzip形式で圧縮した場合に問題が再現します。

* ACI0103436 バイナリモードのみ。`OBJECT SET ENABLED`でスタティックテキストオブジェクトを*disabled* に設定した場合，フォントカラーが「自動」に設定されたテキストオブジェクトがグレーアウト表示されました。

* ACI0103555 スペイン語またはポルトガル語版のWindowsでは，ビルドしたアプリケーションのプロダクト名が4D Volume Desktopに設定されました。結果として*AppData* の*Roaming* フォルダーに作成される「4Dフォルダー」が実行ファイル名ではなく4D Volume Desktopになりました。

* ACI0103514 フォームエディターでスタティックピクチャをペーストまたは複製した場合，重複するオブジェクト名が発行され，既存のスタティックピクチャが失われる可能性がありました。

* ACI0103519 プロジェクトモードのみ。`Scaled to fit proportional`または`Scaled to fit prop centered`が設定されたリストボックスのピクチャ列に対して`OBJECT Get format`を使用した場合，空の文字列が返されました。

* ACI0103419 リストボックスの自動行高さプロパティを有効にした場合，` lk auto row height`を`lk no`に戻すことができませんでした。

* ACI0103492 フォームエディターで下から上または右から左に描画された線オブジェクトを選択することができませんでした。

* ACI0103507 クエリにインデックスクエリとシーケンシャルクエリの両方が含まれている場合，順序によって速度に大幅な違いが発生することがありました。たとえば下記のコードはまったく同じクエリ条件ですが，先にインデックスクエリを実行してから明示的にシーケンシャルクエリを実行する前者のほうが半分の時間で完了します。

* ACI0103524 オブジェクト型フィールドに対し，`Not`条件でインデックスクエリを実行した場合の結果が正しくありませんでした。`null`はどの値にも合致しないので，「Not(attribute = parameter)」クエリに含まれるべきです。シーケンシャルクエリであれば問題ありません。

* ACI0103538 スケーラブルセッション管理と最大同時Webプロセス数が設定されている場合，RESTサーバーが`401`エラーを返すことがありました。

**注記**: 修正前は*On REST Authentication* データベースイベントを実行するためにWebプロセスを作成していました。修正により，ランゲージコンテキストを有するセッションのプロセスが起動されている場合，そのプロセスで*On REST Authentication* を実行するようになりました。最大同時Webプロセス数の制約を受けないだけでなく，処理時間も短縮されました。
