---
layout: fix
title: "iOS 17.3でメールの添付ファイルが表示されない"
date: 2024-04-01 08:00:00
categories: 仕様
tags: 20r4 transporter
---

iOS 17.3では，`SMTPTransporter`で送信したGmailの添付ファイル（`Content-Disposition: attachment`）が表示されないことがあります。Androidデバイスでは問題ありません。この問題はiOS 17.4で修正されています。4Dの不具合ではありません。