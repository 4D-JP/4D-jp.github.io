---
layout: fix
title: "4D 20 修正リスト"
date: 2025-01-15 08:00:00
categories: 修正リスト
tags: "20.5"
build: 101665
version: "20.5"
permalink: /2024/335/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105309 スケーラブルWebセッションと強制ログインモードが有効化されたアプリケーションの`/4DACTION/`リクエストから呼び出されたWebセッションで`Session.setPrivileges()`を使用した場合，セッションの権限が設定されませんでした。

* ACI0105308 フランス語版のみ。ようこそ画面のフランス語が正しくありませんでした。*Ouvrir ou Créer un projet d'application* の"C"は小文字で表記するべきです。

* ACI0104743 コンポーネントのクラス名をエクスプローラーで編集することができました。入力を確定すると，エラーメッセージが表示され，クラス名が復元されます。

* ACI0105345 Windows版のみ。クライアント側でWebサーバーを運用した場合，ネットワークエラーによってアプリケーションがクラッシュすることがありました。

**注記**: ネットワークエラー自体を回避することはできませんが，クラッシュを回避するための対策が施されました。

* ACI0105251 コンポーネントから関連メニューバーの設定されたフォームを表示した場合，アプリケーションのメニューバーが切り替わりませんでした。

* ACI0105135 計算属性のORDAクエリに[名前付き引数](https://developer.4d.com/docs/ja/Concepts/parameters#オブジェクトプロパティを名前付き引数として使用する)を使用した場合，[`Function query`](https://developer.4d.com/docs/ja/ORDA/ordaClasses#function-query-attributename)にパラメーター値が渡されませんでした。プレースホルダーを使用すれば問題ありません。

* ACI0105339 Windows版のみ。*On Web Authentication* データベースメソッドでデバッガを起動した場合，アプリケーションがフリーズしました。

* ACI0105298	`4D.WebSocketServer`で`wss:`プロトコルを使用した場合，WebSocketクライアント毎に`1`メッセージしか処理できませんでした。

* ACI0105292 Mac版のみ。新規プロセスでパレットウィンドウを表示した場合，両プロセスのダイアログにキーボード入力のフォーカスがセットされた状態になることがあり，その状態でテキストを入力すると，アプリケーションがクラッシュしました。

* ACI0104816 Write Proドキュメントのテーブルの後に改行コードが存在する場合，`WP Get elements`と`wk type table`で取得したテキストに余計な改行コードが含まれました。

**注記**: `WP Get elements`ではなく`WP INSERT DOCUMENT`が修正されました。

* ACI0103009 ピクチャ型フィールドのORDAクエリでキーワード演算子（`%`）とプレースホルダーを使用することができませんでした。

* ACI0105318 [`VP CREATE TABLE`](https://developer.4d.com/docs/ja/ViewPro/commands/vp-create-table)を実行した場合，`cs.TableColumns`は未知のクラスであるというエラーが返されました。

**注記**: ドキュメントの例題も[修正](https://github.com/doc4d/docs/commit/977aa62ee9e75d8876a13cf8161430337a89350e)されました。20r8ではクラス名が`TableColumns`ではなく`TableColumn`となります。20r7以前では，クラスを使わずに`New object`でオプションを渡してください。

* ACI0105295 クライアント/サーバー版のみ。サーバー側で特定のキーボードショートカットを設定することができませんでした。`escape` `tab` `backspace` `return` `space` および矢印キーが認識されません。

**注記**: リソースのXLIFFファイル（*ToolBox__.xlf* ）に問題がありました。

* ACI0105223 Mac版のみ。管理画面の「メンテナンス」タブのボタンタイトルがドイツ語とポルトガル語では正しく表示されませんでした。

* ACI0104913 インタープリターモードのみ。`Last errors()`がエラーを返しました。`Last errors`であれば問題ありません。

**注記**: 以下のコマンドは`()`をつけて呼び出すことができます。

	* `Current process name`
	* `Call chain`
	* `WEB Server list`
	* `Get group access`
	* `Form Get color scheme`
	* `Web progress`
	* `Last errors`
	* `Web event`
	* `Web form`
	
	以下のコマンドは`()`をつけて呼び出すことができません。
	
	* `True`
	* `False`

* ACI0104592 コンパイラーパスを「すべて定義させる」に設定し，三項演算の三項に文字列同士の比較演算（`<` `<=` `>` `>=` `=` `#`）を記述した場合，コンパイルエラーになりました。

* ACI0105230 目的の値よりも前に`null`が出現する場合，コレクション型プロパティに対するクエリがエンティティを返しませんでした。つまり，コレクション型プロパティの値が`["Value";Null]`であれば，`attr.col[] in :1`クエリでエンティティをクエリできますが，`[Null;"Value"]`では，クエリできませんでした。

**注記**: 修正に伴い，ブール型フィールドに対するシーケンシャルクエリの不具合も是正されました。ブール型フィールドの値が`Null`の場合，`NOT(boolField IS NOT True)`がヒットするようになりました。

* ACI0104609 クライアント/サーバー版のみ。プロジェクトメソッドまたはクラス関数を文字列で渡した場合，`entitySelection.orderByFormula()`がエラーを返しました。`Formula from string`で文字列をフォーミュラに変換すれば問題ありません。

* ACI0105287 Mac版のみ。`SET WINDOW RECT`でウィンドウを別のモニターに移動した場合，ウィンドウがフォーカスを失い，非アクティブになりました。ACI0099153が修正されたことによる副作用です。
