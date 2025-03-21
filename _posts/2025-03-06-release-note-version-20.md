---
layout: fix
title: "4D 20 修正リスト"
date: 2025-03-20 08:00:00
categories: 修正リスト
tags: "20.6"
build: 101770
version: "20.6"
permalink: /2025/66/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105496 Windows版のみ。リストボックスの選択行に組み込まれたコンボボックスの表示が正しくありませんでした。ハイライト行は濃いブルーで表示されているのに，タイトル文字がブラックで表示されるため，判読が困難でした。

* ACI0105427 バイナリモードで設定したフォームオブジェクトの「必須入力」プロパティは，プロジェクト変換時に解除されますが，影響を受けたフォームオブジェクトの情報が変換ログに記録されませんでした。

* ACI0105495 `4D.HTTPRequest.new()`のオプションに渡された`Accept-Encoding`ヘッダーが無視され，常に`gzip, deflate`が送信されました。`HTTP Request`コマンドであればヘッダーをカスタマイズすることができます。

* ACI0105500 ライセンス画面に表示されるWebライセンスの名称が商品名と合っていませんでした。

|旧称|変更後|
|:-:|:-:|
|4D Web Server|4D Web Application|
|4D Web Server - Local|4D Web Application - Local|
|4D Web Server - 1 Connection|4D Web Application - 1 Connection|
|4D Web Server for 4D Client|4D Web Application for 4D Client|
|4D WebServices Server|4D Web Services|
|4D WebServices Server - Local |4D Web Services - Local|
|4D WebServices Server - 1 Connection|4D Web Services - 1 Connection|

* ACI0105459 macOS Sonomaのみ。ウィンドウがフォーカスされていない時のデフォルトボタンのタイトルカラーが正しくありませんでした，

* ACI0105482 列のスタイルでアンダーラインが設定されているセルのアンダーラインをリボンツールで除去した場合，`VP Convert to picture`で出力した画像にセルの正しいスタイルが反映されませんでした。JSONレベルではセルのスタイルが`textDecoration: null`に正しく変更されていますが，間違って列のスタイルを継承していることが原因です。

* ACI0105481 列のスタイルで前景色が設定されているセルの前景色をリボンツールで除去した場合，`VP Convert to picture`で出力した画像にセルの正しいスタイルが反映されませんでした。JSONレベルではセルのスタイルが`forecolor: ""`に正しく変更されていますが，間違って列のスタイルを継承していることが原因です。

* ACI0105474 フランス語版のみ。ピクチャがみつからないときに表示されるエラーメッセージのローカライズが正しくありませんでした。英語とフランス語が混ざったメッセージ（"il manque a picture"）が表示されます。

* ACI0105411 すでに削除したリストの対して`OBJECT SET LIST BY REFERENCE`を使用した場合，アプリケーションがクラッシュしました。

* ACI0105476 データファイルの外にピクチャ型またはBLOB型のフィールドを保存できなかった場合，アプリケーションがクラッシュしました。ACI0105050が修正されたことによる副作用のようです。

* ACI0105472 `VP Convert from 4D View`で大量の4D ViewスプレッドシートをView Proに変換したり，`VP IMPORT FROM OBJECT`でオブジェクトから展開した場合，かなりの時間がかかりました）。

* ACI0105467 View Proエリアのツールバーまたはリボンで罫線を除去することができませんでした。

**注記**: [SpreadJS `16.2.6`の不具合](https://developer.mescius.com/spreadjs/docs/rnotes/release-notes-for-version-1700)です。SpreadJSをアップデートする代わりにJavaScriptをパッチすることで問題が修正されました。

* ACI0105434 クイックレポートのステータスエディターに同じＮ対１リレーションフィールドが繰り返し表示されました。

* ACI0105463 サーバー管理画面を閉じた後に再び表示した場合，「モニター」ページにハードドライブの情報が表示されませんでした。

* ACI0104382 指定したパスの`4D.WebSocket`オブジェクトがすでに存在し，`terminated`プロパティが`True`ではなかった場合，新しい`4D.WebSocket`オブジェクトは作成されずにエラーが返されますが，同時に既存の`4D.WebSocket`オブジェクトがクリアされました。

* ACI0105300 Windows版のみ。クライアント自動アップデート中に*update.win.4darchive* ファイルが書き換わりました。ACI0104623が修正されたことによる副作用のようです。
