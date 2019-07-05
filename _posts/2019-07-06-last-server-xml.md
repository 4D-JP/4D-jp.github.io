---
layout: post
title: "最後に使用したサーバーパス"
date: 2019-07-06 12:00:00
categories: 仕様
tags: server 
version: 17.x
---

ネットワーク上に複数の4D Serverを公開しており，ストラクチャ設定の公開名は同一で，外部ファイル（ユーザー設定）で一方の公開名を別の名称にした場合，「サーバーに接続」ダイアログを使用すれば，後者に接続することができ，``lastServer.xml``も更新されますが，次回，「サーバーに接続」ダイアログを使用せずにクライアントを起動すると，``lastServer.xml``に記録されているほうのサーバーではなく，本来の公開名でプロードキャストされているほうのサーバーに接続します。これは仕様です。

<i class="fa fa-external-link" aria-hidden="true"></i> [クライアントアプリケーションによる接続の管理](https://doc.4d.com/4Dv17/4D/17.2/Management-of-connections-by-client-applications.300-4402979.ja.html)

``lastServer.xml``は，ビルドされたクライアントアプリケーションがビルドされたサーバーアプリケーションをブロードキャスト公開名（検索サービス）ではみつけることができなかった場合のために用意されています。ストラクチャ設定の公開名をオーバーライドするのであれば，ビルド時に[``BuildIPAdress``](https://doc.4d.com/4Dv17/4D/17/IPAddress.300-3787889.ja.html)キーを指定してIPアドレスまたはDNS名でサーバーを指定するようにしてください。
