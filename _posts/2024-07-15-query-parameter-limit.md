---
layout: fix
title: "クエリのパラメーター数"
date: 2024-07-15 08:00:00
categories: 仕様
tags: orda query programming
---

クエリのパラメーター数には限度があります。Windowsの場合，約`3000`個のパラメーターでスタックオーバーフローになり，エラーが返されます。これは仕様です。
