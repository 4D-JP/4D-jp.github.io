---
layout: post
title: "DISABLE BUTTONの廃止"
date: 2020-04-02 12:00:00
categories: 仕様
tags: programming deprecated
version: 18r2
---

18 R2では，``_O_DISABLE BUTTON``および``_O_ENABLE BUTTON``コマンドが廃止されました。コマンドはトークナイズされ，コンパイルも成功しますが，呼び出した場合，「未実装のコマンド」エラーが返されます。これは仕様です。v11以降，両コマンドの代わりに``OBJECT SET ENABLED``を使用することが勧められています。
