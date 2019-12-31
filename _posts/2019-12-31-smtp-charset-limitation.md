---
layout: post
title: "日本語以外のOSで日本語の添付ファイルを送信"
date: 2019-12-31 12:00:00
categories: 仕様 
tags: 17.x internetcommands
version: 17.x
---

4D Internet Commandsの``SMTP_Attachment``コマンドでメールにファイルを添付する場合，地域と言語の設定が「日本語」以外に設定されているWindows環境で日本語のファイル名を指定すると，エラー``-43``が返されます。これは仕様です。4D Internet Commandsは，互換性のために提供されている旧式のプラグインであり，互換性を持たせるため，4Dの本体とは違い，非UnicodeのHFSファイルAPIを現在でも使用しています。問題が生じるようなケースでは，4D Internet Commandsを使用するのではなく，標準コマンド（トランスポーター）でメールを送信することが勧められています。
