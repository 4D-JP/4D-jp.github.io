---
layout: post
title: "最大同時Webプロセス数"
date: 2022-04-14 15:00:00
categories: 仕様
tags: soap web
version: 19.x
---

Webサーバーの[スケーラブルセッション](https://developer.4d.com/docs/ja/WebServer/sessions.html)を有効にした場合，下記のWebオプションは無視され，同時Webプロセス数の上限がなくなります。

- `Web inactive process timeout`
- `Web max concurrent processes`
- `Web inactive session timeout`

Webサービス（SOAP）はセッション管理の対象外です。スケーラブルセッションの設定は，Webサービス（SOAP）に適用されず，「セッションなし」の最大同時Webプロセス数が適用されます。これは仕様です。
