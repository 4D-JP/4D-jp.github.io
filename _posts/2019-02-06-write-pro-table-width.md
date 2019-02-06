---
layout: post
title: "Write Proテーブルの幅を計算"
date: 2019-02-05 00:46:00
categories: 仕様 
tags: 17.x writepro
version: 17.x
---

Write Proに幅が120pxの列５個で構成されるテーブルを挿入した場合，テーブル全体の幅は600pxを超えることになります。これは仕様です。

``wk width``および`` wk height``はHTMLやCSSと同じ仕方で要素のサイズを定義します。つまり，セルのサイズには，パディングやボーダーが含まれません。テーブルの正確な幅は，セル・ボーダー・パディングの幅を合計した値になります。行の中間に位置するセルのサイズは，下記の計算式で求めることができます。

```
wk width+(wk border width left+wk border width right)*0.5+wk padding left+wk padding right 
```

セルとセルの間にあるボーダーは，幅が半分にカットされる点に留意してください。左端のセルは``wk border width left*0.5``，右端のセルは``wk border width right*0.5 ``をこれに加える必要があります。両端のセルだけは，ボーダーがカットされないためです。なお，ボーダー幅の計算には，複雑なレンダリングルールが関係しており，ボーダーの幅とスタイルが揃っていない場合，この計算式だけでは多少の誤差が生じるかもしれません。

例題：

```
C_REAL($widthFull)
$widthFull:=0
For ($i;1;$NbCol)
  $Col:=WP Table get columns($Tableau;$i;1)
  WP SET ATTRIBUTES($Col;wk width;120)
  $cells:=WP Table get cells($Tableau;$i;1;1;1)
  C_REAL($width)
  C_REAL($borderWidth;$padding)
  WP GET ATTRIBUTES($cells;wk border width;$borderWidth;wk padding;$padding)
    //full cell width = wk width+(wk border width*2)/2+wk padding*2 (only if all cells have same padding and border widths)
    //for interior cells borders are collapsed
  $width:=120+($borderWidth*2/2)+($padding*2)
  $widthFull:=$widthFull+$width
  If (($i=1) | ($i=$NbCol))
      //for row first and last cell, exterior borders are not collapsed
    $widthFull:=$widthFull+($borderWidth*0.5)
  End if 
End for 

ALERT("full table width in px="+String($widthFull))
```
