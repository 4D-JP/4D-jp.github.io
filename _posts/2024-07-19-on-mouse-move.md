---
layout: fix
title: "モディファイアキーとOn Mouse Move"
date: 2024-07-18 08:00:00
categories: 仕様
tags: userinterface programming
---

*On Mouse Move* フォームイベントはフォームオブジェクト上でマウスポインターが動いた場合に加え，*control* *shift* *alt* などのモディファイアキーが押された場合にも発生します。たとえばテキスト入力オブジェクトがフォーカスされた状態で標準アクションの`selectAll`を実行した場合，*On Selection Change* イベントだけが発生しますが，*control/command+A* を入力した場合，*On Selection Change* と*On Mouse Move* の両方が発生します。これは仕様です。