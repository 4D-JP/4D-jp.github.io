---
layout: post
title: "MDIウィンドウの閉じるボタン"
date: 2019-04-16 10:18:00
categories: 注意点
tags: 17.x windows
---

Windows版でMDIウィンドウの閉じるボタンをクリックしたり，``Alt``+``F4``を入力したり，タイトルバーの左端にあるウィンドウメニューの「閉じる」アクションを実行したりしても，アプリケーションが終了しない場合，アプリケーション「終了」アクションがきちんと設定されているか，確認してください。

「終了」アクションが実行されるためには，「終了」標準アクションが設定された項目がメニューに存在しなければなりません。「終了」メニューを設定することにより，Windows版でMDIウィンドウの「閉じる」ボタンがこのメニュー項目に関連付けられます。Mac版では，アプリケーションメニューに「…を終了」という項目が追加され，代わりに本来の項目がメニューから取り除かれます。

このメニュー項目にプロジェクトメソッドが設定されていない場合，項目を選択すると，自動的に確認ダイアログが表示され，終了することに同意すると，アプリケーションの終了プロセスが始まります。

このメニュー項目にプロジェクトメソッドが設定されている場合，項目を選択すると，確認ダイアログは省略され，すぐにアプリケーションの終了プロセスが始まります。

「終了」標準アクションが設定された項目がメニューに存在しない場合，MDIウィンドウの「閉じる」ボタンをクリックしても何も起きません。
