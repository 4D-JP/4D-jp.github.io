---
layout: fix
title: "4D v18 修正リスト"
date: 2020-11-19 08:00:00
categories: 修正リスト
tags: "18.3"
build: 258468
version: 18.3
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0101350 Windows版のみ。ラベル設定ファイル（`*.4lbp`）を上書き保存しようとした場合，新規ファイルが作成され，拡張子が二重に追加されました。

* ACI0098362 `.eml`ファイルの添付ファイルが`MSG_HasAttach`に認識されないことがありました。

* ACI0101175 フォルダー名にウムラウト記号が含まれる場合，`IMAP_SetPrefs`および`POP3_SetPrefs`からエラー`-43`が返されました。

* ACI0101414 `MAIL Convert from MIME`でMIMEを処理した場合，``Content-Disposition``ヘッダーの``name``パラメーターが正しく解析されませんでした。通常，`name`は`Content-Type`ヘッダーに記述されますが，Thunderbirdのようなメールクライアントはどちらに記述されていたとしても添付ファイル名を表示することができます。
