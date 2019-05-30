---
layout: technote
title: "4D World Tour 2019（１日目）"
author: Keisuke Miyako
date: 2019-05-28 00:00:00
permalink: /event/2019-05-28/
standalone: true
---

## 4D Remote のプリエンプティブモード
---

### Begin SQL/End SQL

カレントセレクションを変更しないクエリは，ORDAで記述することができます。今後，SQL言語を拡張する予定はありません。しかし，既存をコードをサポートするため，``Begin SQL`` ``End SQL``ブロックがプリエンプティブモード対応になりました。

#### 用途

- ローカルデータベース
- C/Sアプリケーション
- エクスターナルデータベース（``USE DATABASE``）

#### 非サポート

- ODBC
- INTO LISTBOX
- QUERY BY SQL
- REPLICATE/SYNCHRONIZE
- SQL LOGIN
