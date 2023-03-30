---
layout: post
title: "ペーストボードのTEXTデータ"
date: 2023-03-29 09:00:00
categories: 仕様
tags: programming userinterface pasteboard text encoding
---

[ペーストボードの管理](https://doc.4d.com/4Dv19/4D/19.6/Managing-Pasteboards.300-6270006.ja.html)で説明されているように，[`Pasteboard data size`](https://doc.4d.com/4Dv19/4D/19.6/Pasteboard-data-size.301-6270005.ja.html)は，下記のデータタイプ識別子をサポートしています。

* 4Dシグネチャ
* Uniform Type Identifier (Mac)
* 数値またはフォーマット名 (Windows)

上記に加え，`TEXT` `PICT`などの4文字識別子が「以前のバージョンの4Dとの互換性のために」残されています。`TEXT`つまり`Text data`定数は，UTIの`com.apple.tradional-mac-plain-text`を指している点に留意してください。コピー元のアプリケーションがこのタイプのデータをペーストボードに転写していない場合，`Pasteboard data size`は`-102`つまり「データなし」を返します。これは仕様です。
