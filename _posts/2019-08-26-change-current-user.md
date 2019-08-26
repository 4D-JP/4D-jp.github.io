---
layout: post
title: "CHANGE CURRENT USERとパスワード"
date: 2019-08-26 09:50:00
categories: 仕様
tags: security
version: 17r5
---

``CHANGE CURRENT USER``のドキュメントには，下記のような記載がありました。

<p class="quote">このコマンドを使用するためにはアクセス管理システムが有効化されている必要があります。言い換えると，Designer にパスワードが割り当てられている必要性があります。そうでない場合， CHANGE CURRENT USER には何の効力もなく，ユーザーを切り替えるための標準ウィンドウは表示されません。</p>

v14以降，Designerのパスワードが設定されていない場合，``CHANGE CURRENT USER``のパスワードチェックは省略されるようになりました。つまり，コマンドでカレントユーザーを切り替えるために，Designerのパスワードを設定する必要はありません。この点は，17r5以降のドキュメントに反映されています。
