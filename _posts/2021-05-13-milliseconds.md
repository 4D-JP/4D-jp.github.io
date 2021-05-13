---
layout: post
title: "Millisecondsは実数型"
date: 2021-05-13 12:00:00
categories: 仕様
tags: programming 
---

`Milliseconds`は，コンパイルモードで倍長整数型ではなく，実数型を返すようになりました。これは仕様です。倍長整数型で`Milliseconds`を計測した場合，およそ`49`日でオーバーフローが発生しますが，4Dが使用している`8`ビット実数型の有効桁数は`13`桁なので，`11`桁の倍長整数型（`-2,147,483,648`-`2,147,483,647`）よりもおおきな整数を正確に表現することができます。

<i class="fa fa-external-link" aria-hidden="true"></i> https://doc.4d.com/4Dv15/4D/15/Real-numbers-Reduction-of-number-of-significant-digits.300-2044272.ja.html
