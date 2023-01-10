---
layout: post
title: "絵文字が白黒"
date: 2023-01-09 12:00:00
categories: 仕様
tags: listbox windows gdi userinterface binarymode
---

v15以前に作成されたバイナリモードのリストボックスは，テキストのレンダリングにGDIを使用するようになっています。v16以降に作成されたものはDirectWriteを使用します。これは内部的なプロパティ設定であり，ドキュメントされていないデータベースパラメーター`107`以外では読み書きすることができません。

[19r3](https://doc.4d.com/4Dv19R7/4D/19-R7/Changes-and-updates-in-4D-v19-R3.300-6020033.ja.html)以降，高解像度ディスプレイを想定したデータベース設定「[WindowsでのDirectWriteの使用](https://doc.4d.com/4Dv19R7/4D/19-R7/Changes-and-updates-in-4D-v19-R3.300-6020033.ja.html)」を有効化することができるようになりました。ただし，前述した「v15以前に作成されたバイナリモードのリストボックス」にはこの設定が適用されません。そのため，テキストが部分的にGDIでレンダリングされる，という状況が生じ得ます。たとえば，DirectWriteが有効なオブジェクトは絵文字がカラーで表示されるのに対し，GDIを使用しているリストボックスだけはモノクロで表示されるかもしれません。
