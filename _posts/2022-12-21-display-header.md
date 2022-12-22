---
layout: post
title: "ヘッダー/フッターの表示"
date: 2022-12-21 12:00:00
categories: 仕様
tags: userinterface projectmode
---


リストボックスには「[ヘッダーを表示/フッターを表示](https://doc.4d.com/4Dv19R7/4D/19-R7/List-box-specific-properties.300-6013457.ja.html)」というプロパティがあります。バイナリモードでは，このプロパティを選択しなかった場合，`OBJECT SET VISIBLE`はヘッダーやフッターに対して効果がありません。

プロジェクトモードでは，`showHeaders`プロパティを`false`に設定した場合，オブジェクトはデフォルトで表示されませんが，`OBJECT SET VISIBLE`でヘッダーやフッターを表示することができます。これは仕様です。
