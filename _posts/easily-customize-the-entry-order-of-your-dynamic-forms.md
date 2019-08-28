---
layout: post
title: "ダイナミックフォームの入力順を簡単にカスタマイズ"
date: 2019-08-28 00:00:00
categories: ブログ
tags: 18.x 17r6
author: Vanessa Talbot
---

![entryOrder](/images/blog/08/28/entryOrder.png)

<a href="https://blog.4d.com/discover-the-power-of-dynamic-forms/">ダイナミックフォーム</a>の機能は、4D v16 R6で導入され、オブジェクト内でフォームを構築したり、テキストファイルからフォームをロードしたりすることで、その場でフォームを構築できます。これは、アプリケーションのニーズに合わせてフォームが頻繁に変更される世界ではとても便利です。

4Dでは、バイナリーフォームでもダイナミックフォームでも、入力順は典型的なz順に従います。4D v17 R6を使うと、z順に関連づけることなく入力順を定義できるようになりました。

フォーム定義の各ページには、z順に従って配置されたフォーム要素のリストを含む”object”属性があります。新しい”<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/Dynamic-Forms.300-4354899.en.html">entryOrder</a>”属性が追加され、独自のカスタマイズした入力順を指定できるようになりました。もしこの属性が未定義の場合は、4Dはz順（”objects”属性で定義された順序）を使います。

以下は、二つの入力フィールドとボタンを使ったダイナミックフォームの例です：

<code class="fourd"><span class="notranslate comment">  // Create inputs and button</span> <br>
<span class="notranslate variable">$text1</span>:=<span class="notranslate command">New object</span>("type";"input"; "top";20; "left";140; "width";100; "height";18) <br>
<span class="notranslate variable">$text2</span>:=<span class="notranslate command">New object</span>("type";"input"; "top";20; "left";20; "width";100; "height";18) <br>
<span class="notranslate variable">$button</span>:=<span class="notranslate command">New object</span>("type";"button"; "text";"OK"; "top";60; "left";140; "width";100; "height";20)<br>
<br>
<span class="notranslate comment">  // Create entry order collection</span> <br>
<span class="notranslate variable">$entryOrder</span>:=<span class="notranslate command">New Collection</span>("text2";"text1")<br>
<br>
<span class="notranslate comment">  // Create page with form objects and entry order</span> <br>
<span class="notranslate variable">$page</span>:=<span class="notranslate command">New object</span>("objects";<span class="notranslate command">New object</span>("text1";<span class="notranslate variable">$text1</span>; "text2";<span class="notranslate variable">$text2</span>; "button";<span class="notranslate variable">$button</span>); "entryOrder";<span class="notranslate variable">$entryOrder</span>)<br>
<br>
<span class="notranslate comment">  // Create form</span> <br>
<span class="notranslate variable">$form</span>:=<span class="notranslate command">New object</span>("pages"; <span class="notranslate command">New collection</span>(<span class="notranslate command">Null</span>;<span class="notranslate variable">$page</span>); "windowTitle";"My form"; "rightMargin";20; "bottomMargin";20)<br>
<br>
<span class="notranslate comment">// Load the form</span> <br>
<span class="notranslate variable">$w</span>:=<span class="notranslate command">Open form window</span>(<span class="notranslate variable">$form</span>) <br>
<span class="notranslate command">DIALOG</span>(<span class="notranslate variable">$form</span>)</code>

これは次のように表すことができます：

<pre>{
	"<span style="color: #800080;">pages</span>": [
		null,
		{
			"<span style="color: #800080;">objects</span>": {
				"<span style="color: #3366ff;">text1</span>": {
					"type": "input",
					"top": 20, "left": 140,
					"width": 100, "height": 18,
					"events": ["onClick"]
				},
				"<span style="color: #3366ff;">text2</span>": {
					"type": "input",
					"top": 20, "left": 20,
					"width": 20, "height": 18,
					"events": ["onClick"]
				},
				"<span style="color: #3366ff;">button</span>": {
					"type": "button",
					"text": "OK",
					"top": 60, "left": 140,
					"width": 20, "height": 20,
					"events": ["onClick"]
				}
			},
			"<span style="color: #800080;">entryOrder</span>": [
				"<span style="color: #3366ff;">text2</span>",
				"<span style="color: #3366ff;">text1</span>"
			]
		}
	]
}</pre>
