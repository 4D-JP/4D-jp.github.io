---
layout: post
title: "リストボックスのThis.valueは更新できない"
date: 2019-05-22 02:17:00
categories: 仕様
tags: 17.x ORDA listbox
---

コレクション型のリストボックスは，要素がオブジェクト型ではなくスカラー値（テキスト・数値・ブールなど）だった場合，``This.value``という特殊な表記で値を表示することができます。``This.value``は値のコピーであるため，新しい値を代入しても，元のコレクション要素を更新することにはなりません。これは仕様です。リストボックスに表示されたコレクションの要素を更新するのであれば，スカラー値ではなく，オブジェクト型のコレクションを使用してください。

<i class="fa fa-external-link" aria-hidden="true"></i> [This](https://doc.4d.com/4Dv17/4D/17.1/This.301-4178635.ja.html)
