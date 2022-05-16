---
layout: post
title: "クライアント側ORDAキャッシュ"
date: 2022-05-16 15:00:00
categories: Tips
tags: orda development server
version: 19r5
---

19r2では[`4D.Blob`オブジェクト](https://blog.4d.com/create-a-blob-attribute-in-an-object/)が使用できるようになり，19r3ではORDAでBLOBフィールドが使用できるようになりました。この機会にクラシックコードをORDAで書き換えることを検討しているかもしれません。大量のBLOBフィールドをORDAで扱うのであれば，クライアント側キャッシュのサイズに気を配ると良いでしょう。

#### クライアント側ORDAキャッシュとは

ローレベルのREST APIはデフォルトで[`100`](https://developer.4d.com/docs/19/ja/REST/top_$limit.html)件のエンティティを返しますが，クライアント/サーバー版のORDAリクエスト毎にフェッチされるエンティティは`80`件に設定されています。すべての属性（フィールド）がリクエストされるわけではなく，必要に応じてリクエストされる属性やリレーション属性がコンテキストに追加されてゆきます。サーバから取得したエンティティは，`30000`件/テーブル毎を限度として再利用されます。これがクライアント側ORDAキャッシュです。

[entitySelection.refresh()](https://developer.4d.com/docs/19/ja/API/EntitySelectionClass.html#refresh)@18r3のドキュメントに説明されているように，クライアント/サーバー版のORDAには`30`秒間保持されるクライアント側キャッシュが存在します。これはサーバー側で`10`分間保持されるローレベルの[エンティティセットのキャッシュ](https://developer.4d.com/docs/19/ja/REST/manData.html)とは別のものです。また，ストラクチャ/プロジェクトの[クライアント側キャッシュ](https://4d-jp.github.io/2021/05/18/connect-to-server/)とも違います。

#### クライアント側ORDAキャッシュの管理

クライアント/サーバー版のORDAでBLOB属性にアクセスした場合，最高で`30000`件/テーブル毎のBLOBがクライアント側にキャッシュされる可能性があります。プロセスのメモリ占有量が問題になるようであれば，[setRemoteCacheSettings()](https://developer.4d.com/docs/ja/API/DataClassClass.html#setremotecachesettings)@19r5でキャッシュされるエンティティ数を抑えたり，[setRemoteContextInfo()](https://developer.4d.com/docs/ja/API/DataStoreClass.html#setremotecontextinfo)@19r5でコンテキストの設定を調整することができます。
