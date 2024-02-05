---
layout: fix
title: "ORDAの連鎖"
date: 2024-02-04 08:00:00
categories: 仕様
tags: devcon24 programming language orda
---

#### 4D Developer Conference 2024・質疑応答より

> `.query().query().orderBy()`のように連結したORDAクエリはまとめてサーバー側で実行されるのでしょうか

いいえ。オブジェクト記法で`1`行にまとめたとしても，それぞれのメンバー関数でサーバーに対するリモートプロシージャーコールが発生します。[`.query()`](https://developer.4d.com/docs/ja/API/DataClassClass/#query)でサポートされているさまざまなシンタックスや演算子をフル活用し，できれば1回のクエリで目的のエンティティセレクションを作成できるようにコーディングすることが勧められています。