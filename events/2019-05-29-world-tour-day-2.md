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

デバッガーの[実行行ハイライトカラー](https://doc.4d.com/4Dv17R4/4D/17-R4/Methods-Page.300-4085748.ja.html)はカスタマイズできるようになりました。

コードエディターおよびデバッガーは，[新しいキーボードショートカット](https://doc.4d.com/4Dv17R4/4D/17-R4/Debugger-Shortcuts.300-4053962.ja.html)をサポートしています。

[自動ブラケット補完](https://blog.4d.com/check-out-the-code-editor-enhancements/)を有効にすれば，素早く正確にコマンドや制御フローを入力することができます。

[メソッドエディターのステータスバー](https://blog.4d.com/check-out-the-code-editor-enhancements/)に表示される情報も見過ごせない改良点です。標準コマンドはもちろん，プロジェクトメソッドの引数タイプもコマンド入力中にアップデートされるため，仕様書やドキュメントを確認する手間が省けます。

<i class="fa fa-external-link" aria-hidden="true"></i> [スライド](https://speakerdeck.com/miyako/dezainmodo-4d-world-tour-2019-2ri-mu-yori)

### メソッドエディターの設定ファイル

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

### アクティベーション 

アクティベーションの手順がシンプルになりました。プロダクト番号を入力するだけで，紐づいているエクスパンション番号は自動的にインストールされます。

また，エクスパンションを追加購入した場合，再起動する必要なく，更新ボタンをクリックするか，コマンドの``Refresh licenses``で更新することができます。アップグレード（15→16→17→R5）も同様です。

スタンドアロン版の場合，ようこそ画面でログインすれば，ライセンス番号を入力する必要もなく，インターネット接続があれば，自動的にライセンスがインストールされます。Rバージョンのアップデートも自動的です。明示的な更新は，メジャーバージョンのアップグレードを実行するときにだけ必要です。なお，ようこそ画面のログインは，マシンアカウント毎に記憶されており，ログアウトするまではシステムを再起動しても持続するようになっています。

##  起動パラメーターの受け渡し
---

<i class="fa fa-download" aria-hidden="true"></i> [conf19-relaunch-and-test.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/relaunch-and-test-1.0)

下記のような[コマンドラインインタフェース](https://doc.4d.com/4Dv17R4/4D/17-R4/Command-Line-Interface.300-4085761.ja.html)（CLI）が使用できます。

| パラメーター | 意味 | 値 |
|:---|:---|:---|
|--structure |ストラクチャファイル |パス | 
|--data |データファイル |パス | 
|--opening-mode |実行モード | | 
|--create-data |新規データファイルを作成 | | 
|--user-param |起動パラメーター |任意の文字列 | 
|--headless |ユーザーインタフェースを表示しない |17R6 | 

## オブジェクト型
---

<i class="fa fa-download" aria-hidden="true"></i> [conf19-object.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/object-1.0)

オブジェクト型は，[``New object``](https://doc.4d.com/4Dv17/4D/17.1/New-object.301-4179445.ja.html)などのコマンドで作成したオブジェクトそのものではなく，オブジェクトにアクセスするための参照が代入される，という点がテキストや数値などの変数とは違います。

たとえば，オブジェクト型を別の変数にコピーするのであれば，代入演算子（``:=``）ではなく，[``OB Copy``](https://doc.4d.com/4Dv17/4D/17.1/OB-Copy.301-4179437.ja.html)を使用する必要があります。

```
C_OBJECT($o;$o2)

$o:=New object
$o.属性:="値"

  //$o2:=$o
$o2:=OB Copy($o)

$o.属性:="べつの値"

CLEAR VARIABLE($o)
```

オブジェクト配列に要素を追加する場合も同じです。

- 誤

```
ARRAY OBJECT($oo;0)
C_OBJECT($o)

$o:=New object("属性";"値")

For ($i;1;3)
	$o.属性:=String($i)+"番目の値"
	APPEND TO ARRAY($oo;$o)
End for 
```

- 正

```
ARRAY OBJECT($oo;0)

For ($i;1;3)
	APPEND TO ARRAY($oo;New object("属性";String($i)+"番目の値"))
End for 
```

### OB SETの特殊性

[``OB SET``](https://doc.4d.com/4Dv17/4D/17.1/OB-SET.301-4179438.ja.html)は特殊なコマンドです。``Null``のオブジェクトが渡された場合，自動的に新規オブジェクトが作成されるようになっています。

```
ARRAY OBJECT($oo;0)
C_OBJECT($o)

For ($i;1;3)
	OB SET($o;"属性";String($i)+"番目の値")
	APPEND TO ARRAY($oo;$o)
	CLEAR VARIABLE($o)
End for 
```

<i class="fa fa-external-link" aria-hidden="true"></i> [スライド](https://speakerdeck.com/miyako/obuziekutoxing-developer-conference-2018yori?slide=9)

### コレクション型

コレクション型は，[``New collection``](https://doc.4d.com/4Dv17/4D/17.1/New-collection.301-4179645.ja.html)などのコマンドで作成したコレクションそのものではなく，コレクションにアクセスするための参照が代入される，という点でオブジェクト型の同類に属します。

コレクション型の要素は，``0``から数えます。添字（インデックス）は，ブラケット記号（``[]``）で指定します。要素数（``length``プロパティ）を超えた要素に値を代入した場合，途中の要素には``Null``が代入されます。

```
C_COLLECTION($c)

$c:=New collection

$c[0]:="1番目の値"
$c[8]:="9番目の値"
```

従来の配列とは違い，コレクション型の要素は型を揃える必要はありません。``7``種類のJSONタイプに加え，ピクチャやポインターも代入できます。BLOB型は，現在のところ，サポートされていません。時間型と整数型は実数に変換されます。

- ``Null``
- ブール
- 数値
- 日付
- テキスト
- オブジェクト
- コレクション
- ピクチャ
- ポインター

### メンバーメソッド

コレクション型は，``38``種類のメンバーメソッドをサポートしています。比較的，使用する機会が多いのは，下記のメンバーメソッドかもしれません。

- 要素の付け足しと取り出し

	- [``push()``](https://doc.4d.com/4Dv17/4D/17.1/collectionpush.305-4179649.ja.html) 末尾に追加
	- [``unshift()``](https://doc.4d.com/4Dv17/4D/17.1/collectionunshift.305-4179669.ja.html) 先頭に追加
	- [``shift()``](https://doc.4d.com/4Dv17/4D/17.1/collectionshift.305-4179668.ja.html) 先頭を取り出し
	- [``pop()``](https://doc.4d.com/4Dv17/4D/17.1/collectionpop.305-4179658.ja.html) 末尾を取り出し

- 派生コレクションの作成

	- [``reverse()``](https://doc.4d.com/4Dv17/4D/17.1/collectionreverse.305-4179677.ja.html) 逆順のコレクションを作成
	- [``extract()``](https://doc.4d.com/4Dv17/4D/17.1/collectionextract.305-4179673.ja.html) （オブジェクト型のコレクションから）指定プロパティでコレクションを作成
	- [``concat()``](https://doc.4d.com/4Dv17/4D/17.1/collectionconcat.305-4179675.ja.html) 連結したコレクションを作成
	- [``copy()``](https://doc.4d.com/4Dv17/4D/17.1/collectioncopy.305-4179665.ja.html) コピーを作成
	
- コールバックメソッドで要素を処理

	- [``map()``](https://doc.4d.com/4Dv17/4D/17.1/collectionmap.305-4179678.ja.html) 要素値を別の値に置換
	- [``filter()``](https://doc.4d.com/4Dv17/4D/17.1/collectionfilter.305-4179661.ja.html) 条件に適う要素だけを抽出
	- [``reduce()``](https://doc.4d.com/4Dv17/4D/17.1/collectionreduce.305-4179688.ja.html) 要素を別のオブジェクトまたはコレクションにまとめる

### 型の特定と変換

オブジェクト型のプロパティやコレクション型の要素は，変数のように型が決まっているわけではないので，[``Type``](https://doc.4d.com/4Dv17/4D/17.1/Type.301-4178621.ja.html)ではなく，[``Value type``](https://doc.4d.com/4Dv17/4D/17.1/Value-type.301-4178634.ja.html)で型を特定します。

別の型に値を変換したい場合，[``OB Get``](https://doc.4d.com/4Dv17/4D/17.1/OB-Get.301-4179444.ja.html)を使用するか，[``String``](https://doc.4d.com/4Dv17/4D/17.1/String.301-4179471.ja.html) [``Num``](https://doc.4d.com/4Dv17/4D/17.1/Num.301-4179487.ja.html) [``Time``](https://doc.4d.com/4Dv17/4D/17.1/Time.301-4179455.ja.html) [``Date``](https://doc.4d.com/4Dv17/4D/17.1/Date.301-4179453.ja.html) [``Bool``](https://doc.4d.com/4Dv17/4D/17.1/Date.301-4179453.ja.html)のような関数を使用します。[``Date``](https://doc.4d.com/4Dv17/4D/17.1/Date.301-4179453.ja.html)にISO文字列を渡した場合，ローカルタイムゾーンに変換された日付が返されます。

### 日付型

オブジェクト型のプロパティやコレクション型の要素には，下記いずれかのフォーマットで日付型を代入することができます。

- 日付のみ（用途：生年月日）
- ローカル日付（用途：一般）
- 協定標準時（用途：インターネット・絶対時刻）

```
$date:=Current date
SET DATABASE PARAMETER(Dates inside objects;String type with time zone)
$o.属性:=$date
SET DATABASE PARAMETER(Dates inside objects;String type without time zone)
$o.属性:=$date
SET DATABASE PARAMETER(Dates inside objects;Dates inside objects)
$o.属性:=$date
```

## トランスポーター
---

<i class="fa fa-download" aria-hidden="true"></i> [conf19-send-mail.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/send-mail-1.0)

[トランスポーター](https://doc.4d.com/4Dv17R4/4D/17-R4/Mail.201-4069211.ja.html)は，メール送信に特化されたオブジェクトです。

4d Internet Commandsと比較した場合，下記の点で優れています。

- プリエンプティブモード対応
- IPv6サポート
- SMTPステータスコードをそのまま返す
- オブジェクト指向プログラミング
- BLOB（またはファイルパス）で添付ファイル
- ログファイルの出力（17R5）
- DIGEST-MD5 Kerberos OAUTH2 PKCS#11 認証プロトコルサポート（17R6）

<i class="fa fa-external-link" aria-hidden="true"></i> [スライド](https://speakerdeck.com/miyako/toransupota-4d-world-tour-2019-2ri-mu-yori)

![図: メール送信⑴](https://user-images.githubusercontent.com/10509075/58689655-98164080-83c2-11e9-8e86-0b2f66cd9ae2.png){: .align-center}

＜ 図: メール送信⑴ ＞
{: .text-center}

![図: メール送信⑵](https://user-images.githubusercontent.com/10509075/58689693-b2e8b500-83c2-11e9-9ec9-35d5ab3f8bab.png){: .align-center}

＜ 図: メール送信⑵ ＞
{: .text-center}

##  Undefined
---

<i class="fa fa-download" aria-hidden="true"></i> [conf19-undefined.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/undefined-1.0)

``Undefined``つまり未定義という「値」は，1. パラメーターが省略された場合，2. オブジェクト型の存在しないプロパティにアクセスした場合，3. 値を返さないコマンドまたはメソッドの戻り値を受け取ろうとした場合に発生します。v17では，そのような値の扱いが変わりました。1. 未定義を``If``などの条件文で評価した場合は``False``が返される，2. 未定義がパラメーターとして渡された場合はパラメーターに宣言型のデフォルト値が代入される，3. 存在しないプロパティのプロパティにアクセスした場合は``Undefined``が返されれる，という仕様です。なお，``Undefined``を[``Null``](https://doc.4d.com/4Dv17/4D/17.1/Null.301-4178633.ja.html)と比較した場合は``True``が返されます。

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

<i class="fa fa-download" aria-hidden="true"></i> [conf19-form.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/form.4dbase-1.0)

[``Form``](https://doc.4d.com/4Dv17/4D/17.1/Form.301-4179574.ja.html)を使用すれば，ウィンドウの中だけで有効な「ローカル変数」をフォームオブジェクトのデータソースに設定することができます。``Form``は，[``DIALOG``](https://doc.4d.com/4Dv17/4D/17.1/DIALOG.301-4179342.ja.html)で開いたウィンドウのコンテキストで使用することができます。``DIALOG``に渡したオブジェクトは，``Form``の初期値となり，ウィンドウが閉じられた後，ダイアログ実行中に更新された``Form``がそのオブジェクトに返されます。

![図: フォーム](https://user-images.githubusercontent.com/10509075/58557700-fffd4780-8259-11e9-92ca-c6698efd5684.png){: .align-center}

＜ 図: フォーム ＞
{: .text-center}

## 共有オブジェクトとストレージ
---

<i class="fa fa-download" aria-hidden="true"></i> [conf19-shared-object.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/shared-object-1.0)

[共有オブジェクト](https://doc.4d.com/4Dv17/4D/17.1/Shared-objects-and-shared-collections.300-4179447.ja.html)および[ストレージ](https://doc.4d.com/4Dv17/4D/17.1/Storage.301-4179448.ja.html)は，インタープロセス変数に代わるもので，プロセス間で情報を共有するための新しいメカニズムです。

![図: 共有オブジェクト](https://user-images.githubusercontent.com/10509075/58556339-c24aef80-8256-11e9-8f8d-d88f490a86d8.png){: .align-center}

＜ 図: 共有オブジェクト ＞
{: .text-center}

## シグナル
---

[シグナル](https://doc.4d.com/4Dv17R4/4D/17-R4/New-signal.301-4104310.ja.html)は``17 R4``から使用できるようになった特殊な共有オブジェクトです。

カスタムオブジェクトに``enqueue`` ``dequeue``といったメソッドを[``New formula``](https://doc.4d.com/4Dv17R4/4D/17-R4/New-formula.301-4055155.ja.html)で追加し，内部的にシグナルを使用するようなコードを記述すれば，簡易的なメッセージキューが実装できます。

<i class="fa fa-download" aria-hidden="true"></i> [conf19-signal-queue.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/signal-queue-1.1)

![図: メッセージキュー](https://user-images.githubusercontent.com/10509075/58517516-9d1e9880-81e6-11e9-8504-caf02af203d6.png){: .align-center}

＜ 図: メッセージキュー ＞
{: .text-center}

## ORDA
---

<i class="fa fa-download" aria-hidden="true"></i> [conf19-orda.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/orda-1.0)

既存のクエリやフォームを敢えてORDAで作り直す必要はないでしょう。しかし，ORDAを使用すれば，これまで難しかった処理や画面がシンプルかつスマートに実現できるかもしれません。

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

### ダッシュボード

ORDAは，リレーションやオブジェクト型の可視化が容易なので，総合情報画面（ダッシュボード）を作成するのに向いています。

![図: ダッシュボード](https://user-images.githubusercontent.com/10509075/58667271-8c9a2980-8370-11e9-90db-8177127413e6.png){: .align-center}

＜ 図: ダッシュボード ＞
{: .text-center}

#### 統計メソッド

```
C_LONGINT($1)
C_OBJECT($0;$営業日;$統計)

$ID:=$1

$営業日:=ds.営業日.get($ID)

If ($営業日#Null)
	
	C_OBJECT($today)
	$today:=ds.売上.query("日付 = :1";$営業日.ID)
	
	C_COLLECTION($lines)
	$lines:=$today.明細.extract("行").reduce("get_lines";New collection)
	
	$統計:=New object
	
	$統計.合計:=$lines.sum("個数")
	$統計.半額:=$lines.query("単価 = :1";150).sum("個数")
	$統計.値引:=$lines.query("単価 = :1";200).sum("個数")
	$統計.終了:=$today.query("明細.残数[a].商品名 in :1 and 明細.残数[a].終了時刻 != null";ds.洋菓子.all().名称)\
	.明細\
	.extract("残数")\
	.reduce("get_lines";New collection)\
	.query("終了時刻 != null")\
	.orderBy("終了時刻 asc")
	
End if 

$0:=$統計
```
