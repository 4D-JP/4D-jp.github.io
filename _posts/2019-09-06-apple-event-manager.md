---
layout: post
title: "Apple Event ManagerとMESSAGE"
date: 2019-09-06 12:00:00
categories: 仕様
tags: userinterface
---

``On System Event``は，アプリケーションが最前面から移動したときなどに発生するデータベースイベントです。``On System Event``データベースメソッドが存在する場合，システムイベントを監視するためにウィンドウを表示しない常駐プロセスが作成されます。このプロセスで``MESSAGE``コマンドを実行した場合，「Apple Event Manager」ウィンドウが表示され，閉じることができません。これは仕様です。なお，「Apple」という名称は歴史的な経緯によるものであり，オペレーションシステムとは無関係です。

``MESSAGE``を使用する場合，明示的にウィンドウを作成することが推奨されています。ウィンドウを作成せずに``MESSAGE``を使用した場合，カレントプロセスの非表示ウィンドウが暗黙的に使用され，プロセスが消滅すると同時にそのウィンドウが閉じられます。それが常駐プロセスだった場合，プロセスと``MESSAGE``コマンドは互いに相手が終了するまで待機することになり，ウィンドウ/プロセスを閉じることができません。

``MESSAGE``コマンドを使用していないのにも関わらず「Apple Event Manager」ウィンドウが表示される場合，空の``On System Event``データベースメソッドが存在する可能性があります。システムイベントを監視する必要がある場合，イベント処理ループがブロックしないよう，新規プロセスを作成することができます。
