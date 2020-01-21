---
layout: post
title: PROJECT DATABASESシリーズ：フォーム・エディターを使った新しい可能性
date: 2020-01-16 01:00:00
categories: ブログ
tags: 18.x programming
author: Vanessa Talbot
---

![FormEditor](/images/blog/01-16/FormEditor.png)

<a href="https://blog.4d.com/tag/project-database/">プロジェクトモードデータベース</a>を導入してから、いくつかの4Dダイアログのインターフェイスも修正しました。このブログでは、フォームエディターに加えた変更をいくつか提示します。

#### フォーム・アーキテクチャー
まずは<a href="https://developer.4d.com/docs/en/Project/architecture.html#sources-folder">フォームがどのように組成されるのか</a>を思い出しましょう。

![FormArchitecure](/images/blog/01-16/FormArchitecture.png)

フォーム名をつけたフォルダを各フォームごとに作成します：

* プロジェクトフォームに対しては"/SOURCES/Forms"
* テーブルフォームに対しては "/SOURCES/TablesForms/<TableNumber>"

各フォームフォルダーは以下の項目で構成されています：

 フォーム・ディスクリプション
* フォーム・メソッド
* "オブジェクトメソッド" フォルダー
  * フォーム・オブジェクト・メソッド
* "イメージ" フォルダー
  * イメージファイル

#### プロパティー・リスト　TIPS
お気づきかもしれませんが、プロパティー・リスト中のプロパティーのいくつかは太字です。なぜでしょう？とてもシンプルですが：プレーンテキストのプロパティーは初期値を使い、太字のテキストはデザイナーによってオーバーライドされています。

このビデオ中では、私たちは太字のテキスト、値のリセットの方法、そしてこの情報がスタイルシートでいかに有効かについてデモを行っています。

<p style="text-align: center;"><iframe src="//www.youtube.com/embed/ocKlc8nS0s8" width="560" height="314" allowfullscreen="allowfullscreen"></iframe></p>

#### オブジェクトグループの改良
4Dはオブジェクトをグループ化でき、全体を簡単に選択、移動、修正することができます。このビデオでは、プロジェクトモード・データベース中のグループの改良点をお見せします。

例えば、グループの中の一つのオブジェクトを選択します：最初に、グループ中のオブジェクトをクリックしてグループを選択します。それから選択したい特定のオブジェクトをクリックします。

もしグループを選択したら、整列と分布アクションが可能になります。アクションはグループ内の全てのオブジェクトに適用されます。

<p style="text-align: center;"><iframe src="//www.youtube.com/embed/WQ2nQIdaMUY" width="560" height="314" allowfullscreen="allowfullscreen"></iframe></p>
