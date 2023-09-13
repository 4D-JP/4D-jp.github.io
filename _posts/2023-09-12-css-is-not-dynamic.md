---
layout: fix
title: "CSSは動的ではない"
date: 2023-09-12 08:00:00
categories: 仕様
tags: userinterface 20.x css
---

プロジェクトモードでは，フォームのプロパティ全般を*.css*ファイルで定義することができます。Webページのそれとは違い，フォームオブジェクトのプロパティ全般に[スタイルシート](https://developer.4d.com/docs/ja/FormEditor/stylesheets)が使用される点に留意してください。

スタイルシートは，フォームを開いたタイミングで一度だけ評価されます。つまり動的なものではありません。たとえば，下記のような*.css*を記述し，macOSのダークモードとライトモード向けに暗いブルーと明るいブルーを設定した場合，モードの切り替えに応じてウィンドウの背景色やフォントカラー（この例では*automatic*）は動的に変化しますが，オブジェクトの背景色が動的に変化することはありません。これは仕様です。

```css
@media (prefers-color-scheme: light){
	.blue {
		fill: #98bfe0;
		stroke: automatic;
}

}
@media (prefers-color-scheme: dark){
	.blue {
		fill: #344a6d;
		stroke: automatic;
}
}
```