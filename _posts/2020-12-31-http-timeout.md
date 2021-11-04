---
layout: post
title: "HTTP timeoutは接続タイムアウト"
date: 2020-12-31 12:00:00
categories: 仕様
tags: programming network 
---

`HTTP SET OPTION`で設定できる`HTTP timeout`は，接続タイムアウトです。サーバーとの接続が確立された後，HTTPレスポンスが返されるまで待機する時の上限ではないことに留意してください。タイム`HTTP timeout`は，サーバーがダウンしている場合，いつまでもレスポンスを待ち続けるようなことを避けるために設定します。

**更新**: 

下記の不具合修正も参照

* ACI0102310 `HTTP Request`を続けて何度も実行した場合，`#17`（未実装の制御命令）エラーが返されることがありました。 [v19](https://4d-jp.github.io/285/release-note-version-19/)

**注記**: エラーメッセージが修正されました。実際にはタイムアウトエラーが発生しています。`HTTP SET OPTION`で設定した秒数以内にレスポンスを読むことができなかった場合にエラーが返されます。
