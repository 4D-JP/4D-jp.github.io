---
layout: post
title: "View Pro数式の評価"
date: 2021-09-29 11:31:00
categories: 仕様
tags: viewpro
version: 19
---

View Proエリアは，SpreadJSテクノロジーを利用したWebアプリケーションです。操作感は標準的なデスクトップ版アプリケーションにかなり似ていますが，JavaScriptで動作しているため，いくつかの点に注意する必要があります。

たとえば，別のセル値を参照するセルがあり，参照されているセル自体も別のセルを参照しているような場合を考えてみましょう。
	
|    |   A   | 
| ---- | ---- | 
|  1  |  10 |
|  2  |  =関数()+A1 |
|  3  |  =関数()+A2 | 
|  4  |  =関数()+A3 |

普通に考えれば，動的なセルの数は３個（A2, A3, A4）ですので，３回の計算をすれば良いように思えます。つまり，関数を３回だけ評価すれば良いはずです。しかし，実際に計測してみると関数は７回コールされます。なぜ４回も余計に呼び出されるのでしょうか。

ポイントは，JavaScriptの関数コールは非同期処理である，という点にあります。A1に値を入力すると，A2の関数が呼び出されます（1）。A2を参照するA3，A3を参照するA4の関数も連鎖的に呼び出されます（2, 3）。しかしながら，このタイミングで値が確定しているのはA1だけであり，A2, A3, A4は値が確定していません。見方を変えるなら，このタイミングでの２番と３番目の呼び出しは早すぎます。

(1)で呼び出された関数が値を返すと，A2の値が確定します。するとA2を参照するA3，A3を参照するA4の関数が再び連鎖的に呼び出されます（4, 5）。このタイミングで値が確定しているのはA2だけなので，５番目の呼び出しは早すぎます。

(2)で呼び出された関数が値を返すと，A3には不完全な値が代入されます。(2)の呼び出しは時期尚早だっためです。それでもA3を参照するA4の関数が連鎖的に再び呼び出されます（6）。この呼び出しも早すぎます。

(3)で呼び出された関数が値を返すと，A4に値が代入されます。この呼び出しは時期尚早だったので，値は不完全なものです。

(4)で呼び出された関数が値を返すと，ようやくA3の値が確定します。また，A3を参照するA4の関数が連鎖的に呼び出されます（7）。

(5)で呼び出された関数が値を返すと，A4に値が代入されます。この呼び出しは時期尚早だったので，値は不完全なものです。

(6)で呼び出された関数が値を返すと，A3に値が代入されます。この呼び出しは時期尚早だったので，値は不完全なものです。

(7)で呼び出された関数が値を返すと，ようやくA4の値が確定します。

まとめると，必要なのは１・４・７番目の呼び出しだけであり，２・３・５・６番目の呼び出しは無駄です。

無駄な関数コールを回避するテクニックとして，演算の順序を入れ替えることができます。

|    |   A   | 
| ---- | ---- | 
|  1  |  10 |
|  2  |  =A1+関数() |
|  3  |  =A2+関数() | 
|  4  |  =A3+関数() |

これが効果的なのは，最初の連鎖ではA2およびA3の評価値が未定義（#VALUE!）であり，未定義を加算した値は未定義に決まっているので，そこで数式の評価が中断され，後続の関数が呼び出されないためです。それぞれのセルは参照先に値が代入されるたび連鎖的に再評価されますが，参照先のセルが未定義である間はそのセルに加算するべき値を求める関数の呼び出しはスキップされます。その結果，無駄な非同期コールを回避することができるというわけです。
