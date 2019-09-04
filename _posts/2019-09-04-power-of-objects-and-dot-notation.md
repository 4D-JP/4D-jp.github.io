---
layout: post
title: オブジェクトとドット記法の力
date: 2019-09-04 00:00:00
categories: ブログ
tags: 18.x 17r6
author: Vanessa Talbot
---

![FileManager-1](/images/blog/9-4/FileManager-1.png)

4D v17 R5では、オブジェクトを操作してファイルあるいはフォルダの属性を検索するのがいかに簡単かをご紹介しました。この機能はオブジェクト記法のおかげで<a href="https://blog.4d.com/object-notation-to-handle-files-and-folders/">さらに簡単に</a>なっています！このブログ投稿では、ファイルとフォルダを関するインターフェイスを使った例題を公開しています。これは、4Dでは新しいことではなく、これまでの4Dコマンドでも可能でした。しかし、このバージョンからより簡単にわずかんコードでできるようになりました。

このTipでは、オブジェクトを操作してファイルやフォルダの属性を検索するのがいかに簡単かをご覧いただきます。さらに良いことに、新しい機能を組み合わせることでより強力になることもお見せしています。<span class="notranslate command">File</span> と<span class="notranslate command">folder</span> コマンド、オブジェクト記法や新しいリストボックス 機能などです。例えば、リストボックス に表示するファイルやフォルダのコレクションを検索するには：

<code class="fourd"><span class="notranslate command">Form</span>.<span class="notranslate objectattribut">docs</span>:=<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">curfolder</span>.<span class="notranslate objectfunction">folders</span>().<span class="notranslate objectfunction">concat</span>(<span class="notranslate command">Form</span>.<span class="notranslate objectattribut">curfolder</span>.<span class="notranslate objectfunction">files</span>())</code>

{:.download}
[ファイル・フォルダーオブジェクトを利用したエクスプローラー](https://github.com/4D-JP/HDI/releases/download/4D_v17R6/HDI_FileManager.zip) 

![FileManager-1024x721](/images/blog/9-4/FileManager-1024x721.png)

あなた自身がサンプルを試してみてください。ディスクファイル・ブラウザーのように動くことが分かるでしょう。あなたならこの機能のためにリストボックス の裏でどのようにコードを書くのか、ちょっと考えてみてください。最後に、デザインモードに移ってコードを見てみると、いかに短いコードが使われているかに驚くことでしょう。オブジェクト記法を使わずに同じことをしてみると、オブジェクトには10倍以上のコーディングが必要です。まだ、オブジェクト記法を試していないのなら、今こそその時です！

