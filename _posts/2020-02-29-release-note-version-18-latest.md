---
layout: fix
title: "4D v18 修正リスト"
date: 2020-03-20 08:00:00
categories: 修正リスト
tags: "18.1"  
build: 249811
version: 18.1

---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0100636 バックアップから復元した後，あるいはアプリケーションを再起動した後，4D for iOSがレコードの同期に使用する管理用テーブル（__DeletedRecords）の管理用フィールド（__GlobalStamp）が正しく更新されませんでした。

* ACI0100611 4D Write Proエリアのコンテキストメニューを無効にした場合，ルーラーのコンテキストメニューも無効になりました。
