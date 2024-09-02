---
layout: fix
title: "4D 20 修正リスト"
date: 2024-08-31 08:00:00
categories: 修正リスト
tags: "20.4"
build: 101452
version: "20.4"
permalink: /2024/214/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105033 Windows版のみ。`4D.SystemWorker`で*QPDF* を起動した場合，外部プロセスが正常に終了しても`exitCode`プロパティが設定されませんでした。

**注記**: `0`または`1`以外のステータスコードが返された場合，プロセスがクラッシュしたものとみなされていました。

* ACI0105050 外部ファイルに保存したBLOBのパスにアクセスできない状態で「レコードの強制更新」モードのデータファイル圧縮を実行した場合，外部ファイルに保存したBLOBのパスがレコードから削除されました。

* ACI0105003 ピクチャ型の属性に対して[`entity.diff()`](https://developer.4d.com/docs/ja/API/EntityClass/#diff)を使用することができませんでした。

* ACI0105041 `SET AUTOMATIC RELATIONS(False; False)`で自動リレーションを無効化した後に項目選択が設定されたフィールドにワイルドカード値を入力した場合，リレーションフィールドの項目リストが表示されました。

* ACI0105023 Mac版のみ。最前面ではないウィンドウに表示された標準・ベベル・角の丸いベベル・OS X・ヘルプ・サークル・Officeスタイルボタンおよびチェックボックス・ラジオボタン・サーモメーター・スライダー・ポップアップメニュー・コンボボックス・タブコントロールがグレーアウト表示されました。期待されるのは，他のアプリと同じように，オブジェクトがグレーアウト表示されないことです。

* ACI0105014 バイナリモードのみ。フォームエディターでビュー名を変更することができませんでした。

* ACI0104976 Mac版のみ。スプラッシュスクリーンがダークモードに対応していませんでした。[`_dark`](https://developer.4d.com/docs/ja/FormEditor/pictures/#ダークモード-macos-のみ)接尾辞が追加されたリソース画像ファイルが無視されました。

* ACI0104968 クイックレポートでブール型フィールドに設定したフォーマットが出力に反映されませんでした。

* ACI0104993 クイックレポートエディターの背景色グラデーションの第１カラーと第２カラーを同じ値に設定した場合，入力が無視されました。

* ACI0105019 リレーション属性のクエリ条件を`OR`演算子で連結した場合，クエリプランが間違っていました。ACI0104799が修正されたことによる副作用です。

```4d
$oQuerySettings:=New object("parameters"; New object; "args"; New object; "queryPath"; True; "queryPlan"; True)
$tQueryString:="(r_toPanel.isAP = true) AND (r_toOrdPanelExtra.reportStatus != 3 OR done = false)"
$oQueryResults:=ds.ordPanel.query($tQueryString; $oQuerySettings)
```

* ACI0104990 Write Proエリアのツールバーにフォントサイズの小数が表示されませんでした。

* ACI0105006 `4D.HTTPRequest`がタイムアウトに到達し，完全なレスポンスが返されなかった場合，アプリケーションがクラッシュすることがありました。

* ACI0104304 `#4DIF`タグの条件式の後にスペース記号を入力した場合，`PROCESS 4D TAGS`が余分な文字列を返しました。`-->`の文字数がハードコーディングされているようです。

* ACI0104966 計算属性が定義されたクラスのインスタンスをHTTPリクエストで送信した場合，ランゲージコンテキストが不足しているという` -10754`シンタックスエラーが返されました。

* ACI0104996 Mac版バイナリモードのみ。システム言語に応じてスタイルシートのシステムフォント名がローカライズされました。

* ACI0104858 4Dのバージョンやビルドアプリケーション名に関係なく，同じ*CEF_cache* が常に使用されているため，統合Webエリアに表示したHTMLアプリケーションが正しく動作しないことがありました。

**注記**: キャッシュの`max_age`が`5`分に設定されました。

* ACI0104971 統合Webエリアでクロスドメインリソース共有をした場合，*Access-Control-Allow-Origin* ヘッダーに`*`を設定してもCORSエラーが返されました。

**注記**: CEFの*Access-Control-Request-Headers* に`accept-language`が含まれていることが関係しています。正しいキーワードは`accept_language`（ハイフンではなく[アンダースコア](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language)）です。