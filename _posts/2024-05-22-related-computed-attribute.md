---
layout: fix
title: "リレーション計算属性のクエリと並び替えはシーケンシャル"
date: 2024-05-20 08:00:00
categories: 仕様
tags: programming orda
---

計算属性の`Function get`および`Function orderBy`関数を作成した場合，`entitySelection.orderBy("computedAttribute")`のような単純なORDAクエリであれば`Function orderBy`がコールされますが，`entitySelection.orderBy("relatedEntities.computedAttribute")`のようにリレーション属性を経由した場合は`Function get`がコールされるため，期待したものとは違う結果が返されるかもしれません。これは仕様です。リレーション属性の`orderBy`は常にシーケンシャル処理であり，インデックスや`Function orderBy`などの最適化が適用されません。計算属性のリレーションクエリで`Function orderBy`を利用したい場合，リレーション属性のパスをエイリアス属性にすることを検討してください。`Function query`についても同様です。