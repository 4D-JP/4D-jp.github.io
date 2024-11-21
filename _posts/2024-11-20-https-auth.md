---
layout: fix
title: "HTTPSリクエストで証明書を検証"
date: 2024-11-20 08:00:00
categories: 仕様
tags: network 20.x
---

`4D.HTTPRequest`クラスは，コマンドの`HTTP Get` `HTTP Request`よりも高機能です。たとえば，`serverAuthentication`および`proxyAuthentication`という[オプションプロパティ](https://developer.4d.com/docs/ja/20/API/HTTPRequestClass/#authentication-オブジェクト
)がサポートされています。

これはサーバーのTLS証明書を検証するというもので，使用した場合，Node.jsで`rejectUnauthorized`を使用した場合と同じようにサーバーから送信されるCA署名証明書を検証できないサーバーにはHTTPSで接続しないようになります。

コマンドの[`HTTP SET OPTION`](https://doc.4d.com/4Dv20/4D/20.5/HTTP-SET-OPTION.301-7389026.ja.html)にこのオプションはありません。

<i class="fa fa-external-link" aria-hidden="true"></i> [4D DevCon 2024](https://speakerdeck.com/miyako/4d-devcon-2024?slide=42)