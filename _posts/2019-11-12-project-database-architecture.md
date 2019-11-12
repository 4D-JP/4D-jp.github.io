---
layout: post
title: PROJECT DATABASESシリーズ：アーキテクチャ
date: 2019-11-12 02:00:00
categories: Tips
tags: 18.x programming
author: Vanessa Talbot
---

![project-database-architecture](/images/blog/11-06/ProjectDatabase_Architecture.png)

<a href="https://blog.4d.com/project-databases-more-than-a-collaboration-solution">プロジェクトデータベース</a>は、4D v18リリースのヘッドラインで、チームがコラボレートして作業できるように、アプリケーションのコードをソース管理システムの中に保存することができます。そのテキストファイルの中には、フォーム、メニュー、ユーザー設定、あらゆる必要なリソースを含めて、データベース・ストラクチャからユーザー・インターフェイスまであります。そして、プロジェクトデータベースはテキストベースのファイルでできているため、いくつかのフォルダとファイルを一つの親データベース・フォルダの中に保存します。このブログでは、プロジェクトデータベースのアーキテクチャを見ていくことで、新しいタイプのデータベースをよりよく理解しましょう。

#### PROJECT DATABASEのアーキテクチャ
プロジェクトデータベースは、一つの親データベース・フォルダの中に保存された、<a href="https://developer.4d.com/docs/en/Project/architecture.html">いくつかのフォルダとファイル</a>で構成されています。

![project-database-architecture-2](/images/blog/11-06/architecture-522x1024.png)

プロジェクトデータベースを作成する時、ほとんどのフォルダが同じ伝統的なバイナリーデータベースであることに気づくでしょう：

* データ
* ログ
* リソース
* セッティング
* ウェブフォルダ
プロジェクトデータベースは二つの追加フォルダを含みます：
* Project – アプリケーション・ソースコード（4DBと同等）
* userPreferences.<name> - このフォルダはユーザー設定（例：ブレークポイントの位置、ウィンドウ位置など）を記憶するファイルを含みます。

#### プロジェクトとソース管理
プロジェクトデータベースの中にフォルダとファイルがあることが分かりましたが、どのフォルダとファイルをソース管理システムにアップロードすべきでしょうか？おそらく、<strong>Resource</strong>と<strong>Project</strong>フォルダと考えるでしょう。では、データベースをコンパイルするときに、4Dは”<strong>Project/DerivedData</strong>”フォルダにコンパイルしたコードを保存します。従いまして、”<strong>Resources</strong>”フォルダ、”<strong>WebFolder</strong>”、”<strong>Project</strong>”フォルダ（サブフォルダの”<strong>DerivedData</strong>”は不要）をソース管理システムにアップロードすることをお勧めします。

#### バイナリーデータベースvs プロジェクトデータベース
このビデオでは、バイナリーデータベース(.4DB)とプロジェクトデータベース (.4DProject)のアーキテクチャを比較します。

例えば、自分のバイナリーデータベースを開くには、”.4db”あるいは”.4dc”拡張子のファイルを選択します。project データベースで同等のものは何でしょう？それは”.4DProject”拡張子のファイルです。

コンパイルされたデータベースに対して、”.4DC”に代わるものは何でしょう？バイナリーデータベースでは、アプリケーションのソースコードは”.4DB”と”.4DIndy”拡張子のファイルにありました。プロジェクトデータベースでは、ストラクチャに関係するフォルダやファイルはどこにあるのでしょう？

これらの疑問の答えは下記のビデオで見つかります：
<p style="text-align: center;"><iframe src="//www.youtube.com/embed/xNHKSCAdwPg" width="560" height="314" allowfullscreen="allowfullscreen"></iframe></p>



