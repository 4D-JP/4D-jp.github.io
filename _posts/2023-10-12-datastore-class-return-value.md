---
layout: fix
title: "データストアクラスの戻り値"
date: 2023-10-11 08:00:00
categories: 仕様
tags: programming orda 19.x
---

データストアクラス（*Entity, EntitySelection, DataClass*）のメンバー関数は *local* 指定しなければサーバー側で実行されますが，オブジェクトまたはコレクションにクライアント/サーバー環境でネイティブオブジェクトをカプセル化して返すことはできません。これは仕様です。ネイティブオブジェクトには，*Entity, EntitySelection, DataClass, DataStore, Pointer, File, Folder, CryptoKey, WebServer* などが含まれます。
