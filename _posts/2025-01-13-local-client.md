---
layout: fix
title: "ローカルクライアントの判別"
date: 2025-01-13 08:00:00
categories: 仕様
tags: programming clientserver projectmode
---

プロジェクトモードでは，同一マシンで起動したクライアントをサーバーに接続することにより，デザインモードでプロジェクトを編集することができます。つまり，ローカルクライアントの場合，自動的に[開発モード](https://developer.4d.com/docs/ja/20/Desktop/clientServer)が有効化されます。

サーバーは，起動時に*projectToken.json* ファイルを作成します。このファイルには，マシンを特定するためのUUIDとフルパスが書き込まれています。

* ~/Library/Application Support/4D Server/{プロジェクト名}
* C:\Users\{ユーザー名}\AppData\Roaming\4D Server\{プロジェクト名}

クライアントは，サーバーから送信されたUUIDと*projectToken.json* ファイルのUUIDを比較し，合致すれば，ローカルクライアントであると判断します。ローカルクライアントは，クライアントキャッシュを使用せず，*projectToken.json* ファイルで指定されたプロジェクトのファイルを開きます。

アクセス権の問題等で*projectToken.json* ファイルが開けない場合，サーバーと同一マシンからのアクセスであってもリモートクライアントと判定され，デザインモードのエディターがすべてリードオンリーになるかもしれません。そのような場合，サーバー停止中に*projectToken.json* を削除し，次回の起動でファイルが再作成されていることを確認した上で，再度アクセスしてみてください。