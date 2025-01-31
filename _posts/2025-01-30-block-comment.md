---
layout: fix
title: "ブロックコメントの制限"
date: 2025-01-30 08:00:00
categories: 仕様
tags: programming
---

メソッドエディターには，2種類の[コメント](https://developer.4d.com/docs/ja/Concepts/quick-tour#コメント)を記述することができます。

* 単一行のコメント (`//コメント`)
* インラインコメントおよび複数行コメント (`/*コメント*/`)

複数行コメントは，入れ子にすることもできます。

<img src="https://github.com/user-attachments/assets/d03aa5cb-de10-432a-94fe-afd09c51deed" />

`/*`から`*/`までが複数行コメントとみなされるため，途中に`*/`を記述すると，そこでコメントが終わります。

<img src="https://github.com/user-attachments/assets/c5614d82-125f-4dc8-ab1b-8a6d24028ae8" />

これは仕様です。単一行のコメントを併用するか，`*/`の中にスペースを挿入するなど，複数行コメントに`*/`を記述しないで済むようにしてください。なお，コメント内で特殊な意味を持つ以下の指示子は，いずれも単一行のコメントでのみ有効であり，インラインコメントおよび複数行コメントでは無視されます。


* `%R` [範囲チェック](https://developer.4d.com/docs/ja/Project/compiler#範囲チェック)
* `%T` [スレッドセーフ検証](https://developer.4d.com/docs/ja/Develop/preemptive-processes#部分的なスレッドセーフ検証の無効化)
* `%W` [警告](https://developer.4d.com/docs/ja/Project/compiler#ローカルに警告を無効化有効化する)
* `MARK`
* `TODO`
* `FIXEME`

<i class="fa fa-external-link" aria-hidden="true"></i> [スレッドセーフコマンドと非スレッドセーフコマンドの共存](https://blog.4d.com/ja/coexistence-of-thread-safe-and-non-thread-safe-commands/)  
<i class="fa fa-external-link" aria-hidden="true"></i> [開発者による開発者のための機能、コメントへのタグ付け](https://blog.4d.com/ja/tag-your-comments/)  
<i class="fa fa-external-link" aria-hidden="true"></i> [グローバル警告の生成をカスタマイズする](https://blog.4d.com/ja/customize-global-warnings-generation/)  
<i class="fa fa-external-link" aria-hidden="true"></i> [手動タグ](https://developer.4d.com/docs/ja/code-editor/write-class-method#手動タグ)