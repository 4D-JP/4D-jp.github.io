---
layout: post
title: "Compile projectとプラグイン"
date: 2022-03-31 15:00:00
categories: 仕様
tags: compiler deployment build
version: "19.x"
---

[`Compile project`](https://developer.4d.com/docs/ja/Project/building.html)コマンドを使用すれば，デザインモードを操作することなく，自動的にカレントプロジェクトをコンパイルすることができます。たとえば，ソースコードをGitリポジトリにコミットするたびにクラウド上で自動的にプロジェクトがコンパイルされるよう，[GitHub Action](https://docs.github.com/en/actions/learn-github-actions)をセットアップすることができます。GitHubは最新のmacOSおよびXcodeも提供しているので，Apple Siliconターゲットもサポートできます。

ブログ記事: <i class="fa fa-external-link" aria-hidden="true"></i> https://blog.4d.com/how-to-automate-the-compilation/

ワークフローの例: <i class="fa fa-external-link" aria-hidden="true"></i> https://github.com/4D-JP/librezept/blob/main/.github/workflows/compile.yml

パラメーターを渡すことにより，外部プロジェクトをコンパイルすることもできます。外部プロジェクトをコンパイルする場合，プラグインやコンポーネントはロードされないことに留意してください。コンパイル対象のプロジェクトがプラグインやコンポーネントに依存している場合，それらのモジュールはコマンドを実行するプロジェクトにロードされている必要があります。これは仕様です。
