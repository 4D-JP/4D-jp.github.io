---
layout: post
title: "CSS表記で色指定を簡単に"
date: 2019-08-19 00:00:00
categories: ブログ
tags: 18.x 17r6
author: Intissar Elmezrouai
---

![css-768x384](/images/blog/08/19/css-768x384.png)

既存のコマンドが改良され，さらに便利になりました。フォームオブジェクトのカラーは，数値だけでなく，直感的なCSS文字列でも指定することができます。従来のような4バイトの倍長整数（0x00RRGGBB）では，すぐに色がイメージできなかったかもしれません。255（0xFF）とではなく，単純に"blue"と記述できれば良いのに，と感じていたデベロッパーには朗報です。17r6では，CSS文字列がサポートされるようになりました！

{:.download}
[カラーネームを使った色指定](https://github.com/4D-JP/HDI/releases/download/17r6/HDI_CSS_colors.zip) 

CSS文字列がサポートされるようになったコマンドは，<span class="notranslate command">OBJECT SET RGB COLORS</span>, <span class="notranslate command">LISTBOX SET ROW COLOR</span>, <span class="notranslate command">LISTBOX SET GRID COLOR</span> です。

コマンドの改良により，下記の要領でオブジェクトの色指定ができるようになりました。

<code class="fourd"><span class="notranslate variable">$color</span>:="blue"&nbsp;<br>
<span class="notranslate variable">$color</span>:="#0000FF" <span class="notranslate comment">//&nbsp;または #FF</span><br>
<span class="notranslate variable">$color</span>:="RGB(0,0,255)"</code>

#### 使用例

<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/OBJECT-SET-RGB-COLORS.301-4311385.ja.html"><span class="notranslate command">OBJECT SET RGB COLORS</span></a> コマンドには，前景色と背景色がそれぞれ文字列で渡せるようになりました。コードを記述するのが簡単になるだけでなく，可読性も向上します。

<code class="fourd"><span class="notranslate command">OBJECT SET RGB COLORS</span>(*;"text";"red";"Yellow")&nbsp;<br>
<span class="notranslate comment">//&nbsp;従来の表記 </span><span class="notranslate comment">OBJECT SET RGB COLORS(*;"text";0xFF0000;0xFFFF00)</span></code>

それだけではありません。<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/OBJECT-GET-RGB-COLORS.301-4311417.ja.html"><span class="notranslate command">OBJECT GET RGB COLORS</span></a> コマンドからも文字列でCSSカラーが返されるようになりました。

<code class="fourd"><span class="notranslate command">C_TEXT</span>(<span class="notranslate variable">$front</span>;<span class="notranslate variable">$back</span>) <br>
<span class="notranslate command">OBJECT GET RGB COLORS</span>(*;"rectangle";<span class="notranslate variable">$front</span>;<span class="notranslate variable">$back</span>) <br>
<span class="notranslate command">ALERT</span>(<span class="notranslate variable">$front</span>+"/ "+<span class="notranslate variable">$back</span>) <span class="notranslate comment">//&nbsp;#0000FF/#90EE90 が返される</span></code>

リストボックスのコマンドも同じように改良されていますが，注意点があります。<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/LISTBOX-SET-ROW-COLOR.301-4311148.en.html"><span class="notranslate command">LISTBOX SET ROW COLOR</span></a> にCSS文字列が渡された場合，リストボックスや列のカラーを制御するための配列には，数値に変換された値が代入されることに留意してください。

サポートされているCSSカラーネームの一覧は[ドキュメント](https://doc.4d.com/4Dv17R6/4D/17-R6/OBJECT-SET-RGB-COLORS.301-4311385.ja.html)に掲載されています。

早速，HDIをダウンロードして，改良コマンドを試してみるのはいかがでしょうか。
