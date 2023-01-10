---
layout: post
title: "印刷プレビューの設定解除"
date: 2023-01-09 12:00:00
categories: 仕様
tags: userinterface mac printing
---


Mac版で`PRINT SETTINGS`を使用して印刷ダイアログを表示した場合，ポップアップメニューで「プレビューで開く」という項目を選択することができます。このオプションを使用した直後，同一プロセスで実行した印刷コマンドは，`SET PRINT OPTION`で*Destination option* を`1`（直接プリント）に指定したり，`Print settings to BLOB`で印刷設定を元に戻したりしても，デフォルトで「プレビューで開く」が実行されることになります。これはオペレーションシステムの仕様です。 プレビュー設定を解除するためには，新規プロセスで印刷するか，下記のコードを実行する必要があります。

```4d
SET PRINT PREVIEW(False)
```
