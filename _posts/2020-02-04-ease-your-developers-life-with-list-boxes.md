---
layout: post
title: リストボックス でデベロッパーを楽にする
date: 2020-02-04 23:59:00
categories: ブログ
tags: 18.x programming
author: Marie-Sophie Landrieu-Yvert
---

![Multiple 4D datasource](/images/blog/02-04/HDIabout.jpeg)

私たちにとって、日を追うごとにデベロッパーを楽にすることは大事な目的です。そしてリストボックス は、この目的を叶えるための、4Dで最も使われている強力なフォームの一つです。ご存知のようにリストボックス は多くのイベントのトリガーです。4D v18 R2では<a href="https://doc.4d.com/4Dv18R2/4D/18-R2/FORM-Event.301-4802931.en.html"><span class="notranslate command">Form event</span></a>コマンドを拡張して、リストボックス がトリガーとなった場合により多くの情報が返されるようにしたのは、そのような理由です。

古いトリッキーなコードで、どの列、行、ヘッダーをクリックしたか、マウスを重ねていたかを知りたいのではないでしょうか。よりスムーズでスマートな方法をお見せしましょう。


{:.download}
[HDI: リストボックス ・イベントで簡単に動くサンプル](https://download.4d.com/Demos/4D_v18_R2/HDI_Listbox_Events.zip)

イベントによって、追加された関連のあるプロパティが<a href="https://doc.4d.com/4Dv18R2/4D/18-R2/FORM-Event.301-4802931.en.html"><span class="notranslate command">Form event</span></a>コマンドによって返されます。
いくつかサンプルをチェックしてみましょう。

#### ON HEADER CLICKイベント

ヘッダーオブジェクトの名称、カラムオブジェクトの名称、カラム番号は<a href="https://doc.4d.com/4Dv18R2/4D/18-R2/FORM-Event.301-4802931.en.html"><span class="notranslate command">Form event</span></a>コマンドによって返されます。以下のサンプルは、<Strong>On Header Click</ strong>イベントでトリガーされた時にオブジェクトを返す例です。

<pre>{"headerName":"headerLastname", <span class="notranslate comment">// <strong>New property</strong> - Header object name</span>
"columnName":"lastname", <span class="notranslate comment">// <strong>New property</strong> - Column object name</span>
"column":2,   <span class="notranslate comment">// <strong>New property</strong> - Column number</span>
"code":42,
"description":"On Header Click",
"objectName":"EmployeesLB"}</pre>

例えば、<strong>カラム・オブジェクト名</strong>をデータベースの実際の属性名（例：lastname）に設定した場合、

![Multiple 4D datasource](/images/blog/02-04/lastNameColumn_Config-1536x456.png)

Employeeのlastnameを表示するカラムのヘッダーをクリックした際に、lastname<strong>とfirstname</strong>属性のカラムをソートします：

<code class="fourd"> 
<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">event</span>:=<span class="notranslate command">FORM</span> <span class="notranslate command">Event</span><br />
<span class="notranslate keyword">Case of</span><br />
: (<span class="notranslate command">Form</span> <span class="notranslate command">event code</span>=<span class="notranslate constant">On Header Click</span>)<br />
<span class="notranslate keyword">if</span> (<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">event</span>.<span class="notranslate objectattribut">columnName</span>="lastname")<br />
<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">employees</span>:=<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">employees</span>.<span class="notranslate objectfunction">orderBy</span>(<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">event</span>.<span class="notranslate objectattribut">columnName</span>+", firstname")<br />
<span class="notranslate keyword">End if</span><br />
<span class="notranslate keyword">End case </span>
</code>


#### ON DISPLAY DETAILSイベント

<strong>On Display Details</strong>イベントがトリガーされる場合、追加される関連のあるプロパティ（例：isRowSelected）は<a href="https://doc.4d.com/4Dv18R2/4D/18-R2/FORM-Event.301-4802931.en.html"><span class="notranslate command">Form event</span></a>コマンドによって返されます。これはリストボックス の行の外観を管理するのに役に立ちます：

以下はリストボックス の<a href="https://doc.4d.com/4Dv18R2/4D/18-R2/List-box-specific-properties.300-4824135.en.html"><em>Meta info expression</em></a>プロパティのメソッド(setColor)のサンプルです：

![Multiple 4D datasource](/images/blog/02-04/metaInfoExpression.png)

setColorメソッド：

<code class="fourd"> 
<span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$event</span>;<span class="notranslate variable">$0</span>;<span class="notranslate variable">$meta</span>)<br />
<span class="notranslate variable">$event</span>:=<span class="notranslate command">FORM Event</span><br />
<span class="notranslate variable">$meta</span>:=<span class="notranslate command">New object</span><br />
<span class="notranslate keyword">Case of</span> <br />
: (<span class="notranslate variable">$event</span>.<span class="notranslate objectattribut">code</span>=<span class="notranslate constant">On Display Detail</span>)<br />
<span class="notranslate keyword">If</span> (<span class="notranslate variable">$event</span>.<span class="notranslate objectattribut">isRowSelected</span>) <span class="notranslate comment">//set color when row is selected</span><br />
<span class="notranslate variable">$meta</span>.<span class="notranslate objectattribut">fill</span>:="lightblue"<br />
<span class="notranslate keyword">End if</span><br />
<span class="notranslate keyword">End case</span> <br />
<span class="notranslate variable">$0</span>:=<span class="notranslate variable">$meta</span>
</code>


そして行を選択した際のリストボックス の状態です：

![Multiple 4D datasource](/images/blog/02-04/BlogPost_Listbox-1-768x440.png)

#### ON MOUSE MOVEイベント

他によく使われるイベントは<strong>On Mouse Move</strong>イベントです。下記は<a href="https://doc.4d.com/4Dv18R2/4D/18-R2/FORM-Event.301-4802931.en.html"><span class="notranslate command">Form event</span></a>コマンドによってトリガーされた時に返されるオブジェクトの例です。

マウスを置いた場所の役に立つ情報をすぐに入手できます！

##### マウスをヘッダーの上で停止する
<a href="https://doc.4d.com/4Dv18R2/4D/18-R2/FORM-Event.301-4802931.en.html"><span class="notranslate command">Form event</span></a>コマンドが返すのは：

<code class="fourd">{"area":"header", <span class="notranslate comment">// The mouse is on a header</span><br />
"areaName":"headerLastname", <span class="notranslate comment">// Header object name</span><br />
"column":2, <span class="notranslate comment">//  Column number</span><br />
"columnName":"lastname", <span class="notranslate comment">// Colmun object name</span><br />
"code":37,<br />
"description":"On Mouse Move",<br />
"objectName":"EmployeesLB"}<br />
</code>

##### マウスをセルの上で停止する
<a href="https://doc.4d.com/4Dv18R2/4D/18-R2/FORM-Event.301-4802931.en.html"><span class="notranslate command">Form event</span></a>コマンドが返すのは：

<code class="fourd">{"area":"cell", <span class="notranslate comment">// The mouse is on a cell</span><br />
"column":1, <span class="notranslate comment">//  Column number</span><br />
"row":2, <span class="notranslate comment">//  Row number</span><br />
"columnName":"firstname", <span class="notranslate comment">// Colmun object name</span><br />
"code":37,<br />
"description":"On Mouse Move",<br />
"objectName":"EmployeesLB"}</code>

とても多くのリストボックス イベントがあるので、一つのブログでは全てをカバーすることはできません。<a href="https://developer.4d.com/docs/en/FormObjects/listboxOverview.html#supported-form-events">ドキュメント</a>をチェックして、<a href="https://developer.4d.com/docs/en/FormObjects/listboxOverview.html#supported-form-events">各イベントについてより詳細な情報</a>を参照し、HDIサンプルをダウンロードして多くを学んでください！
