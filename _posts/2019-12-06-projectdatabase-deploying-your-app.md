---
layout: post
title: PROJECT DATABASESシリーズ：アプリケーションの運用
date: 2019-12-06 02:00:00
categories: Tips PROJECTDATABASESシリーズ
tags: 18.x programming
author: Vanessa Talbot
---

![project-database-stylesheet](/images/blog/12-06/ProjectDatabase_Deployment.png)

アプリケーションの運用を次のステップへ進めましょう。4D v18を使えば：

* インタプリタコードを含まないコンパイルされたデータベースを生成
* ダブルクリックできるスタンドアロンアプリケーションを生成（例：4Dボリュームデスクトップや4Dデータベースエンジンとマージ）
* クライアントとサーバーのパーツを自動でアップデートするクライアント/サーバー・アプリケーションを生成

<a href="https://blog.4d.com/tag/project-database/">プロジェクトデータベース</a>を使えば、<a href="https://developer.4d.com/docs/en/Project/deploying.html">最終的なアプリケーションのビルド</a>を両方のプラットフォームでビルドすることもできます。<a href="https://blog.4d.com/tag/project-database/">プロジェクトデータベース</a>は、バイナリーデータベースとして同じコンフィギュレーションファイルを使います。

#### ステップ１：コードのコンパイル
バイナリーデータベース (.4db)と同じ方法でプロジェクトデータベースをコンパイルすることができます。二つのデータベース間の違いはわずかです。インターフェイスは同じで、プロダクトマシンコードは同じです。

唯一の違いは、コンパイルされた結果が、バイナリーデータベースではバイナリーファイル (.4db)に保存されるのに対して、プロジェクトデータベースでは"Project/DerivedData/CompliedCode"フォルダに保存されることです。

#### ステップ２：アプリケーションの作成
コードをコンパイルするのと同じ方法で、アプリケーションを作成するのに変えることはありません。

* コンパイルされたデータベース
* コンポーネント
* スタンドアロンアプリケーション
* クライアント/サーバー・アプリケーション

変換されたプロジェクトデータベースと同じコンフィギュレーションファイルを使うことができます。

プロジェクトデータベースを使うときは常に、<a href="https://4d-jp.github.io/2019/11/12/project-database-architecture/">違いは生成されたファイル</a>中にあります。作成されたアプリケーションのコンテンツを見れば、"4dc"ファイルの替わりに".4dz"拡張子のファイルがあります。

#### 具体的なサンプル

以下のビデオでは、バイナリーデータベースからコンパイルされたデータベースを生成しています。そのあと、同じことをプロジェクトデータベースで行なっています。プロジェクトデータベースはバイナリーデータベースの変換の結果です。

ビデオの最後に、得られたファイルのサイズを比較しています。.4dzは.4dcに比較して5倍小さくなっています。

<p style="text-align: center;"><iframe src="https://www.youtube.com/embed/3gaLJvIdExU" width="560" height="314" frameborder="0" allowfullscreen="allowfullscreen"></iframe>" </p>
