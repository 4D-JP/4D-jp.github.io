---
layout: fix
title: "Count usersの仕様変更"
date: 2024-04-11 08:00:00
categories: 仕様
tags: 20r4 programming server
---

過去のバージョンでは，クライアント側で`count users`を実行した場合，ストアドプロシージャーが実行中であれば，サーバに接続しているユーザ数に`1`を加えた値が返されました。

> 少なくとも1つのストアドプロシージャーが実行されていて，`Count users`が（ストアドプロシージャー以外の）コンテキストから呼ばれた場合，コマンドはユーザの数に`+1`して返します。

<i class="fa fa-external-link" aria-hidden="true"></i> [Count users](https://doc.4d.com/4Dv20/4D/20.3/Count-users.301-6867345.ja.html)

この仕様は4D 20, R4, R5で見直されました。コマンドは，単純にサーバに接続しているユーザ数を返します。ストアドプロシージャーが実行中であってもなくても，クライアント側とサーバー側のどちらで実行しても，サーバに接続しているユーザ数に`1`を加えた値が返されることはありません。