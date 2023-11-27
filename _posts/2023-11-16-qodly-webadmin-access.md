---
layout: fix
title: "データファイルの保護"
date: 2023-11-16 08:00:00
categories: 仕様
tags: qodly security webadmin
---

データストア（[`ds`](https://developer.4d.com/docs/ja/API/DataStoreClass/)）には，[.setAdminProtection()](https://developer.4d.com/docs/ja/API/DataStoreClass/#setadminprotection)というAPIが用意されています。この関数を実行すると，*WebAdmin* を介したデータアクセスが全面的にブロックされます。設定はデータファイルに書き込まれ，アプリケーションを再起動した後も有効です。

*Qodly Studio* は *WebAdmin* を介してデータにアクセスします。`.setAdminProtection()`を使用してアクセスを制限している場合，そのデータファイルには *Qodly Studio* でアクセスできないので注意してください。
