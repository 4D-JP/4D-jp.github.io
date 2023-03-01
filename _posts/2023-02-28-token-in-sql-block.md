---
layout: post
title: "サーバー上でトランザクション"
date: 2023-02-28 09:00:00
categories: 仕様
tags: development sql
---

`Begin SQL`~`End SQL`ブロックに変数名などのトークンを記述する場合，余計な空白を挿入しないように注意してください。`INTO :$var`は問題ありませんが，`INTO : $var`はコンパイルエラーになります。これは仕様です。
