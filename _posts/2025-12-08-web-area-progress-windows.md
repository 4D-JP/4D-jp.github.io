---
layout: fix
title: "Windows版システムWebエリアの動作について"
date: 2025-10-28 08:00:00
categories: 仕様
tags: webarea windows userinterface 
---

19r5ではシステムWebエリアの実装がWebView ControlからWebView2にアップデートされました。前者はInternet Explorer11のエンジン，後者はMicrosoft Edgeにエンジンです。このアップデートに伴い，Windows版システムWebエリアで[進捗状況変数](https://developer.4d.com/docs/ja/FormObjects/propertiesWebArea)に値が自動代入されることはなくなりました。

<i class="fa fa-external-link" aria-hidden="true"></i> [4D DevCon 2024](https://speakerdeck.com/miyako/4d-devcon-2024?slide=80)

どうしても進捗をリアルタイムで表示したい場合，[埋め込みWebレンダリングエンジン](https://developer.4d.com/docs/ja/FormObjects/propertiesWebArea#埋め込みwebレンダリングエンジンを使用)の使用を検討してください。