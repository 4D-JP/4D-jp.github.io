---
layout: post
title: "相対パスが指定できるのはJSONフォームのみ"
date: 2019-02-26 11:55:00
categories: 仕様
tags: 17r4 jsonform
version: 17r4
---

16r6では，フォームエディターで作成したフォームだけでなく，オブジェクト型またはJSONファイルに記述されたフォーム（JSONフォーム）もコマンドで表示したり，印刷したりできるようになりました。

[Discover the power of dynamic forms](https://blog.4d.com/discover-the-power-of-dynamic-forms/)

JSONフォームを使用するには，``Open form window``や``DIALOG``のような既存のコマンドにフォーム名の代わりにオブジェクト型またはファイルパスを渡します。ファイルパスを渡す場合，``Resources``フォルダー内のファイルパスを特殊なシンタックスで指定します。``Resources``フォルダーの外部のあるファイルを絶対パスで参照することはできません。

```
DIALOG ("/RESOURCES/form.json")
```

[デザインリファレンス > フォームの作成 > 動的なフォーム](https://doc.4d.com/4Dv17/4D/17.1/Dynamic-Forms.300-4201272.ja.html)

JSONフォームから別のJSONフォームを参照することもできます。その場合，カレントドキュメントからの相対パスでファイルを指定します。具体的には「JSONポインター」で別のJSONファイルを参照する場合にこのシンタックスを使用します。

[ランゲージリファレンス > JSON > JSON Resolve pointers](https://doc.4d.com/4Dv17/4D/17.1/JSON-Resolve-pointers.301-4179124.ja.html#3516585)

17r3では，ドキュメントに明記されていない振る舞いとして，``/RESOURCES/``から始まるパス名が``Document to text``や``Test path name``など，一般のファイルアクセスコマンドでも認識されました。

この振る舞いは，内部的なメカニズムの副作用によるものであり，意図されたものではありませんでした。17r4以降，``/RESOURCES/``から始まるJSONフォームのシンタックスは，一般のファイルアクセスコマンドでは使用できないようになっています。
