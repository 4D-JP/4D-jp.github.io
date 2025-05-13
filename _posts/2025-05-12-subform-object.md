---
layout: fix
title: "サブフォームのフォームクラス"
date: 2025-05-12 08:00:00
categories: 仕様
version: 20r8
tags: orda userinterface projectmode class subform
---

20r8以降，フォームのプロパティで[フォームクラス](https://developer.4d.com/docs/ja/FormEditor/propertiesForm#フォームクラス)を定義することができます。[`DIALOG`](https://developer.4d.com/docs/ja/commands/dialog)の*formData* を省略してフォームを実行した場合，自動的にフォームクラスがインスタンス化されて`Form`オブジェクトとなります。

サブフォームにも`Form`オブジェクトの概念がありますが，フォームクラスが自動的にインスタンス化されるかどうかは，フォームの「式の型」で決まります。「式の型」が「オブジェクト」であれば，`Form`オブジェクトはインスタンス化されません。この方法は，`DIALOG`に*formData* を渡す用法に似ており，既存のオブジェクト（エンティティなど）をサブフォームにバインドしたいケースにおいて有効です。自動的にフォームクラスがインスタンス化されることを望むのであれば，「式の型」を「オブジェクト」以外に設定してください。