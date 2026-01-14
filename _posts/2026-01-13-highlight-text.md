---
layout: fix
title: "HIGHLIGHT TEXTの改良"
date: 2026-01-13 08:00:00
categories: 仕様
tags: userinterface 
---

v21では[`HIGHLIGHT TEXT`](https://developer.4d.com/docs/ja/commands/highlight-text)が改良され，サブフォームの実行コンテキストでもコマンドが使用できるようになりました。新しい仕様は[`GOTO OBJECT`](https://developer.4d.com/docs/ja/commands/goto-object)の動作に準拠します。

* バージョン21

> `HIGHLIGHT TEXT`コマンドは、サブフォームのコンテキストにおいて使用することも可能です。コマンドがサブフォームから呼ばれた時、最初にサブフォーム内にてオブジェクトを探し、探してもそこに何もいないと分かれば親フォームのオブジェクトへと検索対象を広げます。

* バージョン20 R10

> 注: このコマンドをサブフォームのフィールドに対して使用することはできません。