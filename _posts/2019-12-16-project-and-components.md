---
layout: post
title: PROJECT DATABASEシリーズ：プロジェクト・データベースとコンポーネント
date: 2019-12-11 02:00:00
categories: Product
tags: 18.x programming
author: Vanessa Talbot
---

![project-database-stylesheet](/images/blog/12-11/component.png)

4D v18より、プロジェクト・データベースを使った変換と開発の方法についてブログのシリーズを掲載してきました。コンポーネントについてはどうでしょう？このブログで疑問に答えていきます。

#### 開発と運用
とても簡単で、開発とコンポーネントのインストールは変わりません。以前と同じ技術を使い続けることができます。

忘れてはいけないのは、プロジェクト・データベースのアーキテクチャーのブログで説明したように、ストラクチャファイル (.4db)に相当するのは”Project”フォルダーであるということです。あなたのコンポーネントを、Projectフォルダーと同層にある”Component”フォルダーに追加するだけです。

![project-database-stylesheet](/images/blog/12-11/component_architecture-768x595.png)

#### プロジェクトとバイナリー・データベースを混在させる？
もしもバイナリー・データベースをプロジェクトに変換したら、コンポーネントの全てもプロジェクトに変換する必要はありません。バイナリー・データベース (.4db)のように、プロジェクト・データベースはプロジェクトとバイナリー・コンポーネントの両方をロードできます。

そのため、データベースとコンポーネントを、一つずつ簡単に変換できます。

#### What’s what?
二つの新しいデータベース・パラメータを自由に使用できます：

* もしホストデータベースがプロジェクトの場合</br>
<code class="fourd"><span class="notranslate variable">$isProject</span>:=<span class="notranslate command">Get database parameter</span>(<span class="notranslate constant">Is host database a project</span>)</code>

* もしカレントデータベースがプロジェクトの場合</br>
<code class=“four”><span class="notranslate variable">$isProject</span>:=<span class="notranslate command">Get database parameter</span>(<span class="notranslate constant">Is current database a project</span>)</code>

