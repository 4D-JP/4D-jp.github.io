---
layout: post
title: "On Getting Focusでアラート"
date: 2023-01-09 12:00:00
categories: 仕様
tags: userinterface
---

フォームイベントの*On Getting Focus* で`ALERT`を実行した場合，フォーカスを失ったテキスト入力オブジェクトがリドロー表示される前にアラートが表示されることになります。これはフォーカスを失ったオブジェクトの値を*On Getting Focus* で更新した場合に画面がちらつくことを防止するための措置であり，仕様です。フォーカスの移動と同時にアラートを表示したいのであれば，*On Getting Focus* で`ALERT`を実行するのではなく，`CALL FORM`や`SET TIMER`などの非同期コマンドを使用し，フォーカスの移動とは別のイベントサイクルでモーダルダイアログを表示することを検討してください。
