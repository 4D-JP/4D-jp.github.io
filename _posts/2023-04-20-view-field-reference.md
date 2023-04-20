---
layout: post
title: "View Proに変換されないフィールド参照"
date: 2023-04-20 09:00:00
categories: 注意点
tags: userinterface projectmode
---

`VP Convert from 4D View`は4D Viewプラグインで作成したドキュメントをView Proスプレッドシートに変換するコマンドです。フィールドに対する単純な参照は対応するView Proスプレッドシートのフォーミュラに変換されますが，文字列とフィールドを組み合わせたフォーミュラは変換されません。これは仕様です。
