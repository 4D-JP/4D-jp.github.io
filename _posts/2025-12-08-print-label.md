---
layout: fix
title: "ラベル印刷とプリントジョブ"
date: 2025-12-08 08:00:00
categories: 仕様
tags: printing 
---

[`OPEN PRINTING JOB`](https://developer.4d.com/docs/ja/commands/open-printing-job)で開始したプリントジョブ内で[`PRINT LABEL`](https://developer.4d.com/docs/ja/commands/print-label)を使用することは想定されていません。

ラベル印刷は，内部的に[`Print object`](https://developer.4d.com/docs/ja/commands/print-object)を実行するコンポーネントメソッドとして実装されていますが，そのメソッド自体が[`OPEN PRINTING JOB`を実行している](https://github.com/4d/4D-Labels/blob/20.x/Project/Sources/Methods/Print_Label.4dm#L145)ためです。

なお，`OPEN PRINTING JOB`を続けて実行した場合，エラーは発生せず，重複コマンドは何もしませんが，`PRINT LABEL`が内部的に`CLOSE PRINTING JOB`を実行した時点ですべてのジョブが終了するため，続く印刷コマンドが失われてしまうことに留意してください。
