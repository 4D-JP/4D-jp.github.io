---
layout: fix
title: "User in groupにエイリアスを渡すことはできない"
date: 2024-04-11 08:00:00
categories: 仕様
tags: 20r4 programming
---

v17r5以降，[`Current user`](https://doc.4d.com/4Dv20/4D/20.3/Current-user.301-6867848.ja.html)は「カレントユーザのエイリアスまたはユーザ名」を返すようになりました。ドキュメントに明記されているように，*user* 引数を省略した場合，エイリアスが定義されていれば，エイリアスが返されます。

[`User in group`](https://doc.4d.com/4Dv20/4D/20.3/User-in-group.301-6867854.ja.html)でカレントユーザーの所属グループを調べる場合，エイリアスで判定することはできないので，*user* 引数に`4D user account`を指定する必要があります。これは仕様です。