---
layout: post
title: "ラベル印刷は単独ジョブ"
date: 2023-02-20 09:00:00
categories: 仕様
tags: printing
---

`OPEN PRINTING JOB`で印刷ジョブを開始すれば，`PRINT SELECTION`や`PRINT RECORD`といった印刷コマンドを組み合わせて実行することができますが，`PRINT LABEL`を混ぜることはできません。これは仕様です。`PRINT LABEL`は内部的に印刷ジョブを開始するようになっており，毎回，単独で実行する必要があります。
