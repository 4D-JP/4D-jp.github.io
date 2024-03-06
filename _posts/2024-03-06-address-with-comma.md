---
layout: fix
title: "メールアドレスにカンマが含まれる場合"
date: 2024-02-28 08:00:00
categories: 仕様
tags: programming transporter
---

[SMTPTransporter](https://developer.4d.com/docs/ja/API/SMTPTransporterClass/)オブジェクトでメールを送信する場合，*mail* オブジェクトの *from* プロパティなどにテキスト形式でカンマ記号を含む文字列（例：`Company, LLC <mail@company.com>`を渡すとシンタックスエラーが返されます。これは仕様です。宛先は，コーディングを簡略するためにテキスト型でも設定できるようになっていますが，カンマやセミコロンなどの区切り文字が含まれている場合，文字列のどこまでがメールアドレスなのかが明確ではなありません。曖昧さをなくすためには，テキスト型ではなく，オブジェクト型で宛先を設定してください。