---
layout: fix
title: "4D v19.3 修正リスト"
date: 2022-06-02 08:00:00
categories: 修正リスト
tags: "19.3"
build: 279817
version: "19.3"
permalink: /153/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0102968	プラグインSDKのエントリーポイント`EX_GET_FIELD`でBLOBフィールドの値を取得できませんでした。

* ACI0102940 `MAIL New attachment`で作成したメールオブジェクトの添付ファイルをパラメーターとして別プロセスに渡すことができませんでした。

* ACI0102931 MIMEのバウンダリー文字列に`"boundary Wed, 27 Apr 2022 08:46:59 +0200 boundary"`のような文字列が使用されていた場合，`MAIL Convert from MIME`で添付ファイルが抽出できませんでした。

* ACI0102929 *SVG_New_embedded_image*でSVGにSVGを挿入した場合，エクスポートしたピクチャがブラウザに表示されませんでした。`xlink:href`が`data:image/svg+xml;base64,`から始まっていないためです。

* ACI0102908 コンパイルモードのみ。*collection.map()*や*collection.find()*のようなファンクションで実行したメソッドのポインター型で宣言されているパラメーターに`Null`を渡した場合，シンタックスエラー`#54`が返されました。

* ACI0102489 Mac版のみ。タブコントロールのアイコンが正しく表示されませんでした。右側のタブほど左に位置がずれて表示されます。
