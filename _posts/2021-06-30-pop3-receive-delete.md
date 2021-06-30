---
layout: post
title: "POP3で受信したGmailが削除される"
date: 2021-06-30 12:00:00
categories: 仕様
tags: v18 pop3 transporter
---

Gmailの設定「メール転送とPOP/IMAP」には，「POP でメールにアクセスする場合」という項目があり，下記のオプションから動作を選択できるようになっています。

* Gmailのメールを受信トレイに残す
* Gmailのメールを既読にする
* Gmailのメールをアーカイブする
* Gmailのメールを削除する

<img width="704" alt="settings" src="https://user-images.githubusercontent.com/10509075/123883595-5468d900-d984-11eb-9e53-15cd2113bf99.png">

「削除する」または「アーカイブする」が選択されている場合，POP3で受信したメッセージは（明示的な削除命令を発行しなくても）受信トレイから取り除かれます。その他のオプションが選択されている場合でも，すでにダウンロードしたメッセージは受信できないようになっています。

<i class="fa fa-external-link" aria-hidden="true"></i> [POP を使用して他のメール クライアントで Gmail のメールを読む](https://support.google.com/mail/answer/7104828?hl=ja&visit_id=637606088860066320-1319188599&rd=3#zippy=%2C%E3%83%A1%E3%83%BC%E3%83%AB%E3%81%8C-gmail-%E3%81%8B%E3%82%89%E5%89%8A%E9%99%A4%E3%81%95%E3%82%8C%E3%82%8B%E5%A0%B4%E5%90%88)

<img width="733" alt="gmail" src="https://user-images.githubusercontent.com/10509075/123883619-60ed3180-d984-11eb-8721-a38502e2744d.png">

POP3クライアントでダウンロードした後もメッセージが受信できるようにするためには，アドレスに接頭辞`recent:`を追加し，recent modeでGmailにアクセスすることができます。その場合，すでにPOP3でダウンロードしたメッセージであっても，過去30日分のメールは繰り返し受信することができるようになります。
