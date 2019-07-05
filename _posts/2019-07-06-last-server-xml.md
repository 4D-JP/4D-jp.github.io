---
layout: post
title: "最後に使用したサーバーパス"
date: 2019-07-06 12:00:00
categories: 仕様
tags: server 
version: 17.x
---

ネットワーク上に複数の4D Serverが同一の名前で公開されており，一方はストラクチャ設定の公開名，他方はユーザー設定の公開名をプロードキャストしている場合，``Alt``/``option``キーを押しながらクライアントを起動して「サーバーに接続」ダイアログを使用すれば，後者のサーバーに接続することができ，ユーザー設定の``lastServer.xml``も更新されますが，次回，``Alt``/``option``キーを押さずにクライアントを起動すると，``lastServer.xml``に記録されているほうのサーバーではなく，本来の公開名でプロードキャストされているほうのサーバーに自動接続します。これは仕様です。

<i class="fa fa-external-link" aria-hidden="true"></i> [クライアントアプリケーションによる接続の管理](https://doc.4d.com/4Dv17/4D/17.2/Management-of-connections-by-client-applications.300-4402979.ja.html)

``lastServer.xml``は，ビルドされたクライアントアプリケーションがビルドされたサーバーアプリケーションをブロードキャスト公開名（検索サービス）ではみつけることができなかった場合の復帰手段として用意されています。ネットワーク上に複数の4D Serverが同一の名前で公開されているような環境では，ビルド時に[``BuildIPAdress``](https://doc.4d.com/4Dv17/4D/17/IPAddress.300-3787889.ja.html)キーを指定して，IPアドレスまたはDNS名でサーバーを指定するようにしてください。
