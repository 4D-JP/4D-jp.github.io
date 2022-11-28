---
layout: technote
title: "縦書きの表示／印刷"
position: 20221128001
date: 2022-11-28 00:00:00
categories: ヒント
tags: SVG
version: 17 18 19
---

４Ｄで縦書きする方法について説明します。

<!--more-->

## 縦書き
日本語の伝統的な特徴として縦書きがあります。
コンピューターで縦書きを行うために、その昔、縦書き用フォントを使用するなどの方法でしのいでいた時期もありましたが、今ではSVGという強い味方がいます。

## SVGで縦書き
SVGで縦書きをするためには、writing-modeプロパティにtbをセットしたtext要素で表現します。
CSS Writing Modes Level 3になると、writing-modeプロパティにvertical-rlなどをセットしますが、４ＤのSVGでは利用できませんので注意が必要です。

SVGはXMLですので、実際には次のようなXMLを組み立ててフォームなどで表示することになります。

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<svg>
<text x="10" y="10" fill="red" writing-mode="tb">縦書きスーパーテキスト</text>
</svg>
```

## ４Ｄランゲージ
４Ｄの実際のコードの例ですが、SVGの組み立てはSVGコマンドで組み立てなくても、テキストにXMLを組み立ててDOMコマンドでパースする方法もあります。
次の例題では、テキストで組み立てて、SVGTool_SHOW_IN_VIEWERコマンドで、実際に４Ｄでどのように表示されるかを確認することができます。

```4d
$text:=\
"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?>"+\
"<svg>"+\
"<text x=\"10\" y=\"10\" fill=\"red\" writing-mode=\"tb\">縦書きスーパーテキスト</text>"+\
"</svg>"
$svg:=DOM Parse XML variable($text)
SVGTool_SHOW_IN_VIEWER($svg)
DOM CLOSE XML($svg)
```

フォームで表示する例題も作成してみました。
SVGでテキストを表示するとき、正しいサイズで文字を表示するためには、SVGの領域のサイズは重要になります。

```4d
// SVGを組み立ててピクチャー変数で受け取る
$text:=\
"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?>"+\
"<svg height=\"500\" width=\"300\">"+\
"<text x=\"150\"  y=\"60\" fill=\"red\" font-size=\"32px\" writing-mode=\"tb\">縦書きスーパーテキスト</text>"+\
"</svg>"
$xml:=DOM Parse XML variable($text)
SVG EXPORT TO PICTURE($xml; $pict)
DOM CLOSE XML($xml)

// 表示するためのフォームを組み立てる
$page:=New object
$page.objects:=New object
$page.objects.Input:=New object(\
"type"; "input"; \
"left"; 0; "top"; 0; "width"; 300; "height"; 500; \
"dataSource"; "Form.svg"; \
"dataSourceTypeHint"; "picture"; \
"enterable"; False; \
"borderStyle"; "none")
$dynForm:=New object("rightMargin"; 0; "bottomMargin"; 0)
$dynForm.pages:=New collection($page)

// ピクチャー変数をダイナミックフォームのパラメーターでフォームに渡す
$ref:=Open form window($dynForm)
DIALOG($dynForm; New object("svg"; $pict))
```

