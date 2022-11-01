---
layout: post
title: "Windowsのポップアップメニュー"
date: 2022-10-31 08:00:00
categories: 仕様
tags: 19.x windows userinterface
---

Windowsでは，ドロップダウンメニューに表示された項目を矢印キーでハイライトするたびに値が確定されるため，*escape* キーでメニューをキャンセルしても，*On Data Change* イベントが発生します。これはシステムレベルの仕様です。
