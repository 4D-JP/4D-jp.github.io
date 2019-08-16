---
layout: post
title: "SQLユーザーとCurrent userの関係"
date: 2019-08-16 12:00:00
categories: 仕様
tags: sql
---

SQLでログインする場合，``On SQL Authentication``データベースメソッドで``CHANGE CURRENT USER``コマンドを実行し，SQLセッションのアクセス権を明示的に付与することが必要です（データベースメソッドが存在する場合）。

v11では，SQLの実行コンテキスト（たとえばトリガ）で``Current user``を使用することができませんでした。返されるのは，直近の``On SQL Authentication``データベースメソッドで付与されたユーザー名であり，カレントSQLセッションのユーザー名であるとは限らなかったからです。SQLセッションは``On SQL Authentication``データベースメソッドで付与されたアクセス権で実行されていますが，そのアクセス権を``Current user``で取得できるとは限りません。

v12以降，SQLの実行コンテキストで``Current user``を使用した場合，SQLセッションのアクセス権がそのまま返されるようになりました。ただし，SQLの実行コンテキスト（たとえばトリガ）で``CHANGE CURRENT USER``コマンドを実行した場合，4Dのカレントユーザーが変更され，``Current user``とSQLセッションのアクセス権が一致しないことになります。いずれにしても，``On SQL Authentication``データベースメソッドでSQLセッションに付与されたアクセス権は，ログアウトするまで有効であり，途中，``CHANGE CURRENT USER``コマンドに影響されることはありません。
