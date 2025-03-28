---
layout: fix
title: "ログを使用"
date: 2024-07-18 08:00:00
categories: 仕様
tags: backup settings
---

4D 20 R2以前のバージョンでは，「ログを使用」設定のブール値がストラクチャファイルまたはカタログに記録されていました。4D 20 R3以降，ユーザー設定が有効にされていれば，設定が*backup.4DSettings* ファイル（XML形式）に記録され，優先的に適用されるようになりました（`JournalFileEnabled`キー）。どちらに保存されている場合も「ログを使用」は新規データファイル作成時に反映される設定です。

設定を有効にした場合，ユーザーはデータファイル作成時に[ジャーナルファイル](https://developer.4d.com/docs/ja/Backup/log/)を選択または作成するように促され，ジャーナルファイルのパスはデータファイルに記録されます。

そのようなデータファイル（バックアップから復元した場合を含む）を開いた場合，ジャーナルファイルのパスが無効であれば，たとえ「ログを使用」が無効であっても，ユーザーはデータファイル作成時にジャーナルファイルを選択または作成するように促されます。逆に「ログを使用」が有効であれば，データファイルにジャーナルファイルのパスが記録されていなくても，ユーザーはデータファイル作成時にジャーナルファイルを選択または作成するように促されます。これは仕様です。

<i class="fa fa-external-link" aria-hidden="true"></i> [ジャーナル管理の強化](https://blog.4d.com/ja/enhancing-the-journal-management/)