---
layout: fix
title: "4D v19 修正リスト"
date: 2024-02-13 08:00:00
categories: 修正リスト
tags: "19.7"
build: 290305
version: "19.7"
permalink: /2024/44/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104550 `MIME-Version`や`Date`など，既定のヘッダーをメールオブジェクトで設定して`SMTP New transporter`で送信した場合，両方のヘッダーがMIMEに含まれました。一部のメールクライアントはヘッダーの重複に対応していないため，表示に問題がありました。いずれにしても，カスタムヘッダー値だけが送信されるべきです。
