---
layout: fix
title: "4D v17 修正リスト"
date: 2019-05-03 10:22:00
categories: 修正リスト
tags: 17.1 hotfix 
build: 236921
version: 17.1

---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0099451 コマンドでリストボックスにカラムを追加した場合，``LISTBOX SET PROPERTY``の``lk auto row height``（行の高さを自動的に調整）が働きませんでした。カラムをドラッグして位置を入れ替えれば，正しくリサイズされるようになります。

* ACI0099431 64ビット版のみ。``CLOB``タイプのカラムに対して``OCILobGetLength``を実行した場合，``0``ではなく``-2``が返されました。
