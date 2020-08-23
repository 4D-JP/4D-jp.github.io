---
layout: post
title: "ピクチャ型のオブジェクトプロパティ"
date: 2019-03-09 07:33:00
categories: 仕様
tags: 17.x ORDA writepro
---

オブジェクト型のプロパティは，フィールドや従来の変数とは違い，タイプが固定されていません（「強い型付け」）。``C_PICTURE``で型が宣言されたピクチャ変数に``Null``を代入した場合，変数の内容がクリアされますが，型は変わりません（``CLEAR VARIABLE``または``picture:=picture*0``と同じ）。対照的に，ピクチャ型のオブジェクトプロパティに``Null``を代入した場合，プロパティは``0``バイトのピクチャではなく，``Null``になります。Write ProやORDAも同じ振る舞いになります。これは仕様です。

<i class="fa fa-external-link" aria-hidden="true"></i> [オブジェクト型（Developer Conference 2018より）](https://speakerdeck.com/miyako/obuziekutoxing-developer-conference-2018yori)
