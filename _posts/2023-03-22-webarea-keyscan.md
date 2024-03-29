---
layout: post
title: "Windows版のWebエリアとキーボード入力"
date: 2023-03-22 09:00:00
categories: 仕様
tags: windows userinterface webarea
---

WindowsプラットフォームでCEF版のWebエリアにバーチャルリアリティ系のWebサイト（キーボード操作で仮想空間の中を探索できるようなもの）を表示した場合，キーボード操作に対する反応がシステム版のWebエリアやMacと比べてずっと遅く感じるかもしれません。これは仕様です。

4Dには，ショートカットや*On Before Keystroke* イベントなど，キーボード入力に対するフックが実装されているので，そのようなイベントはまず4Dに送られます。バーチャルリアリティ系のWebサイトは，イベント駆動ではなく，ループ処理の中で絶えずキーボードの状態をスキャンするように設計されているので，4Dから逐次イベント情報を受け取るような役割に向いていません。一般的に言って，そのようなサイトはブラウザに表示することが前提となっており，Webエリアの中に組み込んで実行することは想定されていないことに留意する必要があります。

v20では，Webエリアの新しい設定として，キーボードイベントを4D側では捕捉せず，直接Webエリアに送信できるようになる予定です。設定を有効にした場合，前述したようなパフォーマンスの問題は解消されますが，当該Webエリアを表示している間は，4Dのキーボードショートカットやキーボード入力系のフォームイベントなどがすべて無効になります。

