---
layout: post
title: "整数値のオーバーフロー"
date: 2020-02-24 08:00:00
categories: 仕様
tags: 17.x windows mac
---

64ビット整数型のフィールドに登録されている符号なし整数値を符号あり32ビット整数型の変数（``C_LONGINT``）に代入した場合，インタープリターモードにおけるオーバーフロー値（例：``30,000,000``）の扱いは，プラットフォーム依存となります。これは仕様です。Windowsでは，オーバーフロー値が``0``になりますが，Macではなりません。そのため，クエリや演算の結果がプラットフォーム間で違うことがあります。なお，コンパイルモードでは，どちらのプラットフォームでも同じ結果になります。いずれにしても，整数値オーバーフローの動作は「未定義」ですので，特定の動作を前提にしたコーディングは避けるべきです。たとえば，整数を``C_REAL``で処理できるかもしれません。
