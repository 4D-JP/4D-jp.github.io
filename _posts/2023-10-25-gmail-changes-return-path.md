---
layout: fix
title: "SMTPの返信アドレス"
date: 2023-10-24 08:00:00
categories: 仕様
tags: transpoter smtp
---

[`SMTPTransporter`](https://developer.4d.com/docs/ja/API/SMTPTransporterClass)の *headers* プロパティで`Return-Path`を設定することができますが，返信アドレスとして受信者に表示されるかどうかは，SMTPサーバーの仕様に依存します。たとえば，Gmailは`Return-Path`ヘッダーの値を送信者のアドレスに書き換えるようです。