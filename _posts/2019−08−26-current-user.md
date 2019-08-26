---
layout: post
title: "Designerのパスワードと未設定とCurrent user"
date: 2019-08-26 09:50:00
categories: 仕様
tags: security
version: 17r5
---

``Current user``のドキュメントには，下記のような記載がありました。

<span style="border-left: 4px solid #47bbc1;">このコマンドを使用するためにはアクセス管理システムが有効化されている必要があります。言い換えると，Designer にパスワードが割り当てられている必要性があります。そうでない場合には，CHANGE CURRENT USER には何の効力もなく，ユーザーを切り替えるための標準ウィンドウは表示されません。</span>

v14以降，Designerのパスワードが設定されていない場合，パスワードのチェックは省略されるよう，``Current user``が改定されています。つまり，コマンドでカレントユーザーを切り替えるために，Designerのパスワードを設定する必要はありません。この点は，17r5以降のドキュメントに反映されています。
