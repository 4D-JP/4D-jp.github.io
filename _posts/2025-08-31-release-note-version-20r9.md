---
layout: fix
title: "4D 20r9 修正リスト"
date: 2025-08-31 08:00:00
categories: 修正リスト
tags: 20r9
build: 100206
version: "20r9"
permalink: /2025/243/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105866 [試用版ライセンス](https://jp.4d.com/4d-free-trial/)では*Qodly Studio* にアクセスすることができませんでした。

* ACI0105843 Windows版のみ。「最近使用したプロジェクト」のパスがネットワークボリュームを指している場合，そのプロジェクトを開こうとするとアプリケーションがクラッシュしました。

* ACI0105825 リソースフォルダーに`LoginImage.png`が存在する場合，カスタム版のユーザーログイン画面が表示されるはずですが，デフォルトのアイコンとメッセージが非表示になりませんでした。