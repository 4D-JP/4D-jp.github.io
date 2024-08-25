---
layout: fix
title: "4D 20 修正リスト"
date: 2024-08-23 08:00:00
categories: 修正リスト
tags: "20.4"
build: 101438
version: "20.4"
permalink: /2024/214/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104993 クイックレポートエディターの背景色グラデーションの第１カラーと第２カラーを同じ値に設定した場合，入力が無視されました。

* ACI0105019 リレーション属性のクエリ条件を`OR`演算子で連結した場合，クエリプランが間違っていました。ACI0104799が修正されたことによる副作用のようです。

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

* ACI0104971 統合Webエリアでクロスドメインリソース共有をした場合，*Access-Control-Allow-Origin* ヘッダーに`*`が設定してもCORSエラーが返されました。

**注記**: CEFの*Access-Control-Request-Headers* に`accept-language`が含まれていることが関係しています。正しいキーワードは`accept_language`（ハイフンではなく[アンダースコア](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language)）です。