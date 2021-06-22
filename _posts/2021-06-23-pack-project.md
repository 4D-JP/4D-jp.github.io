---
layout: post
title: "ARRAY TO LISTとSAVE LIST"
date: 2021-06-23 12:00:00
categories: 仕様
tags: v19 project
---

プロジェクトモードでは，特に指定しない限り，書き込み禁止のパッケージ（拡張子`.4DZ`の圧縮されたプロジェクトフォルダー）がビルドされます。ビルド後にプロジェクト（ストラクチャー）を更新することはできない点に留意してください。つまり，SQLでテーブルやフィールドを追加すること，`SAVE LIST` `ARRAY TO LIST` `SET PICTURE TO LIBRARY` `CREATE INDEX`などのコマンドは使用できません。これは仕様です。

アプリケーションが内部ファイルを書き換えることは一般的に推奨されていません。これにはインストール済みアプリケーションを部分的に更新すること，たとえばビルドされたアプリ内のストラクチャファイルを入れ替えることも含まれます。オペレーティングシステムやセキュリティソフトウェアは，そのようなアプリを「悪意のあるプログラム」とみなすかもしれません。

プロジェクトモードで開発したストラクチャをビルド後に書き換えるのであれば，オペレーティングシステムやセキュリティソフトウェアの監視対象からアプリケーションを外すことに加え，拡張子`.4DZ`の圧縮されたパッケージを作成するのではなく，コンパイルコードをそのままエクスポートする必要があります。そのようなアプリをビルドするには，ビルド設定ファイルの「PackProject」キーを使用します。

<i class="fa fa-external-link" aria-hidden="true"></i> https://doc.4d.com/4Dv19/4D/19/PackProject.300-5447945.ja.html

セキュリティ上のベストプラクティスに倣い，アプリケーションはRead Onlyモードで配付し，部分的にではなく，全体を入れ替えるような仕方でアップデートするべきです。

過去のバージョンで開発されたストラクチャの場合，アプリケーション配付の新しいアーキテクチャに合わせる必要があります。

##### 初回データファイルをRead Onlyにする

* v15で追加された[Default Data](https://doc.4d.com/4Dv18/4D/18/Data-file-management-in-final-applications.300-4575558.ja.html)

##### 最後に使用したデータファイルの場所をストラクチャに書き込まない

* v16で追加された[アプリケーション配布のアーキテクチャー](https://doc.4d.com/4Dv18/4D/18/Compatibility-page.300-4575476.ja.html)

##### データベース設定をストラクチャに書き込まない

* v16で追加された[データファイル用のユーザー設定](https://doc.4d.com/4Dv18/4D/18/User-settings.300-4575465.ja.html)

##### バックアップ設定をストラクチャと同じ階層に保存しない

* v18の[backup.4DSettings](https://doc.4d.com/4Dv18/4D/18/Configuration-and-trace-files.300-4575598.ja.html)

#### ストラクチャ書き換えコマンドを使用しない

* SET PICTURE TO LIBRARY
* SAVE LIST
* ARRAY TO LIST
* CREATE INDEX
* DELETE INDEX
* SET INDEX
* IMPORT STRUCTURE
* REGENERATE MISSING TABLE
