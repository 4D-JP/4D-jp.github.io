---
layout: technote
title: "4D World Tour 2019（２日目）"
author: Keisuke Miyako
date: 2019-05-29 00:00:00
permalink: /event/2019-05-29/
standalone: true
---

##  デザインモード
---

デザインモードの便利な使い方を知っていれば，仕事の能率が上がります。逆に知らないと，無駄な作業に余計な時間を費やしてしまい，機会の損失につながるかもしれません。

デバッガーの<i class="fa fa-external-link" aria-hidden="true"></i> [実行行ハイライトカラー](https://doc.4d.com/4Dv17R4/4D/17-R4/Methods-Page.300-4085748.ja.html)はカスタマイズできるようになりました。

コードエディターおよびデバッガーは，<i class="fa fa-external-link" aria-hidden="true"></i> [新しいキーボードショートカット](https://doc.4d.com/4Dv17R4/4D/17-R4/Debugger-Shortcuts.300-4053962.ja.html)をサポートしています。

<i class="fa fa-external-link" aria-hidden="true"></i> [自動ブラケット補完](https://blog.4d.com/check-out-the-code-editor-enhancements/)を有効にすれば，素早く正確にコマンドや制御フローを入力することができます。

<i class="fa fa-external-link" aria-hidden="true"></i> [メソッドエディターのステータスバー](https://blog.4d.com/check-out-the-code-editor-enhancements/)に表示される情報も見過ごせない改良点です。標準コマンドはもちろん，プロジェクトメソッドの引数タイプもコマンド入力中にアップデートされるため，仕様書やドキュメントを確認する手間が省けます。

<i class="fa fa-external-link" aria-hidden="true"></i> [スライド](https://speakerdeck.com/miyako/dezainmodo-4d-world-tour-2019-2ri-mu-yori)

<i class="fa fa-download" aria-hidden="true"></i> [conf19-themes.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/themes-0.9)

![図: メソッドエディターの設定ファイル⑴](https://user-images.githubusercontent.com/10509075/57895878-c0615380-7888-11e9-84ec-f5dc9fbc2e6e.png){: .align-center}

＜ 図: メソッドエディターの設定ファイル⑴ ＞
{: .text-center}

![図: メソッドエディターの設定ファイル⑵](https://user-images.githubusercontent.com/10509075/57895833-9f006780-7888-11e9-9dd2-b71753ffda76.png){: .align-center}

＜ 図: メソッドエディターの設定ファイル⑵ ＞
{: .text-center}

![図: メソッドエディターの設定ファイル⑶](https://user-images.githubusercontent.com/10509075/57895794-7b3d2180-7888-11e9-8d87-5ab452985d2b.png){: .align-center}

＜ 図: メソッドエディターの設定ファイル⑶ ＞
{: .text-center}

##  起動パラメーターの受け渡し
---

下記のような<i class="fa fa-external-link" aria-hidden="true"></i> [コマンドラインインタフェース](https://doc.4d.com/4Dv17R4/4D/17-R4/Command-Line-Interface.300-4085761.ja.html)（CLI）が使用できます。

| パラメーター | 意味 | 値 |
|:---|:---|:---|
|--structure |ストラクチャファイル |パス | 
|--data |データファイル |パス | 
|--opening-mode |実行モード | | 
|--create-data |新規データファイルを作成 | | 
|--user-param |起動パラメーター |任意の文字列 | 
|--headless |ユーザーインタフェースを表示しない |17R6 | 

<i class="fa fa-download" aria-hidden="true"></i> [conf19-relaunch-and-test.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/relaunch-and-test-1.0)

##  Undefined
---

``Undefined``つまり未定義という「値」は，1. パラメーターが省略された場合，2. オブジェクト型の存在しないプロパティにアクセスした場合，3. 値を返さないコマンドまたはメソッドの戻り値を受け取ろうとした場合に発生します。v17では，そのような値の扱いが変わりました。1. 未定義を``If``などの条件文で評価した場合は``False``が返される，2. 未定義がパラメーターとして渡された場合はパラメーターに宣言型のデフォルト値が代入される，3. 存在しないプロパティのプロパティにアクセスした場合は``Undefined``が返されれる，という仕様です。なお，``Undefined``を<i class="fa fa-external-link" aria-hidden="true"></i> [``Null``](https://doc.4d.com/4Dv17/4D/17.1/Null.301-4178633.ja.html)と比較した場合は``True``が返されます。

<i class="fa fa-download" aria-hidden="true"></i> [conf19-undefined.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/undefined-1.0)

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

<i class="fa fa-download" aria-hidden="true"></i> [conf19-form.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/form.4dbase-1.0)

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

<i class="fa fa-download" aria-hidden="true"></i> [conf19-signal-queue.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/signal-queue-1.1)

![図: メッセージキュー](https://user-images.githubusercontent.com/10509075/58517516-9d1e9880-81e6-11e9-8504-caf02af203d6.png){: .align-center}

＜ 図: メッセージキュー ＞
{: .text-center}

## ORDA
---

<i class="fa fa-download" aria-hidden="true"></i> [conf19-orda.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/orda-1.0)

### リレーション

ORDAを使用すれば，複雑なリレーショナルクエリをシンプルに記述することができます。

![図: リレーション](https://user-images.githubusercontent.com/10509075/58666136-7b9be900-836d-11e9-8dad-2ae073c62986.png){: .align-center}

＜ 図: リレーション ＞
{: .text-center}

![図: ORDA ](https://user-images.githubusercontent.com/10509075/58666433-404dea00-836e-11e9-922b-5377c208764c.png){: .align-center}

＜ 図: ORDA ＞
{: .text-center}

![図: 従来のクエリ ](https://user-images.githubusercontent.com/10509075/58666367-1ac0e080-836e-11e9-8118-3616b210f9ab.png){: .align-center}

＜ 図: 従来のクエリ ＞
{: .text-center}

### オブジェクト型

ORDAを使用すれば，オブジェクト型フィールドのリンクされたクエリもシンプルに記述することができます。

![図: オブジェクト型](https://user-images.githubusercontent.com/10509075/58666654-ea2d7680-836e-11e9-887c-a03221b7dd60.png){: .align-center}

＜ 図: オブジェクト型 ＞
{: .text-center}

![図: ORDA](https://user-images.githubusercontent.com/10509075/58666684-ff0a0a00-836e-11e9-9aec-3008efb8b8ed.png){: .align-center}

＜ 図: ORDA ＞
{: .text-center}

### リストボックス

エンティティセレクション型のリストボックスは，下記のプロパティで簡単にコントロールすることができます。

- コレクションまたはエンティティセレクション
- カレントの項目
- カレントの項目の位置
- 選択された項目
- メタ情報式

#### フォームイベント

```
$event:=Form event

Case of 
: ($event=On Load)

	Form.List1:=New object("col";Null;"sel";Null;"pos";Null;"item";Null;"items";Null)

	Form.List1.highlightFormat:=New object("stroke";"#FFFFFF";"fill";"#F9AA33")

	Form.List1.col:=ds.名簿.all()
		
End case 
```

#### メタ情報式

```
C_TEXT($1;$Me)
C_OBJECT($0)

$Me:=$1  //OBJECT Get name(Object current) does not work in meta

If (Form[$Me].items.contains(This))
	$0:=Form[$Me].highlightFormat
End if 
```

![図: コレクション型リストボックス](https://user-images.githubusercontent.com/10509075/58664780-55287e80-836a-11e9-9068-f5f91e56a7eb.png){: .align-center}

＜ 図: コレクション型リストボックス ＞
{: .text-center}

### 複数の「カレントレコード」「カレントセレクション」

ORDAを使用すれば，同一のテーブルに由来する複数のエンティティ（カレントレコード）やエンティティセレクション（カレントセレクション）を同時に扱うことができます。

![図: リストボックス](https://user-images.githubusercontent.com/10509075/58543752-05976500-823b-11e9-90d5-e19aac95b393.png){: .align-center}

＜ 図: リストボックス ＞
{: .text-center}

### N to N リレーション

ORDAで記述すれば，再帰的なN to N リレーションのエンティティセレクションを簡単に取り出すことができます。

```
$friends:=$person.friends.person.friends.person.minus($person)
```

![図: 友人の友人の友人・・・ ](https://user-images.githubusercontent.com/10509075/58543949-62931b00-823b-11e9-8f58-a13dc4f89175.png){: .align-center}

＜ 図: 友人の友人の友人・・・ ＞
{: .text-center}
