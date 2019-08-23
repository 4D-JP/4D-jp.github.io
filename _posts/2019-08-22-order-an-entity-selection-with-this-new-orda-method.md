---
layout: post
title: “新しいORDAメソッドを使ってエンティティ・セレクションをソートする”
date: 2019-08-22 00:00:00
categories: ブログ
tags: 18.x 17r6
author: Marie-Sophie Landrieu-Yvert
---

![HDIabout-1024x512](/images/blog/08/22/HDIabout-1024x512.jpg)

<a href="https://blog.4d.com/more-sophisticated-orda-queries-with-formulas/"><span class="notranslate command">前のブログ投稿</a></span>で、ORDA クエリーの中で式を適用して、洗練された複雑な検索条件をどのように構築するかを説明しました。さらに完全で強力な開発ツールを使って提供できるのが、新しいORDA メソッドの<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/entitySelectionorderByFormula.305-4404512.en.html"><span class="notranslate objectfunction">orderByFomula()</a></span> です。formulas の助けによって、プロジェクト・メソッドあるいは4D式の中で複雑な条件を使ってエンティティ・セレクションのソートができます。

{:.download}
[式を使ったエンティティ・セレクションのソート]("https://download.4d.com/Demos/4D_v17_R6/HDI_Order_ByFormula.zip") 

ソート条件は、式がストリングあるいは<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/Formula.301-4311678.ja.html"><span class="notranslate command"> Formula </a></span>オブジェクトとしてorderByFormula() メソッドに与えられた時に評価されます。

#### Stringとして式をソートする

ここにデータクラス、Companiesがあります。これからこの企業を収益（収益 = 収入 - 支出）を基にソートします。

エンティティはThis コマンドでアクセスすることに注意しましょう。

<code class=“fourd”><span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$companies</span>;<span class="notranslate variable">$orderedCompanies</span>;<span class="notranslate variable">$formula</span>)<br>
<span class="notranslate variable">$formula</span>:= <span class="notranslate command">Formula</span>(<span class="notranslate command">This</span>.<span class="notranslate objectattribut">revenue</span> - <span class="notranslate command">This</span>.<span class="notranslate objectattribut">costs</span>)<br>
<span class="notranslate variable">$companies</span>:=<span class="notranslate command">ds</span>.<span class="notranslate tablename">Companies</span>.<span class="notranslate objectfunction">all()</span><br>
<span class="notranslate variable">$orderedCompanies</span>:=<span class="notranslate variable">$companies</span>.<span class="no-translate objectfunction">orderByFormula </span>(<span class="notranslate variable">$formula</span>;<span class="notranslate constant">dk descending</span>)</code>


#### Formulaオブジェクトを使ったソート

では同じ条件を使って企業をソートしますが、ストリングの代わりに、Formula オブジェクトを使い、降順でソートします。

<code class=“fourd”><span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$companies</span>;<span class="notranslate variable">$orderedCompanies</span>;<span class="notranslate variable">$formula</span>)<br>
<span class="notranslate variable">$formula</span>:= <span class="notranslate command">Formula</span>(<span class="notranslate command">This</span>.<span class="notranslate objectattribut">revenue</span> - <span class="notranslate command">This</span>.<span class="notranslate objectattribut">costs</span>)<br>
<span class="notranslate variable">$companies</span>:=<span class="notranslate command">ds</span>.<span class="notranslate tablename">Companies</span>.<span class="notranslate objectfunction">all()</span><br>
<span class="notranslate variable">$orderedCompanies</span>:=<span class="notranslate variable">$companies</span>.<span class="notranslate objectfunction">orderByFormula </span>(<span class="notranslate variable">$formula</span>;<span class="notranslate constant">dk descending</span>)</code>

<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/Formula.301-4311678.ja.html"><span class="notranslate command"> Formula </a></span> オブジェクトを使うことで、式をストリングとして使うよりもいくつかの利点（自動補完、コードエディター内の色指定、など）があります。

<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/entitySelectionorderByFormula.305-4404512.ja.html"><span class="notranslate objectfunction">orderByFomula()</a></span> メソッドはさらに多くのオプションがあります。詳しくは<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/entitySelectionorderByFormula.305-4404512.ja.html">ドキュメント</a>をチェックし、上記のサンプルデータベース (HDI)をダウンロードしてください。

#### エンティティ・セレクションのソートについて

<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/dataClassquery.305-4311816.ja.html"><span class="notranslate objectfunction">query()</a></span> メンバーメソッド自体の内部に<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/entitySelectionorderBy.305-4311825.ja.html"><span class="notranslate objectfunction">order by</a></span> ステートメントを挿入することができます。これはクラアント/サーバー・モードで使う場合には大きな利点で、クエリーとソートアクションを同じリクエスト中に組み合わせることができ、サーバーとネットワークトラフィックに送られるリクエストの数を減らします。

<code class=“fourd”><span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$companies</span>)<br>
<span class="notranslate variable">$companies</span>:=<span class="notranslate command">ds</span>.<span class="notranslate tablename">Companies</span>.<span class="notranslate objectfunction">query</span>("revenue&gt; :1 order by costs desc";5000)</code>


