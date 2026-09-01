---
layout: fix
title: "4D 21r3 修正リスト"
date: 2026-08-26 08:00:00
categories: 修正リスト
tags: 21r3
build: 100189
version: "21r3"
permalink: /2026/230/:slug/
---

* ACI0106413 IMAP通知を開始した後に`IMAPTransporter.getBoxInfo()`を実行した場合，アプリケーションがフリーズしました。

* ACI0106414 `IMAPTransporter.notifier.start()	`でIMAP通知を開始した場合，通知が返されませんでした。

**注記**: 問題は修正されましたが，`cs.IMAPListener`は`New OAuth2 provider`のパラメーターではなく，`IMAP New transporter`のパラメーターである点に留意してください。

- 誤

```4d
var $param : Object:=New object()
$param.name:="Microsoft"
$param.permission:="signedIn"
$param.listener:=cs.IMAPListener.new()
// ...
var $IMAPParameters : Object:=New object
$IMAPParameters.authenticationMode:=IMAP authentication OAUTH2
$IMAPParameters.host:="outlook.office365.com"
$IMAPParameters.port:=993
// ...
```

- 正

```4d
$IMAPParameters.listener:=cs.IMAPListener.new()
var $transporter : Object:=IMAP New transporter($IMAPParameters)
```

* ACI0106510 自動列幅が有効にされたリストボックスをフォームエディター上でリサイズした場合，表示が崩れました。ACI0106338が修正されたことによる副作用のようです。

* ACI0106486 フランス語版のみ。macOS 26 Tahoeでは，メソッドプロパティ「Ne peut pas être exécuté dans un process préemptif（プリエンプティブプロセスでは実行不可）」の表示が途切れていました。

* ACI0106464 管理画面のHTTPサーバーの項目に「SOAPリクエストを受け付けない」という間違ったタイトルのボタンが表示されました。

* ACI0106452 Webサーバーを再起動した場合，HTTPリクエスト数のカウンターがリセットされませんでした。

**注記**: `/4dwebtest`に表示されるリクエスト数のカウンターおよび`WEB Get server info`の`httpRequestCount`がリセットされるようになりました。

* ACI0106351 キーボードショートカットの`Control`+`R`でメソッドを実行することができませんでした。`Control`+`Shift`+`I`（コンパイルモードで再起動）も作動しないようです。
