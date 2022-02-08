---
layout: post
title: "選択リストの更新"
date: 2022-02-09 00:00:00
categories: 仕様
tags: projectmode 
version: 19
---

プロジェクトモードでは，テキスト入力に設定された[選択リスト](https://developer.4d.com/docs/19/ja/FormObjects/propertiesDataSource.html#選択リスト)の「更新」ボタンがクリックできません。これは仕様です。バイナリモードの選択リストはストラクチャファイルに書き込まれていますが，バイナリモードでは*Project*フォルダーまたは`.4DZ`ファイル内の*list.json*ファイルで管理されており，ランタイムモードではリードオンリーのデータとして扱われるためです。

**参考**: <i class="fa fa-external-link" aria-hidden="true"></i> `.4DZ`形式ではなく，[PackProject](https://developer.4d.com/docs/19/ja/Desktop/building.html)モードでアプリケーションをビルドすれば，[SAVE LIST](https://doc.4d.com/4Dv19/4D/19.1/SAVE-LIST.301-5653270.ja.html)コマンドでリストを更新することができます。
