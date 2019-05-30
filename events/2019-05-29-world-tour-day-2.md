---
layout: technote
title: "4D World Tour 2019（２日目）"
author: Keisuke Miyako
date: 2019-05-29 00:00:00
permalink: /event/2019-05-29/
standalone: true
---

4D World Tour 2019（２日目）
<!--more-->

##  Undefined
---

``Undefined``つまり未定義という「値」は，1. パラメーターが省略された場合，2. オブジェクト型の存在しないプロパティにアクセスした場合，3. 値を返さないコマンドまたはメソッドの戻り値を受け取ろうとした場合に発生します。v17では，そのような値の扱いが変わりました。1. 未定義を``If``などの条件文で評価した場合は``False``が返される，2. 未定義がパラメーターとして渡された場合はパラメーターに宣言型のデフォルト値が代入される，3. 存在しないプロパティのプロパティにアクセスした場合は``Undefined``が返されれる，という仕様です。なお，``Undefined``を<i class="fa fa-external-link" aria-hidden="true"></i> [``Null``](https://doc.4d.com/4Dv17/4D/17.1/Null.301-4178633.ja.html)と比較した場合は``True``が返されます。

<i class="fa fa-download" aria-hidden="true"></i> [conf19-undefined.4dbase.zip
](https://github.com/4D-JP/event-world-tour-2019/releases/tag/undefined-1.0)

```
C_TEXT($1)
C_DATE($2)
C_TIME($3)
C_LONGINT($4)
C_BOOLEAN($5)

If (Count parameters<5)
	If ($5)
		  //not error
	Else 
		TRACE
	End if 
End if 
```

```
C_OBJECT($o)

If ($o.a.b.c.d.e.f.g)
	  //not error
Else 
	TRACE
End if 
```

こちらの記事もご覧ください

[未定義の参照と代入](https://4d-jp.github.io/2019/05/11/undefined/)

## フォーム
---

<i class="fa fa-external-link" aria-hidden="true"></i> [``Form``](https://doc.4d.com/4Dv17/4D/17.1/Form.301-4179574.ja.html)を使用すれば，ウィンドウの中だけで有効な「ローカル変数」をフォームオブジェクトのデータソースに設定することができます。``Form``は，<i class="fa fa-external-link" aria-hidden="true"></i> [``DIALOG``](https://doc.4d.com/4Dv17/4D/17.1/DIALOG.301-4179342.ja.html)で開いたウィンドウのコンテキストで使用することができます。``DIALOG``に渡したオブジェクトは，``Form``の初期値となり，ウィンドウが閉じられた後，ダイアログ実行中に更新された``Form``がそのオブジェクトに返されます。

<i class="fa fa-download" aria-hidden="true"></i> [conf19-form.4dbase.zip
](https://github.com/4D-JP/event-world-tour-2019/releases/tag/form.4dbase-1.0)

![図: フォーム](https://user-images.githubusercontent.com/10509075/58557700-fffd4780-8259-11e9-92ca-c6698efd5684.png){: .align-center}

＜ 図: フォーム ＞
{: .text-center}

## 共有オブジェクトとストレージ
---

<i class="fa fa-external-link" aria-hidden="true"></i> [共有オブジェクト](https://doc.4d.com/4Dv17/4D/17.1/Shared-objects-and-shared-collections.300-4179447.ja.html)および<i class="fa fa-external-link" aria-hidden="true"></i> [ストレージ](https://doc.4d.com/4Dv17/4D/17.1/Storage.301-4179448.ja.html)は，インタープロセス変数に代わるもので，プロセス間で情報を共有するための新しいメカニズムです。

<i class="fa fa-download" aria-hidden="true"></i> [conf19-shared-object.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/shared-object-1.0)

![図: 共有オブジェクト](https://user-images.githubusercontent.com/10509075/58556339-c24aef80-8256-11e9-8f8d-d88f490a86d8.png){: .align-center}

＜ 図: 共有オブジェクト ＞
{: .text-center}

## シグナル
---

<i class="fa fa-external-link" aria-hidden="true"></i> [シグナル](https://doc.4d.com/4Dv17R4/4D/17-R4/New-signal.301-4104310.ja.html)は``17 R4``から使用できるようになった特殊な共有オブジェクトです。

カスタムオブジェクトに``enqueue`` ``dequeue``といったメソッドを<i class="fa fa-external-link" aria-hidden="true"></i> [``New formula``](https://doc.4d.com/4Dv17R4/4D/17-R4/New-formula.301-4055155.ja.html)で追加し，内部的にシグナルを使用するようなコードを記述すれば，簡易的なメッセージキューが実装できます。

<i class="fa fa-download" aria-hidden="true"></i> [conf19-signal-queue.4dbase.zip
](https://github.com/4D-JP/event-world-tour-2019/releases/tag/signal-queue-1.1)

![図: メッセージキュー](https://user-images.githubusercontent.com/10509075/58517516-9d1e9880-81e6-11e9-8504-caf02af203d6.png){: .align-center}

＜ 図: メッセージキュー ＞
{: .text-center}

## オブジェクト型
---

### ORDAリストボックス

![図: ORDAリストボックス](https://user-images.githubusercontent.com/10509075/58543752-05976500-823b-11e9-90d5-e19aac95b393.png){: .align-center}

＜ 図: ORDAリストボックス ＞
{: .text-center}

![図: 友人の友人の友人・・・ ](https://user-images.githubusercontent.com/10509075/58543949-62931b00-823b-11e9-8f58-a13dc4f89175.png){: .align-center}

＜ 図: 友人の友人の友人・・・ ＞
{: .text-center}
