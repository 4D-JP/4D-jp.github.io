---
layout: fix
title: "4D v20r3 Hotfix 1 修正リスト"
date: 2024-02-05 08:00:00
categories: 修正リスト
tags: 20r3 hotfix
build: 100328
version: "20r3"
permalink: /2024/36/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0103977 自動セッション管理を無効にした場合，RESTアクセスのたびにエラースタックがおおきくなりました。

* ACI0104402 `4D.HTTPRequest`にオブジェクト型のメモリーリークがありました。

* ACI0104415 Windows版のみ。複数のモニターが接続されている環境で最大化されたSDIモードのウィンドウを最小化し，タスクバーのアイコンをクリックして復元した場合，元のディスプレイにウィンドウが表示されませんでした。

* ACI0104444 `var`シンタックスで複数の変数名と序数引数をまとめて宣言している場合，ローカル変数の再宣言に関するシンタックスチェックの警告メッセージに間違った変数名またはパラメーター名が表示されました。

* ACI0104445 Mac版のみ。アプリケーションビルドキーの*ServerEmbedsProjectDirectoryFile* を使用した場合，*directory.json* ファイルが非表示ファイルとしてコピーされました。

* ACI0104454 Windows版のみ。ポップアップ/ドロップダウンメニューをフォーカス可・タブ移動可に設定した場合，矢印キーで区切り線（`-`）を選択することができました。

* ACI0104478 Intelコンパイルモードのみ。BLOBのインデックス添字にBlob sizeぴったり（つまり`1`バイトオーバー）の位置を渡した場合，範囲チェックが働きませんでした。バッファーオーバーフローにより，アプリケーションがクラッシュする恐れがあります。ARMコンパイラーでは問題ありません。

* ACI0104500 クラスが存在しないプロジェクトを「コンパイル時にコード補完用のシンタックスファイルを生成する」を有効にしてコンパイルした場合，アプリケーションがクラッシュしました。

* ACI0104516 *shift* キーを押しながらサーバー管理画面（プロセスページ）のスプリッターを縦に移動した場合，内部エラーが返されました。

* ACI0104523 `&&`または`||`演算子で結合したリレーション属性のクエリ条件が評価されませんでした。v20.1では問題ありません。

* ACI0104543 期限を過ぎたライセンスが存在する場合，ライセンスマネージャーの更新ボタンがクリックできませんでした。

* ACI0104480 ドイツ語版のみ。設定画面のドキュメントURLが正しくありませんでした。ドイツ語のドキュメントは公開されていないので，英語版と同じ *https://developer.4d.com/docs/Preferences/overview* を開くべきです。

* ACI0104503 *WebAdmin* のポートからリクエストを受信した場合でも*On REST Authentication* データベースメソッドが実行されました。

* ACI0104485 */$lib/studio* にアクセスしても，*WEBJS/studio* のファイルが返されませんでした。REST APIをコールした後であれば問題ありません。