---
layout: post
title: "文字列の比較"
date: 2021-08-23 00:46:00
categories: 仕様 
tags: 19.x unicode
version: 19.x
---

v19では，[Compare strings](https://doc.4d.com/4Dv19/4D/19/Compare-strings.301-5392237.ja.html)という関数が追加されています。既存の[Position](https://doc.4d.com/4Dv19/4D/19/Position.301-5392252.ja.html)も拡張されました。両コマンドには[Stringsデーマの定数](https://doc.4d.com/4Dv19/4D/19/Strings.302-5393273.ja.html)を組み合わせて渡すことができます。ただし，どんな組み合わせでも良いわけではありません。また，Compare stringsとPositionとでは，指定できる定数の組み合わせが異なります。

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

Positionのデフォルトも同一ですが，後述するように**Positionはsk width insensitiveをサポートしていない**ため，振る舞い上のデフォルトは

* sk kana insensitive+sk case insensitive 

となります。

https://speakerdeck.com/miyako/v19-part-2?slide=47

---

#### 半角と全角の区別とは

[Unicode Standard Annex #11](https://unicode.org/reports/tr11/tr11-8.html)に詳述されているように，Unicodeでは文字列の幅を下記のように分類しています。

* Wide
* Narrow
* Full
* Half
* Ambiguous
* Neutral

日本語にあてはめて表現すると下記のようになります。

* 全角の平仮名と片仮名と漢字と記号
* 半角の平仮名と片仮名
* 全角の英数
* 半角の英数
* ギリシア文字やキリル文字（Shift_JISでは全角・Unicodeでは半角）
* アラビア文字など

sk width insensitiveは，平仮名・片仮名・英数の文字列比較で全角と半角を区別しないというものです。

#### 大文字と小文字の区別とは

日本語の場合，「ぁぃぅぇぉっゃゅょ」などが小文字に相当します（捨て仮名・小書き文字）。

sk case insensitiveは，アルファベットに加え，このような文字も大文字と小文字を区別しないというものです。

#### 濁音はアクセント記号

「清音と濁音」を区別しない場合，必然的に「全角と半角」「大文字と小文字」は区別しないことになります。言い換えるなら，「全角と半角」「大文字と小文字」いずれかを区別する場合，必然的に「清音と濁音」も区別することになります。「清音と濁音」を区別せずに（sk diacritic insensitive）他の違いを区別することはできません。

日本語以外の文字列比較では，「大文字と小文字」を区別しつつ，アクセント記号の有無を無視したいことがあります。sk diacritic insensitive定数はそのような用途を想定しています。日本語の文字列比較において「清音と濁音」を区別することはまずないものと思われますが，区別しないという選択肢が用意されているのは，Unicodeの規格で日本語の濁点・半濁点をアクセント記号の一種とされているためです。

#### 半角の濁点とCompare strings

Unicodeの全角文字（平仮名および片仮名）では，濁音を単独の文字（例：「だ」 `U+3060`）または合成文字を使用して表現（例：「た」 `U+305F`+「゛」`U+3099`）することができます。合成文字は，幅がゼロの特殊な文字で，清音の平仮名または片仮名と組み合わせることにより，「あ゙」のような文字を表現することができます。

通常，単独文字の「だ」と合成文字を使用して表現した文字列の「だ」は，文字コードと文字数が違っているとはいえ，文字列の比較において等価とみなされるべきです。Unicodeでは，複数の方法で表現できる同等の文字列の表記を統一するためのルールが定められています。

* NFD（正準等価性分解）
* NFC（正準等価性分解＋再合成）
* NFKD（互換等価性分解）
* NFKC（互換等価性分解＋再合成）

濁音についていえば，NFC/NFKCは「できるかぎり単独文字を使用する」力学が働きます。NFD/NFKDは「できるかぎり合成文字を使用する」力学が働きます。

全角の濁音・半濁音には単独文字が存在しますが，半角の濁音は常に合成文字を使用して表現されます。つまり，NFC/NFKC正規化された全角文字と半角文字を比較した場合，文字数は全角が１，半角は２となります。NFD/NFKDでは，両者とも文字数は「２」となります。

**Compare stringsは，内部的にNFKD正規化を実施しています**。「全角と半角を区別しない（L1-L4）」かつ「清音と濁音を区別する（L2-L4）」文字列の比較ができるようにするためです。

**注記**: 19.0の初版には，`sk width insensitive`で半角の濁音が正しく判定されない不具合がありました（ACI0102113）。この問題は，v19.0のナイトリービルドで修正されています。

#### 半角の濁点とPosition

濁音の文字数は全角と半角で異なるため，Compare stringsは内部的にNFKD正規化した文字列を比較しています。正規化された全角の濁音は，元の文字列（NFC）よりも文字数が多いため，Positionで文字列をサーチした場合，文字列が合致したとしても，返される位置と長さは信頼できない値となります。そのようなわけで，**Positionは内部的にNFKD正規化を実施しません**。sk width insensitiveを指定しても，半角の濁音で同等の全角の濁音をサーチすることはできないことになります。

#### まとめ

Compare stringsおよびPositionは，新しいStringsデーマの定数をサポートしています。定数は，文字列比較の水準を指定するために使用されます。

* 清音と濁音（sk diacritic insensitive）
* 大文字と小文字（sk case insensitive）
* 平仮名と片仮名（sk kana insensitive）
* 全角と半角（sk width insensitive）

下位の照合順序は上位レベルの基準を含んでいるので，個別に指定できるわけではありません。

**Compare strings**は，全角と半角を区別せずに濁音を正確に比較できます。内部的に正規化を実施しているためです。

**Position**は，全角と半角を区別せずに濁音を正確に検索できません。位置と文字数が変動しないよう，内部的に正規化を実施していないためです。
