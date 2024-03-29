---
layout: post
title: "データソースとカレント項目プロパティの同期"
date: 2022-08-08 12:00:00
categories: 仕様 
tags: collection listbox userinterface
version: 19.x
---

コレクション型リストボックスのカレント項目プロパティには選択行のオブジェクトが自動的に代入されます。選択行は，キーボード/マウス操作あるいは`LISTBOX SELECT ROW`コマンドで変更することができます。

リストボックスのデータソースを直接ランゲージで操作するような場合は注意が必要です。たとえば`collection.remove()`でカレント項目をコレクションから削除した場合，画面上はリストボックスの当該行が消え，それが最下行でなければ，繰り上がった行が選択されてように表示されますが，カレント項目プロパティは更新されず，削除されたオブジェクトのままとなります。そのオブジェクトの位置を特定するために`collection.indexOf()`を使用すると`-1`（オブジェクトはコレクションに含まれないので正しい）が返されますが，この値を`collection.remove()`に渡すと相対指定となり，最終行が削除されることになります。

このようなケースでコレクション型リストボックスのカレント項目プロパティが更新されないのは仕様です。

リストボックスコマンドやユーザーインタフェースを介さずにコレクションを操作した場合，`LISTBOX SELECT ROW`コマンドを使用し，明示的に行を選択するか，選択を解除する必要があります。コマンドを使用することにより，データソースとカレント項目プロパティの同期を取ることができます。
