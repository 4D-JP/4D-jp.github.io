---
layout: post
title: "文字列の比較"
date: 2021-08-23 00:46:00
categories: 仕様 
tags: 19.x unicode
version: 19.x
---

v19では，[Compare strings](https://doc.4d.com/4Dv19/4D/19/Compare-strings.301-5392237.ja.html)という関数が追加されています。既存の[Position](https://doc.4d.com/4Dv19/4D/19/Position.301-5392252.ja.html)も拡張されました。両コマンドには[Stringsデーマの定数](https://doc.4d.com/4Dv19/4D/19/Strings.302-5393273.ja.html)を組み合わせて渡すことができます。ただし，どんな組み合わせでも良いわけではありません。また，Compare stringsとPositionとでは，定数の有効な組み合わせが異なります。

#### 照合順序（コレーションレベル）

[Unicode Collation Algorithm #10](https://unicode.org/reports/tr10/)に詳述されているように，Unicodeでは文字列比較の基準が５段階に定められています。L1がもっとも緩い基準，L5がもっとも厳しい基準です。文字列を等価をみなすかどうかの決め手は，下記のとおりです。

* Base characters
* Accents
* Case (Variants)
* Punctuation
* Identical

日本語にあてはめて表現すると下記のようになります。

| レベル | 清音と濁音 | 大文字と小文字 | 平仮名と片仮名 | 全角と半角 | 
| ---- | ---- | ---- | ---- | ---- |
|  L1  | 区別しない | 区別しない | 区別しない | 区別しない | 
|  L2  | 区別する | 区別しない | 区別しない | 区別しない | 
|  L3  | 区別する | 区別する | 区別しない | 区別しない | 
|  L4  | 区別する | 区別する | 区別する | 区別しない | 
|  L5  | 区別する | 区別する | 区別する | 区別する |

各レベルは上位レベルの基準を含んでいます。つまり，L3=L1+L2+L3です。L1とL3を採用し，L2は採用しない，といったことはできないことに留意する必要があります。

この原則は，Compare stringsおよびPositionの渡すことができる定数の組み合わせにも適用されます。有効な値は，下記の組み合わせに限られるということです。

| レベル | Stringsテーマの定数 | 
| ---- | ---- |
|  L1  | sk width insensitive+sk kana insensitive+sk case insensitive+sk diacritic insensitive |
|  L2  | sk width insensitive+sk kana insensitive+sk case insensitive |
|  L3  | sk width insensitive+sk kana insensitive |
|  L4  | sk width insensitive | 
|  L5  | sk char codes | 

**注記**: 何も指定しなかった場合，デフォルトは等価性（文字列演算子の`#`および`=`）の称号順序である「L2」，つまり

* sk width insensitive+sk kana insensitive+sk case insensitive 

となります（データ言語「日本語」の場合）。

Positionのデフォルトも同一ですが，後述するようにPositionはsk width insensitiveをサポートしていません。

https://speakerdeck.com/miyako/v19-part-2?slide=47
