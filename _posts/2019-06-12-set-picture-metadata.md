---
layout: post
title: "TIFF画像のタグ情報を更新する場合の注意点"
date: 2019-06-12 10:25:00
categories: 仕様
tags: windows picture
---

<i class="fa fa-external-link" aria-hidden="true"></i> 
[``SET PICTURE METADATA``](https://doc.4d.com/4Dv17/4D/17.1/SET-PICTURE-METADATA.301-4179083.ja.html)コマンドを使用すれば，JPEGまたはTIFF形式のピクチャにタグ情報を書き込むことができます。

Windows版でTIFF画像のタグ情報をひとつずつ更新した場合，毎回の書き込みで画像の展開と再圧縮が実行されるため，画像のサイズにより，処理にかなりの時間を要します。これはWIC（Windows Imaging Component）の制限であり，仕様です。圧縮の回数を抑えるため，タグ情報は１回のコールで更新することが勧められています。
