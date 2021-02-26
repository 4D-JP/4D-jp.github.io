---
layout: post
title: "IMAPまたはPOP3でマルチパートMIMEを取得するには"
date: 2021-02-21 12:00:00
categories: 仕様
tags: 18.x internetcommands transporter
---

[`POP3 Transporter`](https://doc.4d.com/4Dv18R6/4D/18-R6/POP3-New-transporter.301-5197520.ja.html)または[`IMAP Transporter`](https://doc.4d.com/4Dv18R6/4D/18-R6/IMAP-New-transporter.301-5197512.en.html)を使用してメールを受信する場合，結果はサーバー設定に左右されることに注意する必要があります。

たとえば，Microsoft Exchangeのサーバー設定でメッセージ取得形式が`TextOnly`に設定されている場合，HTMLメールをトランスポーターまたはInternet Commandsの同等コマンドで取得することはできません。この設定は，モバイル機器などで使用されているExchange ActiveSyncとは別です。

<i class="fa fa-external-link" aria-hidden="true"></i>  [POP3 および IMAP4 のメッセージ取得形式オプションを構成する](https://docs.microsoft.com/ja-jp/exchange/configure-pop3-and-imap4-message-retrieval-format-options-exchange-2013-help)
