---
layout: post
title: "サーバーの検索とローカルキャッシュの仕組み"
date: 2021-05-18 12:00:00
categories: Tips
tags: development build server
version: 18r5
---

ビルド版のクライアントアプリは，公開名またはIPアドレスに基づき，自動的にサーバーを発見して接続を試みますが，`Alt`キーを押しながら起動することにより，「サーバーに接続」ダイアログでサーバーを指定することもできます。同一マシン上に同名のクライアントアプリがインストールされている場合，それぞれのクライアントで接続したサーバーの情報は，いずれも同じ設定ファイルに記録されるため，最後に終了したクライアントのサーバーがデフォルトのサーバーとなります。これは仕様です。

**サーバー側**のキャッシュフォルダーパスは「アプリケーション/ストラクチャ名」です。v18r5以降，ビルドプロジェクトファイル（*buildApp.4DSettings*）の`ServerStructureFolderName`でキャッシュフォルダーパスのストラクチャ名を設定できるようになりました。この仕組みは，同名のサーバーアプリケーション（たとえばバージョン違い）を同一マシンにインストールするような場合に便利です。

<i class="fa fa-external-link" aria-hidden="true"></i> https://blog.4d.com/multiple-instances-of-merged-server-applications-on-the-same-machine/

**サーバー側**のキャッシュフォルダー名は，*Info.plist*ファイルに書き込まれています。

```xml
<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>com.4d.ServerCacheFolderName</key>
    <string>myCacheFolder</string>
  </dict>
</plist>
```

**クライアント側**のキャッシュフォルダー名は「ストラクチャ名_サーバーアドレス_ポート番号_ハッシュ値」です。３桁のハッシュ値は，クライアントアプリのファイルパスに基づいて計算されます。v18r5以降，ビルドプロジェクトファイル（*buildApp.4DSettings*）の`ClientServerSystemFolderName`でキャッシュフォルダー名をカスタマイズできるようになりました。この仕組みは，別々のサーバーに接続する同名のクライアントアプリケーションを同一マシンにインストールするような場合に便利です。

<i class="fa fa-external-link" aria-hidden="true"></i> https://blog.4d.com/multiple-servers-one-shared-local-resources/

クライアントアプリは，ストラクチャ名・サーバーアドレス・ポート番号がすべて一致するローカルキャッシュを利用し，内容が変更されていない限り，サーバー側のキャッシュからリソースをダウンロードしません。この仕組みにより，後から同名の別サーバーに接続したクライアントアプリにより，キャッシュフォルダーが書き換えられてしまうことはありません。

**クライアント側**のキャッシュフォルダー名は，データベースリンクファイル（*.4DLink*）で指定することもできます。

```xml
<database_shortcut 
  is_remote="true" 
  server_database_name="Test" 
  server_path=":19813" 
  cache_folder_name="clientCacheFolderName" />
```

つまり，ビルド版クライアントアプリの*EnginedServer.4DLink*と同じ使い方ができます。

v18では，起動後，すぐにサーバーに接続するクライアントアプリ（過去バージョンの4D Client）ではなく，ビルド版のデスクトップアプリから任意のタイミングでサーバーに接続することができます。下記の要領でサーバーに接続することができます。

```4d
OPEN DATABASE("path_to_server.4dlink")
```

起動時にサーバーを検索する代わりにローカルのデータベースプロジェクトを開始するには，ビルドプロジェクトファイル（*buildApp.4DSettings*）の`DatabaseToEmbedInClientWinFolder` `DatabaseToEmbedInClientMacFolder` を使用します。これらのキーが設定されている場合，*EnginedServer.4Dlink* の代わりにデータベースプロジェクト（*.4DC* または *.4DZ*）がビルド版クライアントアプリの *Database* フォルダーにコピーされます。*Default data* の仕組みを併用することにより，初回起動時に「データファイルを開く」ダイアログが表示されることを回避できます。

<i class="fa fa-external-link" aria-hidden="true"></i> https://blog.4d.com/deployment-made-easy-with-4d-v18/
