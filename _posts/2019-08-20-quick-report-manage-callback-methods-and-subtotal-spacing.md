---
layout: post
title: "クイックレポート - コールバックメソッドと小計スペースの管理"
date: 2019-08-20 00:00:00
categories: ブログ
tags: 18.x 17r6
author: Intissar Elmezrouai
---

![QR-1024x512](/images/blog/08/20/QR-1024x512.jpeg)

クイックレポートは64ビットで完全に再作成され、継続的に新しい機能が統合されています。前回のRリリースの<a href="https://blog.4d.com/ui-improvements-in-quick-report/">UI（ユーザーインターフェイス）の改良</a>に加えて、4D v17 R6はスタンドアロンレポート中のイベントを捉える機能と、小計スペースを管理する機能を追加しました。

####QR REPORTコマンドのコールメソッド

<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/QR-REPORT.301-4311030.ja.html"><span class="notranslate command">QR REPORT</span></a> コマンドに"methodName"パラメータを設定できるようになりました。このメソッドは管理されたイベントごとに起動するコールバックです：

　- qr cmd open
　- qr cmd save
　- qr cmd save as
　- qr cmd generate
　- qr cmd page setup
　- qr cmd print preview
 
以下はコールのサンプルです：

<code class="fourd"><span class="notranslate command">QR REPORT</span>([My Table];<span class="notranslate command">Char</span>(1);"qrCallbackMethod")</code>

コールバックメソッドでは、管理されたイベントすべてを途中でやめて、やるべきことをやり、<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/QR-EXECUTE-COMMAND.301-4311020.ja.html"><span class="notranslate command">QR EXECUTE REPORT</span></a> コマンドでイベントを実行できます。

下記はコールバックメソッドのサンプルで、文書を生成する前にフッターに現在のタイムスタンプを設定し、プレビューイベントにフィルターをかけます：

<code class="fourd"><span class="notranslate command">C_LONGINT</span>(<span class="notranslate variable">$1</span>;<span class="notranslate variable">$2</span>)<br>
<span class="notranslate command">C_LONGINT</span>(<span class="notranslate variable">$zone</span>;<span class="notranslate variable">$event</span>)<br>


<span class="notranslate variable">$zone</span>:=<span class="notranslate variable">$1</span><br>
<span class="notranslate variable">$event</span>:=<span class="notranslate variable">$2</span><br>

<span class="notranslate keyword">Case of</span> <br />
  : (<span class="notranslate variable">$event</span>=qr cmd generate) <br />
<span class="notranslate command">QR SET HEADER AND FOOTE</span>R(<span class="notranslate variable">$zone</span>;2;"";Timestamp;"";100) <br />
<span class="notranslate command">QR EXECUTE COMMAND</span>(<span class="notranslate variable">$zone</span>;<span class="notranslate variable">$event</span>) <br />
  : (<span class="notranslate variable">$event</span>=qr cmd print preview) <br />
<span class="notranslate keyword">Else</span> <br />
<span class="notranslate command">QR EXECUTE COMMAND</span>(<span class="notranslate variable">$zone</span>;<span class="notranslate variable">$event</span>) <br />
<span class="notranslate keyword">End case</span></code>


####リマインダー

　- もし<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/QR-REPORT.301-4311030.ja.html"><span class="notranslate command">QR REPORT</span></a> コマンドにコールバックメソッドが設定されなければ、イベントは自動で管理されます。
　- もし<a href="https://doc.4d.com/4Dv17R6/4D/17-R6/QR-REPORT.301-4311030.ja.html"><span class="notranslate command">QR REPORT</span></a> コマンドにコールバックメソッドが設定されたら、イベントを実行する/しないはあなた次第です。これは本質的なイベントをスタンドアロンレポートとしてあなたが管理できることを意味します。
 
 ####小計スペース
 
 それぞれのブレイク（小計）に対して、ページブレークあるいは異なる行高を設定できるようになりました。異なる行高の場合、違いはポイント(pt)とパーセンテージ(%)で表示できます。
 
![QR1Menu-1024x564](/images/blog/08/20/QR1Menu-1024x512.png)
