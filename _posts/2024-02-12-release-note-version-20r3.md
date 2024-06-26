---
layout: fix
title: "4D 20r3 Hotfix 2 修正リスト"
date: 2024-03-26 08:00:00
categories: 修正リスト
tags: 20r3 hotfix
build: 100359
version: "20r3"
permalink: /2024/43/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104621 「格納場所」が「データファイルの外」かつ「ヌル値を空値にマップ」が設定されたBLOB型フィールドにデータを代入した場合，MSCのデータ検証で無効なデータフィールドサイズが検出されました。

* ACI0104692 「格納場所」が「データファイルの外」かつ「内部ストレージの最大バイト」が`0`以外に設定されたBLOB型フィールドに最大バイトを下回るサイズのデータを代入した場合，データファイルに保存されませんでした。ACI0104621が修正されたことによる副作用のようです。

* ACI0104618 `.certificatesFolder`プロパティに`4D.Folder`オブジェクトを設定して`4D.HTTPRequest`を使用した場合，アプリケーションがクラッシュしました。パス文字列を設定すれば問題ありません。

**注記**: 全般的なメモリーリークを解消するための修正（ACI0104402）が関係していました。

* ACI0104599 `Create deployment license`にスタンドアロン版のライセンス（`4UUD`または`4UOE`）を渡した場合，エラーが返されました。ACI0104384が修正されたことによる副作用のようです。

* ACI0104567 *NetKit* コンポーネントの*OAuth* オブジェクトを`JMAP`または`MIME`メール形式でインスタンス化した場合，メールのフラグを既読/未読に設定することができませんでした。`Microsoft`メール形式であれば問題ありません。

**注記**: メッセージの更新をサポートしているのは`Microsoft`メール形式だけです。修正により，必要に応じてメッセージ形式が一時的に変換されるようになりました。

* ACI0104562 メソッドエディターのコンテキストメニューでローカル変数の名称を変更した場合，複数行にわたって記述されたコードに看過されることがありました。

* ACI0104558 フォームに２個の統合Webエリアを配置し，`WA SET PAGE CONTENT`で空のページを表示しようとした場合，アプリケーションがクラッシュしました。URLを`about:blank`に設定すれば問題ありません。いずれかのWebエリアをシステム版に変更すれば問題ありません。

* ACI0104341 ORDAの`entity.clone()`を実行した場合，エンティティがロックされました。

* ACI0104533 *Client Web Application Expansion* ライセンスがインストールされていないクライアントで*NetKit* を使用することができませんでした。4D 20 LTSでは問題ありません。
