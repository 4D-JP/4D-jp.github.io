---
layout: fix
title: "4D 20r8 修正リスト"
date: 2025-06-15 08:00:00
categories: 修正リスト
tags: 20r8
build: 100379
version: "20r8"
permalink: /2025/168/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105705 Windows版のみ。ツールバー上にプロジェクトファイルをドラッグした場合，内部ランタイムエラーが返され，アプリケーションがフリーズしました。

**注記**: *.4dbase* または *.4dlink* または *.4dproject* をツールバーにドラッグ＆ドロップすることでプロジェクトを切り替えられるという過去の「隠し機能」が原因でした。修正に伴い，このメカニズムは廃止されました。

* ACI0105701 フォーム名やオブジェクト名に`<`記号が含まれている場合，デバッガにマルチスタイルテキストのソースコードが表示されました。