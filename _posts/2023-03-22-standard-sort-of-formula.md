---
layout: post
title: "ヘッダークリックによる並び替えとORDA"
date: 2023-03-29 09:00:00
categories: 仕様
tags: programming userinterface orda listbox
---

エンティティセレクション型のリストボックス列に`This.relatedEntity.objectAttribute.property`のようにリレーション属性とオブジェクト記法を組み合わせたORDAパスを記述した場合，ヘッダークリックによる並び替えで属性"objectAttribute.property"が見つからないというエラーが返されます。これは仕様です。ヘッダークリックによる並び替えは内部的に`orderByFormula()`ではなく`orderBy()`を実行しています。

純粋なORDAパスではなく，フォーミュラがデータソースに設定されているリストボックス列の並び替えは [*On Header Click*](https://doc4d.github.io/docs/ja/next/Events/onHeaderClick/) イベントで実装する必要があります。
