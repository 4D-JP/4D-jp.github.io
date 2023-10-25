---
layout: fix
title: "FileHandleは保存できない"
date: 2023-10-24 08:00:00
categories: 仕様
tags: filehandle
---

[`FileHandle`](https://developer.4d.com/docs/ja/API/FileHandleClass/)をオブジェクト型フィールドに保存することはできません。これは仕様です。エンティティの属性に`Null`が代入されるか，保存時にエラーが返されるかは，バージョンの実装に依存します。
