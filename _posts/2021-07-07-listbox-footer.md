---
layout: post
title: "リストボックスのヘッダーとフッターは変数"
date: 2021-07-07 12:48:00
categories: 注意点
tags: v18 listbox
---

リストボックスのフッターを「カスタム（自動しない）」モードで使用する場合，データソースは**変数**である必要があります。`Form.value`のようなオブジェクト型プロパティは，変数ではなく，数式なので，フッター（あるいはヘッダー）には使用できません。これは仕様です。この点はドキュメントに記載されています。

<i class="fa fa-external-link" aria-hidden="true"></i> [変数の計算](https://developer.4d.com/docs/ja/FormObjects/propertiesObject.html#変数の計算)
