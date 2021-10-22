---
layout: post
title: "クイックレポートの区切り文字"
date: 2021-10-22 11:31:00
categories: 仕様
tags: quickreport programming
version: 17
---

クイックレポートの出力パスを変更せずにレコードやフィールド区切り文字だけを変更した場合，つまり`QR SET DOCUMENT PROPERTY`で`qr field separator`をセットした場合，新しい区切り文字はレポート設定に反映されません。これは仕様です。クイックレポートエディターは内部的に`QR BLOB TO REPORT`をコールしていますが，コマンドで区切り文字だけを更新することができないためです。区切り文字を変更するためには，まず，出力パスを変更し，それから新しい設定を保存する必要があります。
