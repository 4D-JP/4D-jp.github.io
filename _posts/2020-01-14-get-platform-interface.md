---
layout: post
title: "Get platform interfaceの廃止"
date: 2020-01-14 12:00:00
categories: 仕様 
tags: 18.x userinterface
version: 18.x
---

v18以降，``_O_Get platform interface``を実行すると「実装されていないコマンドまたは関数」エラー``33``が返されるようになりました。これは仕様です。このコマンドはv13で廃止されましたが，コードを書き換えが完了するまで，そのままメソッドをコンパイルできるよう，無効なトークンとして残されていました。17r5で32ビット版のリリースが終了されたことに伴い，コマンドは正式に廃止されています。プラットフォーム情報は，``Is macOS``, ``Is Windows``, ``Get system info``等の関数で取得することができます。
