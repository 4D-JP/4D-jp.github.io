---
layout: post
title: “リクエストログを使ってORDAコードを最適化”
date: 2019-09-03 00:00:00
categories: ブログ
tags: 18.x 17r6
author: Marie-Sophie Landrieu-Yvert
---

![logOrdaRequests—blanc-1024x512](/images/blog/03/logOrdaRequests-blanc-1024x512.jpg)

これまでにクライアントと4D Server間で送信されるORDAのリクエストのトラフィックを分析する必要を感じたことはありませんか？時にサーバーからレスポンスを受け取るまでに間があることがあります。それがネットワークのトラフィックのせいなのか、あるいは最適化されていないリクエストを書いたせいなのか考えさせられる場合があります。幸いなことに、4D V17 R6は、<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/ds.301-4311854.ja.html"><span class="notranslate command">ds</span></a> オブジェクトで使用可能な新しいORDAメソッドを使って、この遅延の原因を特定することができます。これらはデバッギング機能であるだけではなく、送信されたリクエストをよりよく理解してORDAコードを最適化することもできるようになりました。


#### ORDAでロギングをリクエストする

<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/dsstartRequestLog.305-4385066.ja.html"><span class="notranslate command">startRequestLog()</span></a>メンバー・メソッドはとてもフレキシブルです。ORDAリクエストログをファイルもしくはメモリに取ることができます。

#### ファイルにログを取る

ファイルにログを取るには、シンプルに<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/dsstartRequestLog.305-4385066.ja.html"><span class="notranslate command">startRequestLog()</span></a>を、ORDAリクエストがログインする場所を示す<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/File.301-4311959.ja.html"><span class="notranslate command">File</span></a>オブジェクトとともにコールするだけです。以下の例では、時々クエリーをインデックス化されていないフィールド上で走らせます。この新しい機能のおかげで、リクエストの継続時間をチェクできます：

<code class="fourd"><span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$first</span>;<span class="notranslate variable">$e</span>)<br>
<span class="notranslate command">C_COLLECTION</span>(<span class="notranslate variable">$log</span>)<br>
<br>
<span class="notranslate command">ds</span>.<span class="notranslate objectfunction">startRequestLog</span>(10) <span class="notranslate comment">// Only the last 10 requests will be kept in memory</span><br>
<span class="notranslate variable">$first</span>:=<span class="notranslate command">ds</span>.<span class="notranslate tablename">Persons</span>.<span class="notranslate objectfunction">all</span>().<span class="notranslate objectfunction">first</span>()<br>
<span class="notranslate variable">$e</span>:=<span class="notranslate command">ds</span>.<span class="notranslate tablename">Persons</span>.<span class="notranslate objectfunction">query</span>("name=:1";"Brown")<br>
<span class="notranslate variable">$log</span>:=<span class="notranslate command">ds</span>.<span class="notranslate objectfunction">getRequestLog</span>()<br>
<span class="notranslate command">ALERT</span>("The longest request lasted: "+<span class="notranslate command">String</span>(<span class="notranslate variable">$log</span>.<span class="notranslate objectfunction">max</span>("duration"))+" ms")<br>
<span class="notranslate command">ds</span>.<span class="notranslate objectfunction">stopRequestLog</span>()</code>

各リクエストはオブジェクトのJSON表現としてログを取られます。

以下はORDARequests.txtファイルの内容です：

<code class="fourd">[<br>
{<br>
...<br>
"startTime":"2019-07-02T12:33:25.922Z",<br>
"endTime":"2019-07-02T12:33:27.681Z",<br>
"<strong>duration</strong>":<strong>4200</strong>,<br>
"response":{ ...}<br>
...<br>
}<br>
]<br>
</code>

#### メモリーにログを取る

各リクエストはコレクションの中にオブジェクトとしてログを取られます。<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/dsgetRequestLog.305-4385266.ja.html"><span class="notranslate command">getRequestLog()</span></a> メンバー・メソッドを使って検索することができます。

コレクションを返すので、可能な<a href="https://blog.4d.com/a-wide-range-of-possibilities-to-manage-your-collections/">コレクション・メソッド</a>は全て使用できます。

<code  class="fourd"><span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$first</span>;<span class="notranslate variable">$e</span>)<br>
<span class="notranslate command">C_COLLECTION</span>(<span class="notranslate variable">$log</span>)<br>
<br>
<span class="notranslate command">ds</span>.<span class="notranslate objectfunction">startRequestLog</span>(10) <span class="notranslate comment">// Only the last 10 requests will be kept in memory</span><br>
<span class="notranslate variable">$first</span>:=<span class="notranslate command">ds</span>.<span class="notranslate tablename">Persons</span>.<span class="notranslate objectfunction">all</span>().<span class="notranslate objectfunction">first</span>()<br>
<span class="notranslate variable">$e</span>:=<span class="notranslate command">ds</span>.<span class="notranslate tablename">Persons</span>.<span class="notranslate objectfunction">query</span>("name=:1";"Brown")<br>
<span class="notranslate variable">$log</span>:=<span class="notranslate command">ds</span>.<span class="notranslate objectfunction">getRequestLog</span>()<br>
<span class="notranslate command">ALERT</span>("The longest request lasted: "+<span class="notranslate command">String</span>(<span class="notranslate variable">$log</span>.<span class="notranslate objectfunction">max</span>("duration"))+" ms")<br>
<span class="notranslate command">ds</span>.<span class="notranslate objectfunction">stopRequestLog</span>()</code>

#### ORDAリクエストのログを不可にする

上記のサンプルが示す通り、ORDAリクエストのログを止めるには、<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/dsstopRequestLog.305-4385232.en.html"><span class="notranslate command">stopRequestLog()</span></a> メンバー・メソッドをコールするだけです。
