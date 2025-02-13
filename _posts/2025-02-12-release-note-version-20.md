---
layout: fix
title: "4D 20 修正リスト"
date: 2025-02-12 08:00:00
categories: 修正リスト
tags: "20.6"
build: 101687
version: "20.6"
permalink: /2025/43/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105323 `entitySelection.attributeName`をエンティティのエイリアス属性として宣言した場合，リレーション属性のすべてのエンティティが返されませんでした。

* ACI0105005 オブジェクト型フィールドのORDAクエリで`YYYY-MM-DD`形式の日付リテラルが正しく評価されませんでした。日付型フィールドのORDAクエリであれば問題ありません。

* ACI0105398 Windows版のみ。`PRINT SETTINGS`を実行した場合，*Windows Server 2025* の新しい印刷設定ダイアログが表示されました。従来の印刷設定ダイアログが表示されるべきです。

* ACI0105374 アプリケーションモードのスプラッシュスクリーンに*.svg* 形式の新しい画像ではなく，*.png* 形式の古い画像が表示されました。

	Application mode Logo 4D in splash screen: an old application.png is displayed instead of the application.svg		4D Staff	Not published

* ACI0105373 Windows版のみ。フォームにスプリッターが配置されている場合，リサイズ操作で移動したオブジェクトが新しい位置に引っかかってしまうことがありました。ウィンドウを小さくした直後によく現象が発生します。

* ACI0105224 クライアント/サーバー版のみ。「サーバー側で実行」メソッドにトランスポーターオブジェクトをパラメーターとして渡した場合，添付の`File`オブジェクトが失われました。