---
layout: post
title: "クエリエディターの日付フォーマット"
date: 0000-00-00 12:00:00
categories: 仕様
tags: userinterface
---

v14以降でリニューアルされたクエリエディターは，日付型フィールドの区切り文字をシステムフォーマット（[``GET SYSTEM FORMATS``](https://doc.4d.com/4Dv17/4D/17.3/Get-system-info.301-4621522.ja.html)）に基づいて決定しています。通常の日付フィールドのように，「スラッシュ・ピリオド・ハイフン（ダッシュ）」が常に使用できるわけではありません。これは仕様です。
