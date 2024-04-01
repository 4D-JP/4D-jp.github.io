---
layout: fix
title: "View Proスプレッドシートのセル値をクリアしたときに発生するイベント"
date: 2024-02-28 08:00:00
categories: 仕様
tags: 20r4 viewpro
---

*backspace* キー，*delete* キー，コンテキストメニューなどで4D View Proのセルをクリアした場合に発生するイベントは*On After Edit* ではありません。[*On VP Range Changed*](https://developer.4d.com/docs/ja/Events/onVpRangeChanged)イベントが発生し，`FORM Event.action`プロパティには`clear`が返されます。これは仕様です。