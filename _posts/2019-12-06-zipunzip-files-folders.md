--
layout: post
title: コマンドでファイルとフォルダの圧縮と解凍
date: 2019-12-03 02:00:00
categories: Product
tags: 18.x programming
author: Vanessa Talbot
--

![project-database-stylesheet](/images/blog/12-03/Compression.png)

（例えばEメールで）ファイルを交換する前に、転送するサイズを小さくしたくて圧縮することがよくあります。4D v18を使えば、外部ライブラリーやツールを使わずにプログラムでファイルの圧縮解凍が可能です：

{:.download}
[ZIP圧縮と解凍](https://github.com/4D-JP/HDI/releases/download/18/HDI_CompressFile.zip)

#### ファイルとフォルダの圧縮
新しい<span class="notranslate command">Zip Create archives</span>コマンドは、ファイル、フォルダ、あるいはパラメータを使ったオブジェクト（例：アーカイブを読むためのパスワード）などを受け渡す場合にzipアーカイブを作成できます。

ファイルを圧縮：

<code class="fourd"><span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$file</span>;<span class="notranslate variable">$destination</span>)<br />
<span class="notranslate variable">$destination</span>:=<span class="notranslate command">Folder</span>(<span class="notranslate constant">fk desktop folder</span>).<span class="notranslate objectfunction">file</span>("MyDocs/file.zip")<br />
<span class="notranslate variable">$file</span>:=<span class="notranslate command">Folder</span>(<span class="notranslate constant">fk desktop folder</span>).<span class="notranslate objectfunction">file</span>("MyDocs/text.txt")<br />
<span class="notranslate command">ZIP Create archive</span>(<span class="notranslate variable">$file</span>;<span class="notranslate variable">$destination</span>)</code>

フォルダを圧縮：
<code class="fourd"><span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$folder</span>;<span class="notranslate variable">$destination</span>)<br />
<span class="notranslate variable">$destination</span>:=<span class="notranslate command">Folder</span>(<span class="notranslate constant">fk desktop folder</span>).<span class="notranslate objectfunction">file</span>("MyDocs/Images.zip")<br />
<span class="notranslate variable">$folder</span>:=<span class="notranslate command">Folder</span>(<span class="notranslate constant">fk desktop folder</span>).<span class="notranslate objectfunction">folder</span>("MyDocs/Images")<br />
<span class="notranslate command">ZIP Create archive</span>(<span class="notranslate variable">$folder</span>;<span class="notranslate variable">$destination</span>)</code>

パスワードとプログレスバーを圧縮：

<code class="fourd"><span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$zip</span>)<br />
<span class="notranslate variable">$destination</span>:=<span class="notranslate command">Folder</span>(<span class="notranslate constant">fk desktop folder</span>).<span class="notranslate objectfunction">file</span>("MyDocs/Archive.zip")<br />
<span class="notranslate variable">$zip</span>:=<span class="notranslate command">New object</span><br />
<span class="notranslate variable">$zip</span>.<span class="notranslate objectattribut">files</span>:=<span class="notranslate command">Folder</span>(<span class="notranslate constant">fk desktop folder</span>).<span class="notranslate objectfunction">folder</span>("MyDocs/Resources").<span class="notranslate objectfunction">folders</span>()<br />
<span class="notranslate variable">$zip</span>.<span class="notranslate objectattribut">password</span>:="password"<br />
<span class="notranslate variable">$zip</span>.<span class="notranslate objectattribut">callback</span>:=<span class="notranslate command">Formula</span>(<span class="notranslate method">FormulaCompressing</span> (<span class="notranslate variable">$1</span>))<br />
<br />
<span class="notranslate variable">progID</span>:=<span class="notranslate method">Progress New</span> <br />
<span class="notranslate command">ZIP Create archive</span>(<span class="notranslate variable">$zip</span>;<span class="notranslate variable">$destination</span>)<br />
<span class="notranslate method">Progress QUIT</span> (<span class="notranslate variable">progID</span>)</code>

<span class="notranslate method">FormulaCompressing</span> メソッド：

<code class="fourd"><code><span class="notranslate method">Progress SET PROGRESS</span> (<span class="notranslate variable">progID</span>;<span class="notranslate command">Num</span>(<span class="notranslate variable">$1</span>/100))</code>

#### ファイルとフォルダの解凍

新しい<a href="https://doc.4d.com/4Dv18/4D/18/ZIP-Read-archive.301-4672153.ja.html"><span class="notranslate command">ZIP Read archive</span></a>コマンドはアーカイブオブジェクトを返します。このオブジェクトを操作することによって、アーカイブの中のファイルのリストを簡単に入手、特定のファイルを解凍、全アーカイブを解凍などができます。

アーカイブのコンテンツを読む
<code class="fourd"><span class="notranslate command">C_OBJECT</span>(<span class="notranslate variable">$archive</span>;<span class="notranslate variable">$path</span>)<br />
<span class="notranslate variable">$path</span>:=<span class="notranslate command">Folder</span>(<span class="notranslate constant">fk desktop folder</span>).<span class="notranslate objectfunction">file</span>("MyDocs/Archive.zip")<br />
<span class="notranslate variable">$archive</span>:=<span class="notranslate command">ZIP Read archive</span>(<span class="notranslate variable">$path</span>)</code>

ファイルとフォルダのリストを検索する

<code class="fourd"><span class="notranslate variable">$folders</span>:=<span class="notranslate variable">$archive</span>.<span class="notranslate objectattribut">root</span>.<span class="notranslate objectfunction">folders</span>()<br />
<span class="notranslate variable">$files</span>:=<span class="notranslate variable">$archive</span>.<span class="notranslate objectattribut">root</span>.<span class="notranslate objectfunction">files</span>()</code>

解凍せずにファイルのコンテンツを読む

<code class="fourd"><span class="notranslate keyword">If</span> (<span class="notranslate variable">$files</span>[$i].<span class="notranslate objectattribut">extension</span>=".txt")<br />
   <span class="notranslate variable">$txt</span>:=<span class="notranslate variable">$files</span>[$i].<span class="notranslate objectfunction">getText</span>()<br />
<span class="notranslate keyword">Else</span> <br />
   <span class="notranslate variable">$blob</span>:=<span class="notranslate variable">$files</span>[$i].<span class="notranslate objectfunction">getContent</span>()<br />
<span class="notranslate keyword">End if</span></code>

アーカイブからファイルを解凍する

<code class="fourd"><span class="notranslate variable">$folderResult</span>:=<span class="notranslate variable">$files</span>[$i].<span class="notranslate objectfunction">copyTo</span>(<span class="notranslate command">Folder</span>(<span class="notranslate constant">fk desktop folder</span>).<span class="notranslate objectfunction">folder</span>("MyDocs"))</code>

全てのファイルを解凍する

<code class="fourd"><span class="notranslate variable">$folderResult</span>:=<span class="notranslate variable">$files</span>[$i].<span class="notranslate objectfunction">copyTo</span>(<span class="notranslate command">Folder</span>(<span class="notranslate constant">fk desktop folder</span>).<span class="notranslate objectfunction">folder</span>("MyDocs"))</code>


