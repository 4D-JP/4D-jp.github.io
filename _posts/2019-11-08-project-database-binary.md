---
layout: post
title: "PROJECT DATABASESシリーズ：バイナリからテキストベースへ"
date: 2019-11-8 01:00:00
categories: ブログ
tags: 18.x programming
author: Vanessa Talbot
---

![project-database-binary-textbase](/images/blog/11-06/from-binary.png)

4D v17 R5で新しいタイプの4Dデータベース：<a href="https://blog.4d.com/4d-projects-embrace-the-new-era-of-collaboration/">プロジェクト・データベース</a>のベータテストを開始しました。4D v18では、プロジェクト・データベースが最終リリースになったことをお知らせします。今こそ軽い分散型フォーマットの多用途性と組み合わされた<a href="https://blog.4d.com/project-databases-more-than-a-collaboration-solution/">4Dの開発プラットフォームのパワー</a>を活かす時です！

プロジェクト・データベースは、伝統的なバイナリー・フォーマットではなく、テキストベースのファイルを使って4D中で開発されます。プロジェクト・データベースを作成するには：
* <a href="https://developer.4d.com/docs/en/Project/creating.html">新規の、空白のプロジェクト・データベースを作成する</a>、あるいは
* <a href="https://doc.4d.com/4Dv18/4D/18/Converting-databases-to-projects.300-4606146.en.html">既存のバイナリー・ストラクチャー・ファイル(.4db)をプロジェクトに出力する</a>

#### 既存のデータベースを変換
バイナリー・データベースをプロジェクトに変換するには、シンプルに”ファイル”→”書き出し”→”ストラクチャからプロジェクト”メニュー項目をクリックするだけです。

![project-database-binary-textbase](/images/blog/11-06/from-binary1.png)

一度バイナリー・データベースの変換が完了すれば、その成功を知らせるメッセージが表示されます。4Dはまた、手を加える必要があるエラーが見つかった場合もお知らせします（例：すでにサポートされていない古いフォーム・オブジェクトがある）。

![project-database-binary-textbase](/images/blog/11-06/from-binary2.png)

さらに詳しくは<a href="https://developer.4d.com/docs/en/Project/exporting.html">このドキュメント</a>を見てください。

#### 具体的なサンプル

以下のビデオでは、<a href="https://us.4d.com/resources/4d-v16">4D ウェブサイト</a>からダウンロードできる”Contacts”データベースを変換しました。

“ファイル→書き出し→ストラクチャからプロジェクト”メニュー項目の使って、バイナリーストラクチャ・ファイル(.4DB)をprojectに変換します。4Dは交換の間にエラーが発生したことを知らせてくれます。ログファイルを開いたとき、データベースがハイライト・ボタンを使うことに気づきます。上記のように、プロジェクト・データベースでは、古いオブジェクトの中にはサポートしていないものもあります。

この場合、シンプルにボタン・タイプを<em>ハイライト</em>から<em>非表示</em>に変更します。データベース中では、”ボタン”にイメージ、固定テキスト、ハイライト・ボタンを含む場合、これらの３つのオブジェクトを一つのオブジェクト：3Dボタンに置き換えることをアドバイスします。もしコンテキストに従ってランタイム時にボタンを表示あるいは非表示にする場合、コードの変更が必要です。

いくつかの修正後に、”Contacts”データベースは再度書き出されて、今回は成功しています。

<p style="text-align: center;"><iframe src="//www.youtube.com/embed/LlZrpdjqCcU" width="560" height="314" allowfullscreen="allowfullscreen"></iframe></p>


今度はあなたが実行する番です！
