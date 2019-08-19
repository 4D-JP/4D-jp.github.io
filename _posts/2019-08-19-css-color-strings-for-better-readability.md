---
layout: post
title: "CSS表記で色指定を簡単に"
date: 2019-08-19 00:00:00
categories: ブログ
tags: 18.x 17r6
version: 17r6
author: Intissar Elmezrouai
---

![css-768x384](https://user-images.githubusercontent.com/10509075/63232580-110b9280-c264-11e9-83a4-31cec77770d0.png)

既存のコマンドが改良され，さらに便利になりました。フォームオブジェクトのカラーは，数値だけでなく，直感的なCSS文字列でも指定することができます。従来のような4バイトの倍長整数（0x00RRGGBB）では，すぐに色がイメージできなかったかもしれません。255（0xFF）とではなく，単純に"blue"と記述できれば良いのに，と感じていたデベロッパーには朗報です。17r6では，CSS文字列がサポートされるようになりました！

{:.download}
[カラーネームを使った色指定](https://github.com/4D-JP/HDI/releases/download/17r6/HDI_CSS_colors.zip) 

CSS文字列がサポートされるようになったコマンドは，<span class="notranslate command">OBJECT SET RGB COLORS</span>, <span class="notranslate command">LISTBOX SET ROW COLOR</span>, <span class="notranslate command">LISTBOX SET GRID COLOR</span> です。

コマンドの改良により，下記の方式でオブジェクトの色指定ができるようになりました。

{:.fourd}
<code><span class="notranslate variable">$color</span>:="blue"&nbsp;<br>
<span class="notranslate variable">$color</span>:="#0000FF" <span class="notranslate comment">//or #FF</span><br>
<span class="notranslate variable">$color</span>:="RGB(0,0,255)"</code>
