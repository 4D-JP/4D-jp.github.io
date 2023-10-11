---
layout: technote
title: "4D View Proのセルにボタンを配置する"
position: 20231011001
date: 2023-10-11 00:00:00
categories: ヒント
tags: viewpro
version: 18 19 20
---

質問：4D View Proのセルにボタンを置くことはできますか。

回答：はい、できます。しかし、Javascriptを使う必要があります。

<!--more-->

## 説明

4D View Proのセルにボタンを置くことはできますが、4D View Proコンポーネントメソッドとしては用意されていないので、Javascriptを使う必要があります。

こうしたJavascriptを利用する使い方については、リファレンスとして公開されています。

> [Javascript による高度なプログラミング](https://developer.4d.com/docs/ja/ViewPro/advanced-programming/)

以下は上記リファレンスからの抜粋引用です。
> 4D View Pro Area エリアは、`埋め込みWebレンダリングエンジン`を使用する`Webエリアフォームオブジェクト`です。 つまり、他のWebエリアと同様に、`WA Evaluate Javascript`4Dコマンドを呼び出すことで、`Javascript`のコードを実行させることができます。
>
> `4D View Pro`は`SpreadJS スプレッドシートソリューション`に基づいて動作するため、`4D View Pro`エリア内で`SpreadJS`の`Javascriptメソッド`を呼び出すことも可能です。

## 実際のコード

4D View Proエリアにボタンを表示して、ボタンをクリックした時に４Ｄのプロジェクトメソッドを呼ぶ例題を考えてみました。

まず、呼び出される４Ｄのプロジェクトメソッドのコードです。

```4d
var $1 : Text
ALERT($1)
```

特に説明は不要かもしれませんが、
このプロジェクトメソッドは、渡された引数をALERTコマンドで表示するシンプルなメソッドです。
この例題では、`METHOD_TEST`という名称のプロジェクトメソッドとして作成して使います。

次に、4D View Proエリアにボタンをセットして、ボタンが押された時に、前述の`METHOD_TEST`プロジェクトメソッドを呼び出すようにするコードです。

```4d
//4D View Proエリアのオブジェクト名
$ViewAreaName:="ViewProArea"

//ボタンを置くセルの位置
$row:=3  //行（一番上は0）
$col:=0  //列（左端は0）

//セルにボタンをセットする
$jsScript:=\
"var btn = new GC.Spread.Sheets.CellTypes.Button();"+\
"btn.text('Test');"+\
"spread.getActiveSheet().setCellType("+String($row)+","+String($col)+", btn, GC.Spread.Sheets.SheetArea.viewport);"
$res:=WA Evaluate JavaScript(*; $ViewAreaName; $jsScript; Is object)

//ボタンが押されたときのイベントを設定する
$jsScript:=\
" spread.bind( GC.Spread.Sheets.Events.ButtonClicked, function (e, args) {"\
+"    var sheet = args.sheet, row = args.row, col = args.col;"\
+"    var cellType = spread.getActiveSheet().getCellType(row, col);"\
+"    if (cellType instanceof GC.Spread.Sheets.CellTypes.Button) {"\
+"        $4d.METHOD_TEST(\"Button Clicked\");"\
+"    }"\
+"});"
$res:=WA Evaluate JavaScript(*; $ViewAreaName; $jsScript; Is object)
```

## コードの説明

4D View Proエリアにボタンをセットする前述のコードを３つのパートに分けて、説明します。

### 環境定義パート

見てお分りいただけると思いますが、４Ｄのフォームに配置してある4D View Proエリアの名前を変数定義するパートです。

```4d
//4D View Proエリアのオブジェクト名
$ViewAreaName:="ViewProArea"
```

### ボタン配置パート

実際にボタンを配置するパートです。

```4d
//ボタンを置くセルの位置
$row:=3  //行（一番上は0）
$col:=0  //列（左端は0）

//セルにボタンをセットする
$jsScript:=\
"var btn = new GC.Spread.Sheets.CellTypes.Button();"+\
"btn.text('Test');"+\
"spread.getActiveSheet().setCellType("+String($row)+","+String($col)+", btn, GC.Spread.Sheets.SheetArea.viewport);"
$res:=WA Evaluate JavaScript(*; $ViewAreaName; $jsScript; Is object)
```

ボタンの数に合わせて、実行する必要がありますが、この例題では１つだけボタンを置いています。
ボタンのラベルには`Test`と表示されます。

このコードの部分は、`SpreadJS`のリファレンスにあるコードを参考にして記述しました。

> [SpreadJS: ボタン型セル](https://demo.grapecity.com/spreadjs/demos/features/cells/cell-types/button/purejs)


### イベント宣言パート

ボタンが押されたときの動作を宣言するパートです。

Javascriptでは、イベントが発生したときの動作を宣言して利用します。

```4d
//ボタンが押されたときのイベントを設定する
$jsScript:=\
" spread.bind( GC.Spread.Sheets.Events.ButtonClicked, function (e, args) {"\
+"    var sheet = args.sheet, row = args.row, col = args.col;"\
+"    var cellType = spread.getActiveSheet().getCellType(row, col);"\
+"    if (cellType instanceof GC.Spread.Sheets.CellTypes.Button) {"\
+"        $4d.METHOD_TEST(\"Button Clicked\");"\
+"    }"\
+"});"
$res:=WA Evaluate JavaScript(*; $ViewAreaName; $jsScript; Is object)
```

このコードの部分は、`SpreadJS`のリファレンスにあるコードを参考にして記述しました。

> [SpreadJS: Eventsクラス ButtonClicked](https://demo.grapecity.com/spreadjs/api/classes/GC.Spread.Sheets.Events#buttonclicked)


`SpreadJS`の`GC.Spread.Sheets.Events.ButtonClicked`イベント発生時に、動作する`Javascript`の`function`（`無名関数`）を定義しています。

この関数では、`$4d.METHOD_TEST(\"Button Clicked\");`というコードが、ボタンが押されたときのイベントで実行されるように記述しています。
この関数により、ボタンが押されたときには、`METHOD_TEST`プロジェクトメソッドに`Button Clicked`という文字列が引数として渡されて実行されます。

こうして、ボタンを押すと"Button Clicked"というアラートが表示する仕組みが構築できます。

$4dは、Webエリアに埋め込まれた４Ｄ用のJavaScriptオブジェクトです。
$4dのプロパティにメソッド名を記述することでWebエリアから４Ｄのメソッドを呼び出すことができます。

Webエリアでは、$4dを明示的にインスタンス化するための属性を有効にする必要がありますが、4D View Proではインスタンスとして存在しますので、特に宣言をせずとも利用できます。

> [Webエリア](https://developer.4d.com/docs/ja/FormObjects/propertiesWebArea/)

## まとめ

4D View Proには４Ｄからの利用のために、コンポーネントメソッドを用意していますが、SpreadJSの機能のすべてをカバーしきれていません。

> [4D View Pro メソッド一覧](https://developer.4d.com/docs/ja/ViewPro/method-list)

今後は、SpreadJSの機能をより簡単に使えるように進化し続けますが、仮にメソッドやクラスで用意されていない機能であっても、この記事のようにJavascriptを使い拡張して利用することが可能です。
