---
layout: fix
title: "4D 21 修正リスト"
date: 2026-01-13 08:00:00
categories: 修正リスト
tags: "21.0"
build: 101999
version: "21.0"
permalink: /2026/13/:slug/
---

* ACI0106134 プロパティリストのフォームクラスをメソッドエディターで編集するためのボタンがありませんでした。

* ACI0106127 デザインモード検索で更新日を指定してメソッドを検索した場合，エラーが返されました。

* ACI0106097 QUICネットワークレイヤーのみ。`10`Gビットイーサネットインタフェース越しに数百メガバイトのデータをサーバーからダウンロードしようとした場合，クライアントアプリケーションがハングしました。

* ACI0105828 View Proエリアの上でスワイプ操作をした場合，ページがエリアを離れました。

**注記**: 参考までに，Webエリアのナビゲーションは下記の方法で不許可にすることができます。

```4d
If (Form event code=On VP Ready)
	
	ARRAY TEXT($filters; 0)
	ARRAY BOOLEAN($AllowDeny; 0)
	APPEND TO ARRAY($filters; "*")
	APPEND TO ARRAY($AllowDeny; False)
	
	WA SET URL FILTERS(*; OBJECT Get name(Object current); $filters; $AllowDeny)
	
End if 
```