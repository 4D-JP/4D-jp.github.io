---
layout: fix
title: "プロセスタイプ「なし」とは"
date: 2026-07-01 08:00:00
categories: 仕様
tags: programming
---

[`Get process activity`](https://developer.4d.com/docs/ja/commands/process-activity)および[`Process info`](https://developer.4d.com/docs/ja/commands/process-info)は，プロセスのタイプに`0`を返すことがあります。プロセスが終了した後，プロセスリストに反映されるまでには少しの遅延があり，その間はプロセスタイプが「なし」となるためです。