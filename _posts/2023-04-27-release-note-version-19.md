---
layout: fix
title: "4D v19.6 修正リスト"
date: 2023-04-28 08:00:00
categories: 修正リスト
tags: v19
build: 286412
version: "19.6"
permalink: /2023/117/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0103888 Windows版のみ。Windows Server 2012 R2またはWindows Server 2016でアプリケーションを起動した場合，エントリーポイント`SetThreadDescription`がみつからない，というエラーが返されました。Windows Server 2019以降であれば問題ありません。

* ACI0103880 フォームエディターでピクチャボタンを選択し，ツールボックスを起動してヘルプTipsを変更した後，フォームエディターを最前面に移動した場合，プロパティリストに表示されるヘルプTipsのポップアップメニューが更新されませんでした。ピクチャボタン以外のフォームオブジェクトを選択してから。ピクチャボタンを再選択すれば，プロパティリストの内容が更新されます。
