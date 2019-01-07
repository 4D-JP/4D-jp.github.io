---
layout: post
title: "Milliseconds ドキュメント追記"
date: 2019-01-07 22:14:54
categories: ドキュメント
tags: develop documentation
excerpt: "Milliseconds の例題と説明文が改定されています。経過時間を計測したい場合，関数から返される値を比較するのではなく，差を計算するべきである点が強調されています。値は約24日毎に符号が反転するからです。"
version: 17r3

---

* 改定の要旨

``Milliseconds``は，マシン（アプリケーションではありません）が起動されてから経過された時間をミリ秒単位で返します。しばしば時間の計測に使用される関数ですが，符号付き32ビット整数（``C_LONGINT``）が使用されているため，``2,147,483,647``ミリ秒，つまり約``24.86``日毎に返される値の符号が反転することに留意しなければなりません。

経過時間（たとえばプロセスの停止時間）を計測するような場合，``Milliseconds+$timeout``のような加算式でタイムアウト時間を計算するべきでは__ありません__。そうではなく，必ず``Milliseconds``の差と閾値を比較するようにしてください。

たとえば，``MAXLONG (2,147,483,647)``に``1``を加算すると，``-2,147,483,648``になります。したがって，比較演算で処理した場合，時間が過去に戻ったような扱いになり，（24日後まで）タイムアウト条件が満たされません。差を計算すれば，つまり``-2,147,483,648-MAXLONG``を求めれば，（整数の符号がまた反転して）``1``が返されます。


* 新しい例題

```
 If(Locked([Table_1]))
    $starttime:=Milliseconds
    Repeat
       DELAY PROCESS(Current process;15)
       LOAD RECORD([Table_1])
       $waittime:=Milliseconds-$starttime
    Until(Not(Locked([Table_1]))|(Process aborted)|($waittime>5000)) //最大で5秒待つ
 End if
```

https://doc.4d.com/4Dv17R3/4D/17-R3/Milliseconds.301-3907274.ja.html

古い例題

```
 Open window(100;100;300;200;0;"Chronometer")
 $vhTimeStart:=Current time
 $vlTicksStart:=Tickcount
 $vrMillisecondsStart:=Milliseconds
 Repeat
    GOTO XY(2;1)
    MESSAGE("時間...........:"+String(Current time-$vhTimeStart))
    GOTO XY(2;3)
    MESSAGE("Tick..........:"+String(Tickcount-$vlTicksStart))
    GOTO XY(2;5)
    MESSAGE("ミリ秒...:"+String(Milliseconds-$vrMillisecondsStart))
 Until((Current time-$vhTimeStart)>=?00:01:00?)
 CLOSE WINDOW
```

https://doc.4d.com/4Dv16/4D/16.4/Milliseconds.301-3978208.ja.html
