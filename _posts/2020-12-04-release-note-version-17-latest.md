---
layout: fix
title: "4D v17 修正リスト"
date: 2021-01-21 08:00:00
categories: 修正リスト
tags: "17.5"  
build: 260733
version: 17.5
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0101611 Windows版のみ。Citrixプラットフォームでタスクパーのウィンドウを閉じた場合，アプリケーションが正常に終了しませんでした。Citrixでタスクパーを右クリックしてウィンドウを閉じると`WM_SYSCOMMAND`の`SC_CLOSE`ではなく`WM_CLOSE`イベントが送信されますが，4DのMDIウィンドウがこのイベントを処理しないためにアプリケーションが終了せず，バックグランドで非常に高いCPU使用率のまま動き続けてしまうことが原因です。
