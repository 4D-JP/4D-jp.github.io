---
layout: post
title: "WP Create range 動作の変更"
date: 2019-04-26 12:48:00
categories: リリースノート
tags: 17r3
---

17r3では，``WP Create range``にドキュメントを渡した場合の振る舞いが調整され，仕様が明確になりました。

#### 17.xの振る舞い

本文をクリックしてからコマンドを実行した場合（``WP Get frame``が``wk body``を返す状態），``WP Create range``にドキュメントを渡したときに返されるレンジは，本文に対して相対的でした。

ヘッダーをクリックしてからコマンドを実行した場合（``WP Get frame``が``wk current section default header``を返す状態），``WP Create range``にドキュメントを渡したときに返されるレンジは，ヘッダーに対して相対的でした。

<i class="fa fa-external-link" aria-hidden="true"></i> [17.x](https://doc.4d.com/4Dv17/4D/17/WP-Create-range.301-3726316.ja.html)

#### 17r3以降の振る舞い

``WP Create range``にドキュメントを渡したときに返されるレンジは，フレームに関係なく，本文に対して相対的です。

<i class="fa fa-external-link" aria-hidden="true"></i> [17R4](https://doc.4d.com/4Dv17R4/4D/17-R4/WP-Create-range.301-4077766.ja.html)

**ポイント**: コマンドの振る舞いは，Write Proドキュメントがオフスクリーンであるかどうかに左右されず，一貫している必要があります。ヘッダーやフッターがフォーカスされている場合にレンジの基準が変動する以前の動作は，この原則に沿っていませんでした。

ヘッダーに対して相対的なレンジを取得することが目的であれば，ヘッダーをクリックしてカレントフレームを移動するのではなく，ヘッダーをコマンドに渡してください。

**注記**: 17r5でコマンドの名称は``WP Text range``に変更されています。

<i class="fa fa-external-link" aria-hidden="true"></i> [WP Text range](https://doc.4d.com/4Dv17R5/4D/17-R5/WP-Text-range.301-4115145.en.html)
