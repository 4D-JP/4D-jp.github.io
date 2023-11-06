---
layout: fix
title: "数値型の変換"
date: 2023-11-05 08:00:00
categories: 仕様
tags: programming
---

`BLOB TO VARIABLE`は数値型変数または配列のタイプ変換を実行します。つまり，*ARRAY INTEGER* をBLOBに変換した場合，そのBLOBは *ARRAY LONGINT* または *ARRAY REAL* に
復元することができます。より小さなデータ型に変換した場合，値が失われるかもしれません。