---
layout: post
title: "ORDAのコンテキストのリセット"
date: 2021-02-11 12:00:00
categories: 注意点
tags: userinterface orda
---

ORDAで作成したエンティティセレクションには固有のORDAコンテキストが関連づけられます。ORDAのコンテキストを作成するコマンドは，下記のとおりです。

* `dataClass.query()`
* `entitySelection.query()`
* `dataClass.fromCollection()`
* `dataClass.all()`
* `Create entity selection`

<i class="fa fa-external-link" aria-hidden="true"></i> [Use ORDA to boost performance in Client/Server mode](https://blog.4d.com/use-orda-to-boost-performance-in-client-server-mode/)

ORDAのコンテキストは，クライアント/サーバーのパフォーマンスを最適化するために使用されます。具体的には，REST APIでサーバーから転送されるデータクラス属性のリストを内部的に管理し，リクエストされた属性だけを追加してゆくことにより，クエリの特性を自動的に「学習」するために使用されます。通常，コンテキストを意識してコーディングする必要はありませんが，条件分岐を含むエンティティセレクションの一括処理などでアクセスする可能性のあるすべての属性が事前にわかっているのであれば，最初に必要な属性名すべてにアクセスしてコンテキストを最適化することにより，一括処理の途中で不足した属性をループ内で補うためのネットワークリクエストが発生することを防ぐこともできます。コンテキストはフォームの描画にも使用されており，リストボックスのカラム内で使用されている属性（非表示カラムを含む）が初期コンテキストとなります。

ORDAコンテキストは，クエリの用途に対して特化されたものであるべきです。コンテキストから属性を除外することはできないので，コンテキストを汎用的に使用した場合，属性のリストが肥大化してパフォーマンスが低下する恐れがあります。リレーション属性にアクセスする場合は特にそうです。たとえば，下記のコードはマルチレベルのリレーション属性にアクセスしているため，指数的にコンテキストが肥大化し，一括処理の後は非常に処理が重くなります。ORDAリクエストログをみれば，一括処理の後はレベルのリレーション属性がそれぞれ最大`80`件ずつ返されていることがわかります。

```4d
$logFile:=Folder(fk logs folder).file("ORDARequests.txt")
ds.startRequestLog($logFile)

$entitySelection:=$anEntity.relatedEntities

For each ($entity; $entitySelection)
    $relatedData:=$entity.link.link.link.link.toCollection()
End for each

$result:=$entitySelection.orderBy()
```

複雑な統計処理などにより，コンテキストが肥大化してしまった場合，`dataClass.get()`で新しいコンテキストを作成することができます。

```4d
$logFile:=Folder(fk logs folder).file("ORDARequests.txt")
ds.startRequestLog($logFile)

$entitySelection:=$anEntity.relatedEntities

For each ($entity; $entitySelection)
    $relatedData:=$entity.link.link.link.link.toCollection()
End for each

$key:=$anEntity.getKey() //プライマリーキー
$entitySelection:=ds[$anEntity.getDataClass().getInfo().name].get($key) //新しいコンテキスト
$result:=$entitySelection.orderBy()
```
