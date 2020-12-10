---
layout: post
title: "選択できないIMAPメールボックス"
date: 2020-12-10 12:00:00
categories: 仕様
tags: 18r4 imap network
---

`IMAP Transporter`の`getBoxInfo()`は，どんなメールボックスでも選択できるわけではありません。たとえば，Gmailの`INBOX`にIMAPで接続した場合，`[Gmail]`というメールボックスが返されますが，このメールボックスは階層構造の「ノード」なので，単独で選択することができません。

* INBOX
* [Gmail]
* [Gmail]/すべてのメール
* [Gmail]/ゴミ箱
* [Gmail]/スター付き
* [Gmail]/下書き
* [Gmail]/迷惑メール
* [Gmail]/送信済みメール
* [Gmail]/重要

メールボックスが選択できるかどうかは`selectable`プロパティで判定できます。

```
$transporter:=IMAP New transporter($server)

$status:=$transporter.checkConnection()

If ($status.success)

$boxList:=$transporter.getBoxList()

For each ($box;$boxList)
If ($box.selectable)
$boxInfo:=$transporter.getBoxInfo($box.name)
End if
End for each
```
