---
layout: post
title: "Webプロセスのエラー処理"
date: 2021-10-22 11:31:00
categories: 仕様
tags: web programming
version: 17
---

*On Web Connection*や*On Web Authentication*など，HTTPリクエストで実行されたデータベースメソッドのシンタックスエラーは表示されません。これは仕様です。`ON ERR CALL`でエラーハンドリングメソッドがインストールされていないWebプロセスでランタイムエラーが発生した場合，メソッドは中断され，レスポンスとしてエラーHTMLページがユーザーエージェントに返されます。
