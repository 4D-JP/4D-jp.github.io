---
layout: post
title: "クライアント自動アップデートとサーバーIPアドレス"
date: 2020-03-22 12:00:00
categories: 仕様 
tags: server 
version: 17.x
---

デザインモードの「アプリケーションビルド」ダイアログには，``BuildApp.xml``の``IPAddress``キーに相当するフィールドがありません。そのため，このダイアログでビルドしたクライアントアプリケーションは，自動アップグレード後に接続するべきサーバーをIPアドレスではなく，公開名とポート番号で探します。これは仕様です。

ネットワーク上に同名のサーバーが同時に公開されており，公開名とポート番号ではサーバーが特定できない場合，``BuildApp.xml``を編集し，IPアドレスを指定するようにしてください。そうすれば，そのアドレスがUpgrade4DClientの``info.json``ファイルにコピーされます。
