---
layout: post
title: "Write Proの印刷"
date: 2020-07-28 12:00:00
categories: 仕様
tags: 18.x writepro
---

Write Proの標準アクション[``print``](https://doc.4d.com/4Dv17/4D/17/Using-4D-Write-Pro-standard-actions.200-3726284.ja.html#3611767)は，プレビューを表示してからページビューモードで印刷を実行します。つまり，ヘッダーやフッターが非表示に設定されていれば，印刷されません。

コマンドの[``WP PRINT``](https://doc.4d.com/4Dv17/4D/17/WP-PRINT.301-3726306.ja.html)をすれば，プレビューを省略することができますが，印刷されるのはドキュメント全体なので，ヘッダーやフッターも印刷されることになります。これは仕様です。
