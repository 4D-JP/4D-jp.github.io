---
layout: fix
title: "リレーション計算属性の並び替えはシーケンシャル"
date: 2024-05-20 08:00:00
categories: 仕様
tags: programming orda
---

計算属性の`Function get`および`Function orderBy`関数を作成した場合，`entitySelection.orderBy("computedAttribute")`のような単純なORDA並び替えであれば`Function orderBy`がコールされますが，`entitySelection.orderBy("relatedEntities.computedAttribute")`のようにリレーション属性が関係するORDA並び替えはシーケンシャル処理なので`Function orderBy`ではなく`Function get`がコールされます。これは仕様です。ただし，パスの代わりに計算属性を使用すれば，その属性の`Function orderBy`でリレーション計算属性のインデックス並び替えを実装することができます。

なお，リレーション属性の`query`では`Function query`がコールされます（ACI0104799）。




