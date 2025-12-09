---
layout: fix
title: "Windows版システムWebエリアの動作について"
date: 2025-12-08 08:00:00
categories: 仕様
tags: webarea windows userinterface 
---

19r5ではシステムWebエリアの実装がWebView ControlからWebView2にアップデートされました。前者はInternet Explorer11のエンジン，後者はMicrosoft Edgeのエンジンです。このアップデートに伴い，Windows版システムWebエリアで[進捗状況変数](https://developer.4d.com/docs/ja/FormObjects/propertiesWebArea)に値が自動代入されることはなくなりました。

<i class="fa fa-external-link" aria-hidden="true"></i> [4D DevCon 2024](https://speakerdeck.com/miyako/4d-devcon-2024?slide=80)

同様の理由により，Windows版システムWebエリアでは[`WA GET URL HISTORY`](https://developer.4d.com/docs/ja/commands/wa-get-url-history)でURLの履歴が参照できなくなりました。

どうしても進捗をリアルタイムで表示したい場合，あるいはURLの履歴にアクセスしたい場合，[埋め込みWebレンダリングエンジン](https://developer.4d.com/docs/ja/FormObjects/propertiesWebArea#埋め込みwebレンダリングエンジンを使用)の使用を検討してください。