---
layout: fix
title: "4D v17.3 修正リスト"
date: 2019-09-11 08:00:00
categories: 修正リスト
tags: "17.3"  
build: 240828
version: 17.3

---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0099901 インデックスが設定されたオブジェクト型エンティティに対し，複数のプロセスが同時にアクセスした場合，アプリケーションがデッドロック状態に陥ることがありました。

* ACI0099889 Write Proドキュメントのテキストをすべて選択し，フォントのサイズ・カラー・スタイルを変更した場合，文末の空行には変更が適用されませんでした。

* ACI0099619 64ビット版のみ。FTPコマンドでファイルがダウンロードできないことがありました。``FTP_GetDirList``は``MDTM``コマンドを送信しますが，サーバーがこのコマンドをサポートしていない場合，``FTP_Receive``でエラーが返されました。

* ACI0099868 Windows版のみ。SDIモードでアプリケーションを実行した場合，ボールド体またはイタリック体のようなスタイルが設定された項目が含まれるメニューのテキストはすべて空になりました。

* ACI0099860 Mac 旧式ネットワークレイヤーのみ。サーバー管理画面の「アプリケーションサーバー」ページから「プロセス」ページに切り替えたタイミングでアプリケーションがクラッシュすることがありました。

* ACI0099616 メソッドエディターで``command``/``control``+``L``のキーボードショートカットを入力しても，「行番号に移動」ダイアログが表示されませんでした。

**注記**: 同一のデフォルトショートカットが複数のアクションに対して設定されていることが原因です（他方は「エクスプローラー/フォームにジャンプ」）。設定の重複はACI0070697（v12）から存在しますが，メソッドエディターが64ビット版に移行したことにより，不具合が発生しました。修正により，デフォルトのショートカットは``command``/``control``+``alt``+``L``に変更されました。

* ACI0099784 Mac版のみ。多数のプロセスで同時に``Semaphore``でグローバルセマフォにアクセスした場合，プロセスが終了した後もシステムスレッドが残存し，やがてアプリケーションがクラッシュする恐れがありました。ローカルセマフォでは問題ありません。

**注記**: タイムアウトを指定したセマフォコマンドのコードにメモリーリークがありました。``Semaphore``をスレッドセーフにするために実施された過去の改修に問題がありました。

* ACI0099609 プラグインSDKのエントリーポイント``PA_GetVariable``で名前にアクセント文字が含まれている変数にアクセスした場合，変数が未定義とみなされました。
