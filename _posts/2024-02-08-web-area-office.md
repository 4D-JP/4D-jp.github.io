---
layout: fix
title: "WebエリアにMicrosoft Officeドキュメントは表示できない"
date: 2024-02-08 08:00:00
categories: 仕様
tags: windows userinterface webarea
---

v19r5以降，WebエリアでMicrosoft Officeドキュメントを開こうとすると，ファイルのダウンロードダイアログが表示されます。これは仕様です。v19r4以前のシステムWebエリアは，Internet Explorerのレンダリングエンジンを使用していましたが，v19 r5以降，レンダリングエンジンがChromiumベースのMicrosoft Edgeに切り替わっています。