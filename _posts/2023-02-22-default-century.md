---
layout: post
title: "デフォルト世紀"
date: 2023-02-20 09:00:00
categories: 仕様
tags: programming
---

現在は`21`世紀ですが，[`SET DEFAULT CENTURY`](https://doc.4d.com/4Dv19/4D/19.5/SET-DEFAULT-CENTURY.301-6136794.ja.html)のデフォルト設定は引き続き`20`世紀（区切り年`30`）となっています。これは仕様です。

日付の *Internal date short special* 表示フォーマットで`21`世紀をデフォルトにしたいのであれば，コマンドに`20`を渡す必要があります。`20`世紀から`21`世紀の日付を扱いたいのであれば，コマンドに`19`と区切り年を渡す必要があります。コマンドに渡す値は「世紀」そのものではない点に留意してください。
