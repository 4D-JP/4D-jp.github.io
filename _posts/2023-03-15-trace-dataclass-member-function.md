---
layout: post
title: "データクラスのデバッグ"
date: 2023-03-14 09:00:00
categories: 仕様
tags: development orda debugging
---

ORDAデータクラスのメンバー関数はサーバー側で実行されます（[ローカルスコープ](https://blog.4d.com/ja/orda-improve-your-api-with-function-scope/)を設定しなかった場合）。クライアント側でデバッグするのであれば，[リモートデバッガー](https://doc4d.github.io/docs/ja/Debugging/debugging-remote/)の使用を検討してください。v19以降，[サーバー側のメソッドをクライアント側でデバッグできるようになりました](https://blog.4d.com/ja/remote-debugger-debug-server-code-on-the-client/)。
