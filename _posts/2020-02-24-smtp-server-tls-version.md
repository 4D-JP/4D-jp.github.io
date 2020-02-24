---
layout: post
title: "SMTPサーバーのTLSバージョン"
date: 2020-02-24 08:00:00
categories: 仕様
tags: 17.x mail internetcommands security
---

Internet Commandsではメールが送信でき，``SMTP Transporter``では送信できない場合，SMTPサーバーのTLSバージョンが古い可能性があります。これは仕様です。サーバーが``TLS_1.1``または``TLS_1.2``をサポートしていない場合，``checkConnectivity()``でエラー ``42`` ``43`` ``49``が返されます。これに対応するOpenSSL内部エラーメッセージは下記のとおりです。

```
1425F102:SSL routines:ssl_choose_client_version:unsupported protocol
```

古いSMTPサーバーを使用する場合，4DのデフォルトTLSバージョンを引き下げる必要があります。

```
SET DATABASE PARAMETER(Min TLS version;TLSv1_0)
```

