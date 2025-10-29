---
layout: fix
title: "4D 20r10 修正リスト"
date: 2025-10-28 08:00:00
categories: 修正リスト
tags: 20r10
build: 100275
version: "20r10"
permalink: /2025/284/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105877 エクスプローラーで複製したクラスをごみ箱に移動してから再び複製した場合，複製したクラスとごみ箱にあったクラスの両方が「ホーム」タブに表示されました。

* ACI0105975 「アプリケーションについて」画面のリンク（法的な情報・著作権・世界の4D）が間違っていました。ホームページではなく，[世界中の4D](https://jp.4d.com/4d-around-the-world)にジャンプするべきです。

* ACI0105955 コンポーネントをビルドした場合，Appleの公証に必要な`CFBundlePackageType`キー（値: `BNDL`）が*Info.plist* ファイルに書き込まれませんでした。

**注記**: アプリケーション本体のビルドコマンドに加え，*Build4D* コンポーネントも[修正](https://github.com/4d/Build4D/commit/29d30e312e04302f2ba4c2141025f0778536bad2)されました。

* ACI0105908 `Choose`コマンドの引数としてクラスのプロパティを記述した場合，メソッドエディターのヘルプTipsに間違った型が表示されました。

* ACI0105901 エクスプローラーでテーブルを選択した場合，すぐにプレビューが表示されませんでした。エクスプローラーのウィンドウを背面に移動してから再び最前面に移動すれば，プレビューが表示されます。

* ACI0105850 メールに特定の文字が含まれる場合，[`MAIL Convert to MIME`](https://developer.4d.com/docs/ja/commands/mail-convert-to-mime)または[`MAIL Convert from MIME`](https://developer.4d.com/docs/ja/commands/mail-convert-from-mime)で本文を正しく変換できないことがありました。

* ACI0105946 ASTインタープリターモードでは，コンパイル済みコンポーネントメソッドに対して`Call chain`を使用した場合，正しい呼び出し連鎖が返されないことがありました。

* ACI0105944 ASTインタープリターモードでは，`Call chain`から`formula`プロパティが返されないことがありました。