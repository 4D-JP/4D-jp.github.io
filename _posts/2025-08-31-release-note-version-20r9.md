---
layout: fix
title: "4D 20r9 Hotfix 2 修正リスト"
date: 2025-09-09 08:00:00
categories: 修正リスト
tags: 20r9 hotfix
build: 100209
version: "20r9"
permalink: /2025/243/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105857 コンパイルモードのみ。`METHOD Get Path`コマンドにテーブルに対するポインターの逆参照を渡した場合，エラーが返されました。

* ACI0105866 [試用版ライセンス](https://jp.4d.com/4d-free-trial/)では*Qodly Studio* にアクセスすることができませんでした。

* ACI0105843 Windows版のみ。「最近使用したプロジェクト」のパスがネットワークボリュームを指している場合，そのプロジェクトを開こうとするとアプリケーションがクラッシュしました。

* ACI0105825 リソースフォルダーに`LoginImage.png`が存在する場合，カスタム版のユーザーログイン画面が表示されるはずですが，デフォルトのアイコンとメッセージが非表示になりませんでした。