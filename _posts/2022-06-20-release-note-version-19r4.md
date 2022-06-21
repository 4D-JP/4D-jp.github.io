---
layout: fix
title: "4D v19r4 Hotfix 2 修正リスト"
date: 2022-06-22 08:00:00
categories: 修正リスト
tags: 19r4
build: 280170
version: 19r4
permalink: /171/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0101068 4D View Proスプレッドシートのセルを``delete``キーで直接クリアした場合，``designer.actions.isFileModified``が``true``になりませんでした。セルを編集状態にして値を削除すれば問題ありません。

* ACI0102194 `VP SET PRINT INFO`で用紙サイズを文字列で指定した場合，`VP Get print info`から返されるオブジェクトの`paperSize.kind`プロパティが正しくありませんでした。用紙サイズの名称ではなく，SpreadJSの定数値が返されました。

* ACI0102803 プロジェクトモードのみ。ユーザーIDの欠番がある場合，プロジェクトを開き直すと*directory.json*ファイル内のユーザーやグループの順序が入れ替わりました。

* ACI0102972 プロジェクトモードのみ。バイナリモードからデータベースを変換した場合，*Designer*アクセスグループからユーザーが外されました。*Administrator*グループの設定だけが正しくエクスポートされます。
