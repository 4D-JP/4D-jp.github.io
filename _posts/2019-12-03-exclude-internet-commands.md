---
layout: post
title: "4D Internet Commandsをビルドに含めない"
date: 2019-12-03 10:00:00
categories: 仕様
tags: build
---

アプリケーションまたはストラクチャにインストールされているプラグインは，通常，すべてビルドしたアプリケーションのPluginsフォルダーにコピーされます。特定のプラグインを除外するには，アプリケーションビルド設定ファイル’（プロジェクトXML）の[``ArrayExcludedPluginID``](https://doc.4d.com/4Dv17R6/4D/17-R6/ArrayExcludedPluginID.300-4465686.ja.html)キーを使用します。

4D Writeや4D Viewなど，古いタイプのプラグインは，``15000``よりも若いIDが振られており，番号で識別されます。一方，4D Internet Commands（``15010``）のように``15000``以上のIDが設定されているプラグインは，番号ではなく，名前で識別されます。したがって，4D Internet Commandsをビルドしたアプリケーションから除外したい場合，[``ArrayExcludedPluginID``]ではなく，[``ArrayExcludedPluginName``](https://doc.4d.com/4Dv17R6/4D/17-R6/ArrayExcludedPluginName.300-4465687.ja.html)を使用し，名前で指定する必要があります。
