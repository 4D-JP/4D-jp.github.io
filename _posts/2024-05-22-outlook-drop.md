---
layout: fix
title: "添付ファイルのドラッグ＆ドロップ"
date: 2024-05-20 08:00:00
categories: 仕様
tags: programming draganddrop
---

*Outlook* アプリのプレビュー表示から4Dの入力エリアに添付ファイルを直接ドラッグ＆ドロップすることはできません。`Pasteboard data size("com.4d.private.file.url")`が`-102`を返すことからわかるように，ファイルがドロップされているわけではないからです。