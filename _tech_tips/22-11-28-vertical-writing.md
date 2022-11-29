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
SVGで縦書きをするためには、writing-modeプロパティにtb-rlやtbをセットしたtext要素で表現します。
CSS Writing Modes Level 3になると、writing-modeプロパティにvertical-rlなどをセットしますが、４ＤのSVGでは利用できませんので注意が必要です。

SVGはXMLですので、実際には次のようなXMLを組み立ててフォームなどで表示することになります。

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<svg>
<text x="10" y="10" fill="red" writing-mode="tb">縦書きスーパーテキスト</text>
</svg>
```

## SVG生成の例題
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
font-family属性でフォントファミリーを指定できますが、Windowsでは将来の互換性を確保するためにDirectWriteフォントファミリーを使用することが推奨されます。

応用としては、SVGを記述したファイルをResourcesフォルダに配置して、それをFileコマンドなどで読み込むようにすることで、メンテナンス性を高められると思います。
また、SVGは基本的にXMLですので、SVGに4Dタグを埋め込み、PROCESS 4D TAGSコマンドで評価させてダイナミックに値を変更することも良い方法だと思います。

## フォームを利用した表示と印刷の例題

フォームで表示と印刷を行う例題も作成してみました。
SVGでテキストを表示するとき、正しいサイズで文字を表示するためには、SVGの領域のサイズは重要になります。

例題の都合上ダイナミックフォームを利用していますが、通常のフォームでも基本は同じになります。

印刷では表示のようにパラメーターとしてSVGを渡すことができないので、一度フォームをメモリ上にロードして、ロードしたフォームオブジェクトに値をセットしている点に注目してください。
またPrint formを利用する場合には、プロセス変数を使うことになりますが、Print objectであればプロセス変数を利用せずとも印刷可能になります。

```4d
// SVGを組み立ててピクチャー変数で受け取る
$text:=\
"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?>"+\
"<svg height=\"500\" width=\"300\">"+\
"<text x=\"150\"  y=\"60\" fill=\"red\" font-size=\"32px\" writing-mode=\"tb-rl\">縦書きスーパーテキスト</text>"+\
"</svg>"
$xml:=DOM Parse XML variable($text)
SVG EXPORT TO PICTURE($xml; $image)
DOM CLOSE XML($xml)

// 表示するためのフォームを組み立てる
$page:=New object
$page.objects:=New object
$page.objects["SVG image"]:=New object(\
"type"; "input"; \
"left"; 0; "top"; 0; "width"; 300; "height"; 500; \
"dataSourceTypeHint"; "picture"; \
"enterable"; False; \
"borderStyle"; "none")
$dynForm:=New object("rightMargin"; 0; "bottomMargin"; 0)
$dynForm.pages:=New collection($page)

//表示または印刷をする
CONFIRM("表示しますか？\rそれとも印刷しますか？"; "表示"; "印刷")
If (OK=1)
	//表示用にフォームに手を入れる
	$page.objects["SVG image"].dataSource:="Form.svg"  //パラメーターで渡されたsvgプロパティを参照
	//表示の開始
	$ref:=Open form window($dynForm)
	DIALOG($dynForm; New object("svg"; $image))  //SVGをダイナミックフォームのパラメーターでフォームに渡す
Else 
	//印刷用にフォームに手を入れる
	$page.objects["SVG image"].dataSource:="SVG_IMAGE"  //印刷用にはプロセス変数を参照
	$dynForm.markerHeader:=0  //SVGが印刷されるようにマーカーを調整
	$dynForm.markerBody:=500  //SVGが印刷されるようにマーカーを調整
	//WindowsではGDIモードを利用する
	SET PRINT OPTION(Legacy printing layer option; 1)  //Windowsで必須
	//印刷の開始
	PRINT SETTINGS
	OPEN PRINTING JOB
	FORM LOAD($dynForm)  //メモリ上にフォームを展開
	OBJECT SET VALUE("SVG image"; $image)  //展開されたフォームにSVGをセットする（v18R4より前はOBJECT Get pointerを利用）
	$height:=Print form($dynForm)  //フォームで印刷
	FORM UNLOAD
	CLOSE PRINTING JOB
End if 
```
