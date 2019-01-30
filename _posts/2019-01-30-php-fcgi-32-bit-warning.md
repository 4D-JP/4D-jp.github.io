---
layout: post
title: "macOS MojaveでPHP Executeを実行するとアラートが表示される"
date: 2019-01-30 22:06:23
categories: 注意点 
tags: mac 17r4 php
version: 17r4
---

macOS Mojaveで``PHP Execute``を実行すると，「アプリケーションはお使いのMac用に最適化されていません」というアラートが表示されます。17r4と一緒に配付されている``php-fcgi``が32ビット版のアプリケーションであるためです。このメッセージは，30日に1回，リマインダーとして表示されます。

<i class="fa fa-external-link" aria-hidden="true"></i> [support.apple.com](https://support.apple.com/ja-jp/HT208436)

Mac 32ビット版アプリケーションの提供は，17r4が最後のリリースとなります。17r5以降，Mac版は64ビット版アプリケーションのみのリリースとなり，PHPも64ビット版のバージョン``7.3.1``にアップデートされる予定です。
