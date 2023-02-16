---
layout: fix
title: "4D v19.5 修正リスト"
date: 2023-02-15 08:00:00
categories: 修正リスト
tags: v19 
build: 285048
version: "19.5"
permalink: /2023/41/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0103368 エンティティを`2`回リロードすると，エンティティのロックが開放されました。
 
* ACI0103718 WebサーバーまたはRESTサーバーに高い負荷がかかった場合，アプリケーションがクラッシュすることがありました。

* ACI0103593 Mac版のみ。特定のプロジェクトをIntelおよびApple Siliconアーキテクチャをターゲットにコンパイルした場合，不要な桁区切りが定数に適用されるために関数パラメーターの数が狂ってしまい，コンパイルエラーが返されました。

**注記**: インストールされたプラグインがC++のロケールを変更し，元に戻していない場合に問題が発生しました。

* ACI0102312 垂直（水平）ラインオブジェクトの幅（高さ）がデフォルトで`1`に設定されているため，線幅を`1`よりも太くした場合，アンチエイリアスにより，シャープなラインが描画されませんでした。ラインオブジェクトの幅（高さ）はデフォルトで`0`に設定されているべきです。
