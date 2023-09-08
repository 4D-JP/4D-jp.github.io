---
layout: fix
title: "ログフォルダーの場所"
date: 2023-09-07 08:00:00
categories: 仕様
tags: programming debugging
---

[*Logs* フォルダー](https://developer.4d.com/docs/ja/Project/architecture/ )には，[プロジェクトが使用するすべてのログファイル](https://developer.4d.com/docs/ja/20/Debugging/debugLogFiles/)が格納されます。 v18以降，このフォルダーは[**データファイルと同階層**](https://doc.4d.com/4Dv20/4D/20/Description-of-4D-files.300-6263732.ja.html)に作成されるようになりました。

v17以前の *Logs* フォルダーは**ストラクチャファイルと同階層**に作成されました。ビルド版アプリケーションの場合，通常は書き込み禁止であるディレクトリにコンパイルされたストラクチャファイル（ *.4DC* ）またはパッケージされたプロジェクトフォルダー（ *4DZ* ）が置かれます。ログファイルは，ストラクチャファイルではなく，データファイルと同階層に作成したほうが実際的です。データファイルは基本的に書き込みができるディレクトリに作成されるからです。

*Logs* フォルダーのパスは，下記いずれのコマンドで取得することができます。

* [Get 4D folder](https://doc.4d.com/4Dv20/4D/20.1/Get-4D-folder.301-6480427.ja.html)
* [Folder](https://developer.4d.com/docs/ja/API/FolderClass/#folder)

上記の *Logs* フォルダーとは別に，[Maintenance & Security Center](https://doc.4d.com/4Dv20/4D/20/Maintenance-and-security-center.200-6263699.ja.html)が出力するメンテナンスログファイルを記録するための  *Logs* フォルダーが存在します。こちらのフォルダーは，[Get 4D folder](https://doc.4d.com/4Dv20/4D/20.1/Get-4D-folder.301-6480427.ja.html)からパスが返されるユーザー設定フォルダーに作成されます。なお，本来の  *Logs* フォルダーが使用できない場合，プロジェクトが使用するログファイルもこちらのフォルダーに記録されます。