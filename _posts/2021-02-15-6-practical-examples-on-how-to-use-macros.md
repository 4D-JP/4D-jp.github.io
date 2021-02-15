---
layout: post
title: "マクロの使用例 6つ"
date: 2021-02-15 11:00:00
categories: ブログ
tags: v18R5 Form-editor
author: Vanessa Talbot
---

![6 practical examples on how to use macros](/images/blog/20210215/macroTip.png)

4D v18 R5 ではマクロが導入されました。フォームエディター上で繰り返しおこなうタスクを自動化するのに、マクロは非常に便利です。このブログ記事ではいくつかの基本的な例とともに、マクロがどう機能するのか、なにが可能なのかを紹介します。
詳細については、[オンラインマニュアル](http://developer.4d.com/docs/ja/FormEditor/macros.html)も参照ください。

{:.download}
[HDI: マクロの使用例 6つ](https://github.com/4D-JP/HDI/releases/download/18r5/HDI_FormMacro.zip)


#### マクロの用途

マクロを使って次のことをおこなえます:

* オブジェクトプロパティの追加・変更・削除
* メソッド付きのオブジェクトの追加・削除
* オブジェクトの選択・選択解除
* モーダルダイアログの表示とパラメーターの入力
* オブジェクトの配置・移動
* フォームオブジェクトをテンプレートとしてCSSクラスを作成
* ピクチャーパスの検証
* CSSファイルを開く
* XLIFF参照の検証

など

いくつかの例を実際に見てみましょう。
例1ではマクロの作り方・実行の仕方も説明します。


#### 例1: フォームオブジェクトの属性を変更する

選択されているフォームオブジェクトのフォントカラーを赤に設定するマクロです。

まず、JSONマクロファイル (FormMacros.json) 内で、次のようにマクロを宣言します:

<pre class="notranslate">{
      {
   "macros": {
      "赤に設定する": {
         "class": "SetRedColor"
      }
}</pre>

次に4D内で、マクロによって呼び出される "SetRedColor" クラスを作成します。<br />
このクラスの関数として、呼び出し時に実行される onInvoke 関数を設定します。<br />
実行時にこの関数に渡される引数には、フォームエディターの情報が含まれています。<br />
引数内の “currentSelection” プロパティから、選択されているフォームオブジェクトのコレクションが取得できます。<br />
コレクションに格納されている各フォームオブジェクトの属性を変更します。<br />
最後に、戻り値として "currentPage" 属性を返すことで、4Dに変更内容を通知します。<br />

コードは次のようになります:

<code class="fourd"><span class="notranslate keyword">Function onInvoke</span>(<span class="notranslate variable">$editor</span> : <span class="notranslate command">Object</span>) : <span class="notranslate command">Object</span><br>
&nbsp;<span class="notranslate keyword">var</span> <span class="notranslate variable">$name</span> : <span class="notranslate command">Text</span><br>
&nbsp;<span class="notranslate keyword">If</span> (<span class="notranslate variable">$editor</span>.<span class="notranslate objectattribut">editor</span>.<span class="notranslate objectattribut">currentSelection</span>.<span class="notranslate objectattribut">length</span>&gt;0) <br>
&nbsp;<span class="notranslate comment">// 選択オブジェクトのstroke属性を "red" に設定します</span><br>
&nbsp; <span class="notranslate keyword">For each</span> (<span class="notranslate variable">$name</span>;<span class="notranslate variable">$editor</span>.<span class="notranslate objectattribut">editor</span>.<span class="notranslate objectattribut">currentSelection</span>)<br>
&nbsp;&nbsp; <span class="notranslate variable">$editor</span>.<span class="notranslate objectattribut">editor</span>.<span class="notranslate objectattribut">currentPage</span>.<span class="notranslate objectattribut">objects</span>[<span class="notranslate variable">$name</span>].<span class="notranslate objectattribut">stroke</span>:="red"<br>
&nbsp; <span class="notranslate keyword">End for each</span> <br>
&nbsp;<span class="notranslate keyword">Else</span> <br>
&nbsp; <span class="notranslate command">ALERT</span>("フォームオブジェクトを選択してください。")<br>
&nbsp;<span class="notranslate keyword">End if </span><br>
&nbsp;<span class="comment">// 4D に変更内容を通知します</span> <br>
&nbsp;<span class="notranslate variable">$0</span>:=<span class="notranslate command">New object</span>("currentPage";<span class="notranslate variable">$editor</span>.<span class="notranslate objectattribut">editor</span>.<span class="notranslate objectattribut">currentPage</span>)</code>

マクロが実行するには、フォームエディター上でコンテキストメニューを開き、「マクロ ＞ 赤に設定する」 を選択します。<br />
マクロのコードを格納している "SetRedColor" クラスを HDI内で確認してください。


#### 例2: JSONマクロファイル内でパラメーターを設定して利用する

赤だけでなく、緑のフォントカラーも利用したい場合、2つのマクロと、それぞれに専用のクラスを作成することもできますが、2つのマクロにそれぞれパラメーターを設定して、それらを1つのクラスで処理することも可能です。


JSONマクロファイル (FormMacros.json) 内で、同じ "SetFontColor" クラスと、異なる "color" パラメーターが設定された 2つのマクロを宣言します:

<pre class="notranslate">{
   "macros": {
      "フォントカラーを赤に設定する": {
         "class": "SetFontColor",
         "color": "red"
      },
      "フォントカラーを緑に設定する": { 
         "class": "SetFontColor", 
         "color": "green"
      },
}</pre>

この "color" パラメーターはクラスのコンストラクターで取得します:

<code class="fourd"><span class="notranslate keyword">Class constructor</span><br>
&nbsp;<span class="notranslate keyword">var</span> <span class="notranslate variable">$1</span> : <span class="notranslate command">Object</span><br>
&nbsp;<span class="notranslate command">This</span>.<span class="notranslate objectattribut">color</span>:=<span class="notranslate variable">$1</span>.<span class="notranslate objectattribut">color</span></code>

"SetFontColor" クラスの onInvoke 関数には例1と同じコードが再利用できます。異なる点は "red" という文字列で色を指定する代わりに、変数 This.color を使うことです。


#### 例3: メソッド付きのフォームオブジェクトを追加する

マクロを使って、メソッドの付いたフォームオブジェクトをフォームに追加することができます。メソッドを紐づける方法は複数あります。[オンラインマニュアル](https://developer.4d.com/docs/ja/FormEditor/macros.html#method-%E5%B1%9E%E6%80%A7)にて、それらの方法を説明しています。

このHDIの例では、メソッドのコードをオブジェクトに格納して4Dに渡します。当該メソッドファイルは実行時に 4D によって作成されます。

<code class="fourd"><span class="notranslate keyword">Function onInvoke</span>(<span class="notranslate variable">$editor</span> : <span class="notranslate command">Object</span>)-&gt;<span class="notranslate variable">$result</span> : <span class="notranslate command">Object</span><br>
&nbsp;<span class="notranslate keyword">var</span> <span class="notranslate variable">$btnHello</span> : <span class="notranslate command">Object</span><br>
<br>
<span class="notranslate comment">&nbsp;// "Hello" ボタンを作成します</span> <br>
&nbsp;<span class="notranslate variable">$btnHello</span>:=<span class="notranslate command">New object</span>("type";"button";<span class="notranslate comment">\</span> <br>
&nbsp; "text";"Hello World!";<span class="notranslate comment">\</span> <br>
&nbsp; "method";<span class="notranslate command">New object</span>("source";"ALERT(\"coucou\")");<span class="notranslate comment">\</span> <br>
&nbsp; "events";<span class="notranslate command">New collection</span>("onClick");<span class="notranslate comment">\</span> <br>
&nbsp; "width";120;<span class="notranslate comment">\</span> <br>
&nbsp; "height";20;<span class="notranslate comment">\</span> <br>
&nbsp; "top";0;<span class="notranslate comment">\</span> <br>
&nbsp; "left";0)&nbsp;<br>
<br>
<span class="notranslate comment">&nbsp;// 現在のページにボタンを追加します</span>	 <br>
&nbsp;<span class="notranslate variable">$editor.<span class="notranslate objectattribut">editor</span></span>.<span class="notranslate objectattribut">currentPage</span>.<span class="notranslate objectattribut">objects</span>.<span class="notranslate objectattribut">btnHello</span>:=<span class="notranslate variable">$btnHello</span>&nbsp; <br>
<span class="notranslate comment">&nbsp;// フォームエディター上で新規作成したボタンを選択します</span> <br>
&nbsp;<span class="notranslate variable">$editor.<span class="notranslate objectattribut">editor</span></span>.<span class="notranslate objectattribut">currentSelection</span>.<span class="notranslate objectfunction">clear</span>() <br>
&nbsp;<span class="notranslate variable">$editor.<span class="notranslate objectattribut">editor</span></span>.<span class="notranslate objectattribut">currentSelection</span>.<span class="notranslate objectfunction">push</span>("btnHello")<br>
<br>
&nbsp;<span class="notranslate comment">// 4D に変更内容を通知します</span> <br>
&nbsp;<span class="notranslate variable">$result</span>:=<span class="notranslate command">New object</span> <br>
&nbsp;<span class="notranslate variable">$result</span>.<span class="notranslate objectattribut">currentSelection</span>:=<span class="notranslate variable">$editor.<span class="notranslate objectattribut">editor</span></span>.<span class="notranslate objectattribut">currentSelection</span> <br>
&nbsp;<span class="notranslate variable">$result</span>.<span class="notranslate objectattribut">currentPage</span>:=<span class="notranslate variable">$editor.<span class="notranslate objectattribut">editor</span></span>.<span class="notranslate objectattribut">currentPage</span> <br>
</code>

作成したばかりのフォームオブジェクトを編集しやすいよう、"currentSelection" を対象に clear() および push() を使用することで、このフォームオブジェクトを選択します。<br />
最後に、戻り値として　"currentPage" 属性とともに "currentSelection" 属性も返し、4Dに変更内容を通知します。


#### 例4: フォームで使用されているピクチャーパスを確認する

フォームを編集するだけでなく、フォームの情報、属性、プロパティを検証するマクロも作れます。たとえば、複数のページを持つフォーム内で使用されているピクチャーパスを検証することができます。

![ピクチャーパスの検証](/images/blog/20210215/CheckInvalidImagePath.png)


#### 例5: マクロでモーダルウィンドウを開く

マクロはモーダルウィンドウを開いてダイアログを表示することができます。
たとえば、現在のページ上にあるオブジェクトの一覧を、それらのオブジェクト名、タイプ、クラスなど任意のプロパティとともに表示することができます。一覧からオブジェクトを選択して、ダイアログ内の "選択" ボタンをクリックすると、フォームエディター上でも選択されるようにできます。

![モーダルダイアログを開く](/images/blog/20210215/MacroWithDialog.png)

このマクロのコードを格納している "ObjectList" クラスを HDI内で確認してください。


#### 例6: オブジェクトを整列する

4Dでオブジェクトを整列するには "整列" ダイアログも使用できますが、いくつかのオブジェクトを選択して、ターゲットオブジェクト (マクロ呼び出し時にマウスカーソルが置かれているオブジェクト) を基準に位置を揃えることもできます。

コードを書く際には:
* 選択されているオブジェクトは “currentSelection” プロパティから取得します。
* ターゲットオブジェクトの名称は “target” プロパティから取得します。

![オブジェクトの整列-デバッガー画面](/images/blog/20210215/MacroAlignDebugger.png)

このように、整列も均等配置も任意に実行するマクロを作成することができます。
“AlignOnTarget” クラスでは、左揃え・右揃え・上揃え・下揃えの例を確認することができます。
