---
layout: post
title: "CLOSE WINDOWは必要"
date: 2020-12-31 12:00:00
categories: 仕様
tags: programming graphics userinterface
---

`DIALOG`コマンドで表示したダイアログは，確定またはキャンセル後にウィンドウが自動的に閉じられますが，明示的に`CLOSE WINDOW`で閉じることが推奨されています。たとえば，`Movable form dialog box`でダイアログ表示した直後，`CLOSE WINDOW`を呼び出さずに`Create document`などのファイルシステムコマンドを実行した場合，モーダルウィンドウ閉じられる前にウィンドウが表示されてしまい，背後のウィンドウが操作できなくなるかもしれません。
