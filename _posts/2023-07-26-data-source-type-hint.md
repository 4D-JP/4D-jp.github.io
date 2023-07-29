---
layout: fix
title: "式の型"
date: 2023-07-26 08:00:00
categories: 仕様
tags: v20 userinterface
---

v20では，ACI0103964の修正に伴い，`Open form window`の振る舞いが調整されました。

<i class="fa fa-external-link" aria-hidden="true"></i> [4D v20 修正リスト](https://4d-jp.github.io/2023/191/release-note-version-20/)

過去のバージョンでは，コマンドで表示したフォームに入力オブジェクトが配置されていた場合，そのデータソース（変数または式）が評価されました。ウィンドウサイズを正しく計算するためには，フォームオブジェクトの位置やサイズを解析する必要があり，入力オブジェクトであれば，データソースの型を知る必要があるためです。

とはいえ，ウィンドウを描画する時点でデータソースが評価されることは想定されていないかもしれません。たとえば，`Form`などのオブジェクトが存在する前提のメソッドはエラーを返すことになります。修正により，入力オブジェクトのサイズはデータソースを評価することによってではなく，式の型（`dataSourceTypeHint`）を参照することによって決まるように仕様が見直されました。今後，式の型が正しく設定されていない場合，ウィンドウサイズが変わってしまう可能性があります。一例として，ピクチャー型の入力オブジェクトはテキスト型とはボーダーのデザインが違っているため，正しくレンダリングされるためには，式の型もピクチャーに設定されている必要があります。

**参考**: <i class="fa fa-external-link" aria-hidden="true"></i> [Open form window + variable et expression](https://discuss.4d.com/t/open-form-window-variable-et-expression/27519)
