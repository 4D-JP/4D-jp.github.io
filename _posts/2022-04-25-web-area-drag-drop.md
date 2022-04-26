---
layout: post
title: "Webエリアに対するドラッグ＆ドロップ"
date: 2022-04-25 15:00:00
categories: 仕様
tags: webarea userinterface
version: 19r5
---

19r5では，Webエリアの仕様が変更され，ファイルURLのドラッグ＆ドロップが自動的に処理されないようになりました。たとえばPDFファイルをWebエリアにドロップした場合，自動的にファイルが開かれるのではなく，代わりに[On Window Opening Denied](https://developer.4d.com/docs/ja/Events/onWindowOpeningDenied.html)フォームイベントが発生します。ドロップされたURLパスを検証し，必要に応じてファイルを処理することができます。なお，`WA OPEN URL`コマンドは，これまでどおりファイルURLを開くことができます。
