---
layout: post
title: "表示中のヘルプTipsを頻繁に更新しない"
date: 2019-04-15 16:14:00
categories: 注意点
tags: 17.x form
---

ヘルプTipsが表示されているときに``OBJECT SET HELP TIP``を使用した場合，表示中のヘルプは取り消され，新しい内容のヘルプが表示されます。これは仕様です。設定したメッセージが以前と同じものであったとしても，この点は変わりません。マウスポインターの移動中にコマンドを実行すると，ヘルプTipsが絶えず点滅し，ユーザーに不快な印象を与えるかもしれませんので，注意が必要です。

<i class="fa fa-external-link" aria-hidden="true"></i> [OBJECT SET HELP TIP](https://doc.4d.com/4Dv17/4D/17.1/OBJECT-SET-HELP-TIP.301-4179220.ja.html)
