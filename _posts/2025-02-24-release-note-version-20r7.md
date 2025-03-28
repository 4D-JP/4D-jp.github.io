---
layout: fix
title: "4D 20r7 Hotfix 2 修正リスト"
date: 2025-03-17 08:00:00
categories: 修正リスト
tags: 20r7 hotfix
build: 100390
version: "20r7"
permalink: /2025/55/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105476 データファイルの外にピクチャ型またはBLOB型のフィールドを保存できなかった場合，アプリケーションがクラッシュしました。ACI0105050が修正されたことによる副作用のようです。

* ACI0105429 パッケージ内にバイナリモードとプロジェクトモードの両方が存在する場合，プロジェクトモード特有の設定を保存すると，バイナリモードにも設定が表示されました。バイナリモードとプロジェクトモードの設定は別々に管理されるべきです。ACI0105154と関連があります。モードを切り替える前にアプリケーションを終了すれば問題ありません。

* ACI0105460 *On Timer* イベントでコレクション型のリストボックスの内容を交換した場合，メモリーリークが発生しました。

* ACI0105450 バイナリモードのみ。チェックボックス・ラジオボタン・ボタンに`1`文字だけのタイトル文字列を設定することができませんでした。

* ACI0105437 QUICネットワークレイヤーのみ。SQLクエリでレコードをロックしたプロセスが延期されている状態でクライアントを強制終了した場合，レコードがロックされたままになりました。

* ACI0105413 Mac版Apple Siliconターゲットのコンパイルモードのみ。	`Try(expression)`でコード実行がアボートされました。

**注記**: ランタイムが修正されました。再コンパイルの必要はありません。

* ACI0105382 バイナリモードのみ。チェックボックスのタイトルをスペース（` `）に設定した場合，代わりにコロン記号（`:`）が表示されました。
