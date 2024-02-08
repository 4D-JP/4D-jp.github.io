---
layout: fix
title: "USE ENTITY SELECTION"
date: 2024-02-08 08:00:00
categories: 仕様
tags: orda programming
---

[`USE ENTITY SELECTION`](https://developer.4d.com/docs/ja/API/EntitySelectionClass/#use-entity-selection)は，ORDAのエンティティセレクションをクラシック言語のカレントセレクションに変換するコマンドです。

コマンドは，クラシック言語の代わりにORDAでカレントセレクションを作成するためのものです。パフォーマンス最適化のため，可能なときには，元のエンティティセレクションをクローンせずにそのままカレントセレクションのバックエンドとして利用します。その場合，元のエンティティセレクションとカレントセレクションは同じデータセットを指します。実際の振る舞いは種々の条件に左右されるため，`USE ENTITY SELECTION`の実行後に元のカレントセレクションを使用することは避けてください。