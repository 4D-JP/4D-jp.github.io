---
layout: post
title: PROJECT DATABASESシリーズ：スタイルシートを使ってフォームを美しくする
date: 2019-11-13 02:00:00
categories: Tips PROJECTDATABASESシリーズ
tags: 18.x programming
author: Vanessa Talbot
---

![project-database-stylesheet](/images/blog/11-06/stylesheet.png)

これまでの4Dバイナリー・ストラクチャは、macOSとWindowsプラットフォームの両方でフォーム中に使われるフォント、フォントサイズ、テキストのスタイルを特定するためのスタイルシートを定義できました。プロジェクト・データベースでは、さらに進化して4ステイト・ボタンのプロパティを定義したり、全てのライン・オブジェクトの色や境界線を特定したり、アプリケーションのリストボックス 全てのヘッダーの高さを設定することもできます！CSSの文法やシンタックスにインスパイアされて、4Dはプロジェクト・データベースのフォームの特定のニーズに合わせて改良しました。スタイルシートのおかげで、本当に視覚にアピールするフォームを作成するためのプロパティ全てを設定できます。このブログでその方法を紹介します！

{:.download}
[スタイルシートを利用する方法](https://github.com/4D-JP/HDI/releases/download/18/HDI_StyleSheet.zip)

#### プラットフォーム
プロジェクトデータベースでは、両方のプラットフォーム（WindowsとmacOS）に対して、個々のスタイルシートと「オーバーオール（全てに適用）」スタイルシートを定義できます。

なぜプラットフォームごとに異なるスタイルシートが必要なのでしょうか？それは、macOSで使われるフォント/フォントサイズはWindowsのものとは異なることがあるからです。その一方で、テキストのカラーはどちらも同じということがよくあります。

”Stylesheets.css”ファイルと独自のファイル中のプラットフォーム指定のスタイルを定義できるようになりました：”stylesheets_mac.css”と”stylesheets_windows.css”です。

![project-database-stylesheet](/images/blog/11-06/toolboxStyleSheet-768x589.png)


#### プロパティー
プロジェクト・データベースの主な改革の一つは、フォームオブジェクトがサポートする全てのプロパティーをスタイルシートの中で使えることです。

例えば、”ボタン-アクション”クラスを作成して、”ツールボックス”状で、グレイのテキストの、フォーカス化できない4ステート・ボタンを作成することができます。

.buttonAction { <br>
　iconFrames: 4; <br>
　style: toolbar; <br>
　stroke: grey; <br>
　focusable: false; <br>
} <br>

![project-database-stylesheet](/images/blog/11-06/buttonActionClass.png)

これにより、同じグラフィックデザインを保持しながら、アプリケーションに対するデザインフォームを簡単に作れます。

#### セレクター
もう一つの大きな変更は、クラス、オブジェクトタイプ、オブジェクト名、属性によってスタイルシートを作成できることです。

##### オブジェクトタイプ・セレクター
オブジェクトタイプ・セレクター（CSSエレメント・セレクターと同等）を使うと、データベース中の全てのオブジェクトに適用できる汎用的なプロパティーを定義できます。例えば、全てのリストボックス が２行のヘッダーを持ち、空の行は表示されない、列の背景はgainsboroとwhitesmokeにします。

listbox { <br>
　headerHeight: 2em; <br>
　hideExtraBlankRows: true; <br> 
　fill: Gainsborough; <br>
　alternateFill: white smoke; <br>

![project-database-stylesheet](/images/blog/11-06/listboxTypeSelector.png)

このセレクターのおかげで、フォームオブジェクトに独自の外観とフィーリングを定義できます。

##### アトリビュート・セレクター
アトリビュート・セレクターを使うと、プロパティの値によってスタイルシートを定義できます。

例えば、データの入力/出力フォームで、レコードの追加、編集、削除のボタンがあります。これら全てのボタンは同じアイコン、タイトル、ヘルプティップを使います。

アクションボタンにスタイルシートを作成して、アクションプロパティに特定の値を指定しないのはなぜでしょう。例えば、もしアクションプロパティが”editSubrecord”の場合：

.buttonAction[action=editSubrecord] { <br>
　icon: url(“/RESOURCES/Images/Buttons/edit.png”); <br>
　tooltip:  “:Cliff:button_tip_EditRecord”; <br>
　text: “:xliff:button_EditRecord” !important; <br>
} <br>

![project-database-stylesheet](/images/blog/11-06/editSubrecordActionSelector.png)

#### ボーナスとして、実際の動作をデモしています！
<p style="text-align: center;"><iframe src="https://www.youtube.com/embed/xAaakP02dFE" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>



