---
layout: post
title: "次回バックアップ予定の参照"
date: 2020-12-02 12:00:00
categories: 仕様
tags: 18.x backup
---

`GET BACKUP INFORMATION`コマンドに`Next backup date`セレクターを渡すことにより，次回に予定されているバックアップの日時を取得することができますが，この情報はバックアップ完了後に更新されるものなので，データベースメソッドの`On Backup Shutdown`で参照することはできません。これは仕様です。`On Backup Shutdown`は，バックアップ終了直前に発生するイベントですが，この時点ではまだバックアップ処理の途中であることに留意してください。
