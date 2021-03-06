---
layout: post
title: "4D Viewは日付を整数で計算する"
date: 2019-06-26 12:00:00
categories: 仕様
tags: viewpro
---

4D ViewドキュメントをView Proに変換した場合，日付型の差を求める計算式が設定されたセルの値が変わってしまうことがあります。たとえば，``A1``セルに``2019-01-01``，``A2``セルに``2019-01-06``が代入されている場合，``A2-A1``は``5``（正）となりますが，``A3/2``は``2``（誤）となります。これは仕様です。

4Dランゲージで日付の減算を実行すれば，日数が整数で返されますが，4D Viewの計算エンジンは特殊であり，日付の除算や乗算であっても，計算値が整数で返されます。日数を整数ではなく，実数で計算したいのであれば，明示的に``0``を加算してください。前述の例でいえば，``(A3+0)/2``は``2.5``となります。逆に，4D Viewと同じように整数で計算したいのであれば，``INT(A3/2)``と記述することができます。
