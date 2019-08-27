---
layout: post
title: “4D View Pro : 4Dメソッド設定上でコントロールする”
date: 2019-08-27 00:00:00
categories: ブログ
tags: 18.x 17r6
author: Fabrice Mainguené
---


![method-1](/images/blog/08/27/method-1.jpg)

4D View ProはRリリース毎にさらに機能豊かになりつつあり、4D v17 R6も例外ではありません！新しいコマンドによって、4Dメソッドのパラメータ、名前、タイプとサマリーを特定することができます。そして、あなたのメソッドがより情報豊かで説明的になり、それらをエンドユーザーが使う助けになります。

日にちや時間を宣言したい場合は？そのメソッドが何をするのかをユーザーが理解するのを補助するために、短い説明を与えるのはいかがでしょう。<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/VP-SET-ALLOWED-METHODS.301-4433810.ja.html"><span class="notranslate command">VP SET ALLOWED METHODS</span></a> コマンドで実行できるようになりました！

サンプルよりもこのコマンドを使う方法をより良く知る方法は何でしょう？あなたがサンプルの手順を読み終えて実行する頃までに、以下の結果が得られていることでしょう：

![BirthInformation](/images/blog/08/27/BirthInformation.png)

#### ステップ・バイ・ステップ・サンプル

<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/VP-SET-ALLOWED-METHODS.301-4433810.ja.html"><span class="notranslate command">VP SET ALLOWED METHODS</span></a>コマンドは、4Dメソッドを実行する新しい方法を提供します。以下のデモは4D View Proの式中にある”Birth Information” メソッドを呼び出したい場合にどのようにするかを示しています：

<code><span class="notranslate command">C_TEXT</span>(<span class="notranslate variable">$1</span>)<br />
<span class="notranslate command">C_DATE</span>(<span class="notranslate variable">$2</span>)<br />
<span class="notranslate command">C_TIME</span>(<span class="notranslate variable">$3</span>)<br />
<span class="notranslate command">C_TEXT</span>(<span class="notranslate variable">$0</span>)<br />
<span class="notranslate comment">// Create a string from parameters</span><br />
<span class="notranslate variable">$0</span>:=<span class="notranslate variable">$1</span>+" was born on "+<span class="notranslate command">String</span>(<span class="notranslate variable">$2</span>)+" at "+<span class="notranslate command">String</span>(<span class="notranslate variable">$3</span>)<br />
</code>

#### いかにしてメソッドを実行するか

オブジェクトを作成して、メソッドのコールネームを定義するためにオブジェクトの属性を使います：

<code><span class="notranslate variable">$o</span>:=<span class="notranslate command">New object</span><br />
<span class="notranslate comment">// Name of the method in 4D View Pro: "Birth Information"</span><br />
<span class="notranslate variable">$o</span>.<span class="notranslate objectattribut">BIRTH_INFORMATION</span>:=<span class="notranslate command">New object</span></code>

次に<span class="notranslate variable">$o</span>.<span class="notranslate objectattribut">BIRTH_INFORMATION</span> オブジェクトの中で、呼び出す4Dメソッドを定義します：

<p><code><span class="notranslate variable">$o</span>.<span class="notranslate objectattribut">BIRTH_INFORMATION</span>.<span class="notranslate objectattribut">method</span>:="Birth Information"</code>

#### 各パラメータに名前とタイプを追加する

メソッドのパラメータについて情報を持ったコレクションを追加します：

<code><span class="notranslate variable">$o</span>.<span class="notranslate objectattribut">BIRTH_INFORMATION</span>.<span class="notranslate objectattribut">parameters</span>:=<span class="notranslate command">New collection</span><br />
<span class="notranslate variable">$o</span>.<span class="notranslate objectattribut">BIRTH_INFORMATION</span>.<span class="notranslate objectattribut">parameters</span>.<span class="notranslate objectfunction">push</span>(<span class="notranslate command">New object</span>("name";"First name";"type";<span class="notranslate constant">Is text</span>))<br />
<span class="notranslate variable">$o</span>.<span class="notranslate objectattribut">BIRTH_INFORMATION</span>.<span class="notranslate objectattribut">parameters</span>.<span class="notranslate objectfunction">push</span>(<span class="notranslate command">New object</span>("name";"Birthday";"type";<span class="notranslate constant">Is date</span>))<br />
<span class="notranslate variable">$o</span>.<span class="notranslate objectattribut">BIRTH_INFORMATION</span>.<span class="notranslate objectattribut">parameters</span>.<span class="notranslate objectfunction">push</span>(<span class="notranslate command">New object</span>("name";"Time of birth";"type";<span class="notranslate constant">Is time</span>))</code>

#### サマリーを追加する

コマンドが何をするのかについてサマリーを特定します：

<code><span class="notranslate variable">$o</span>.<span class="notranslate objectattribut">BIRTH_INFORMATION</span>.<span class="notranslate objectattribut">summary</span>:="Returns a string from birth information"</code>

#### パラメータの数を特定する

最後に、4D View Pro式の中にある引数の数を、最小値と最大値を追加することで制限できます。例えば、パラメータの全てが必須の場合：

<code><span class="notranslate variable">$o</span>.<span class="notranslate objectattribut">BIRTH_INFORMATION</span>.<span class="notranslate objectattribut">minParams</span>:=3<br />
<span class="notranslate variable">$o</span>.<span class="notranslate objectattribut">BIRTH_INFORMATION</span>.<span class="notranslate objectattribut">maxParams</span>:=3</code>

メソッドが必要とする分だけ属性を作成することができます。それからメソッドオブジェクト(<span class="notranslate variable">$o</span>)を<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/VP-SET-ALLOWED-METHODS.301-4433810.fe.html"><span class="notranslate method">VP SET ALLOWED METHODS </span></a> コマンドに渡します：

<code><span class="notranslate method">VP SET ALLOWED METHODS</span> (<span class="notranslate variable">$o</span>)</code>
