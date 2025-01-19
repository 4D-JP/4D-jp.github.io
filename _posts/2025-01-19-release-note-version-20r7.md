---
layout: fix
title: "4D 20r7 修正リスト"
date: 2025-01-19 08:00:00
categories: 修正リスト
tags: 20r7
build: 100311
version: "20r7"
permalink: /2025/19/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104856 Write Proドキュメントにセルのマージされたテーブルが表示されている場合，水平ルーラーの左マーカーが間違った位置に表示されました。

* ACI0104816 Write Proドキュメントのテーブルの後に改行コードが存在する場合，`WP Get elements`と`wk type table`で取得したテキストに余計な改行コードが含まれました。

**注記**: `WP Get elements`ではなく`WP INSERT DOCUMENT`が修正されました。

* ACI0105319 ビルド版サーバーアプリケーションの「ウィンドウ」メニューに「プロジェクト依存関係」が表示されました。*Info.plist* ファイルに`com.4D.HidePackageManagerMenuItem`を追加すれば，回避することができます。

* ACI0105308 フランス語版のみ。ようこそ画面のフランス語が正しくありませんでした。*Ouvrir ou Créer un projet d'application* の"C"は小文字で表記するべきです。

* ACI0105295 クライアント/サーバー版のみ。サーバー側で特定のキーボードショートカットを設定することができませんでした。`escape` `tab` `backspace` `return` `space` および矢印キーが認識されません。

**注記**: リソースのXLIFFファイル（*ToolBox__.xlf* ）に問題がありました。
* ACI0105251 コンポーネントから関連メニューバーの設定されたフォームを表示した場合，アプリケーションのメニューバーが切り替わりませんでした。

* ACI0105230 目的の値よりも前に`null`が出現する場合，コレクション型プロパティに対するクエリがエンティティを返しませんでした。つまり，コレクション型プロパティの値が`["Value";Null]`であれば，`attr.col[] in :1`クエリでエンティティをクエリできますが，`[Null;"Value"]`では，クエリできませんでした。

**注記**: 修正に伴い，ブール型フィールドに対するシーケンシャルクエリの不具合も是正されました。ブール型フィールドの値が`Null`の場合，`NOT(boolField IS NOT True)`がヒットするようになりました。

* ACI0105135 計算属性のORDAクエリに[名前付き引数](https://developer.4d.com/docs/ja/Concepts/parameters#オブジェクトプロパティを名前付き引数として使用する)を使用した場合，[`Function query`](https://developer.4d.com/docs/ja/ORDA/ordaClasses#function-query-attributename)にパラメーター値が渡されませんでした。プレースホルダーを使用すれば問題ありません。

* ACI0104743 コンポーネントのクラス名をエクスプローラーで編集することができました。入力を確定すると，エラーメッセージが表示され，クラス名が復元されます。

* ACI0104609 クライアント/サーバー版のみ。プロジェクトメソッドまたはクラス関数を文字列で渡した場合，`entitySelection.orderByFormula()`がエラーを返しました。`Formula from string`で文字列をフォーミュラに変換すれば問題ありません。