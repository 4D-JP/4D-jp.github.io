---
layout: post
title: "保存されていないエンティティをクローンしてはいけない"
date: 2019-06-08 12:48:00
categories: 仕様
tags: orda
---

ORDAの``entity.clone()``メソッドは，データベースに保存されているエンティティに対して使用されることが想定されています。クライアント/サーバー版であれば，未保存であっても，``entity.clone()``でエンティティがクローンできるかもしれませんが，スタンドアロン版で同じことをした場合，プライマリーキーの値がコピーされないので，問題になります。この点は，ドキュメントに説明されています。

<i class="fa fa-external-link" aria-hidden="true"></i> [``entity.clone()``](https://doc.4d.com/4Dv17/4D/17.1/entityclone.305-4179733.ja.html)
