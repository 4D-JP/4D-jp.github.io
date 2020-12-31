---
layout: post
title: "HTTP timeoutは接続タイムアウト"
date: 2020-12-31 12:00:00
categories: 仕様
tags: programming network 
---

`HTTP SET OPTION`で設定できる`HTTP timeout`は，接続タイムアウトです。サーバーとの接続が確立された後，HTTPレスポンスが返されるまで待機する時の上限ではないことに留意してください。タイム`HTTP timeout`は，サーバーがダウンしている場合，いつまでもレスポンスを待ち続けるようなことを避けるために設定します。
