---
layout: post
title: "プロジェクトモードの16ビット整数サポート"
date: 2019-12-31 12:00:00
categories: 仕様 
tags: 17.x projectmode
version: 17.x
---

プロジェクトモードで``WA Evaluate JavaScript``をインタープリター実行した場合，型が``Is integer``の値を受け取ることはできません。バイナリモードまたはコンパイルモードでは問題ありません。これは仕様です。新しいプロジェクトモードでは，``Is integer``のように廃止予定の仕様は，原則的に実装されていません。``Is longint``を代わりに指定してください。
