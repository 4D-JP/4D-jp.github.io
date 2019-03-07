---
layout: post
title: "ICUのアップデート"
date: 2019-03-07 12:00:00
categories: リリースノート
tags: 17r5 unicode
---

17r5では，テキスト（オブジェクト型やコレクション型のプロパティ値を含む）の比較と検索に使用されている <i class="fa fa-external-link" aria-hidden="true"></i> [International Components for Unicode, ICU](http://site.icu-project.org/home)ライブラリがバージョン[``63``](http://site.icu-project.org/download/63)にアップデートされる予定です。v16およびv17のライブラリバージョンは [``56``](http://site.icu-project.org/download/56)でした。ライブラリのアップデートに伴い，サポートされるUnicodeのバージョンも``8``から``11``に上がります。

Unicode 11では，``66``個の絵文字が追加され，``5``のCJK（中日韓）統合漢字が追加されています。追加されたのは，新元素の中国語名に使用される``3``文字と独立行政法人情報処理推進機構の<i class="fa fa-external-link" aria-hidden="true"></i> [文字情報基盤整備事業](https://mojikiban.ipa.go.jp)のリストに含まれている人名漢字等``2``文字です。

| 原子番号 | 漢字 | 名称|
---|---|---
|118 | Og | オガネソン |
|117 |Ts | テネシン |
|113 | Nh | ニホニウム |

<img width="235" alt="2019-03-07 12 13 43" src="https://user-images.githubusercontent.com/10509075/53929845-7adb1a00-40d2-11e9-9987-4b3268e74c7a.png">

