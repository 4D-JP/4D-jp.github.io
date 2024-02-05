---
layout: fix
title: "ORDAのパフォーマンス"
date: 2024-02-04 08:00:00
categories: 仕様
tags: devcon24 programming language orda
---

# 4D Developer Conference 2024・質疑応答より

> 似たような処理をさせた場合，ORDAとクラシック言語でパフォーマンスに違いはないのでしょうか

単純なクエリであれば，速度・メモリ足跡ともに違いはほとんどありません。どちらの方法で記述しても，実際のクエリは同じデータベースエンジンが処理しているからです。

ORDAは単なるクエリ言語ではなく，クライアント/サーバー型アプリケーションの汎用ドライバーとして機能するように設計されたシステムです。ORDAの真価は，データベース検索後の処理，つまりリストボックスに値を表示したり，データを抽出/集計したりする段階で発揮されます。

クラシック言語では，1回のコマンドで複雑なリレーション検索を実行することが困難なため，検索を何度も実行してセット演算を多用する傾向があったかもしれません。ORDAを使用すれば，そのような処理をコンパクトにまとめることができ，パフォーマンスを大幅に向上できる見込みがあります。処理が複雑であればあるほど，ORDAが優勢になるということです。

<i class="fa fa-external-link" aria-hidden="true"></i> [ORDAを使用してクライアント/サーバーモードでパフォーマンスを向上させる](https://blog.4d.com/ja/use-orda-to-boost-performance-in-client-server-mode/)

<i class="fa fa-external-link" aria-hidden="true"></i> [RESTリクエストの管理によるパフォーマンスの最適化](https://blog.4d.com/ja/orda-optimize-performance-with-full-control-over-rest-requests/)

<i class="fa fa-external-link" aria-hidden="true"></i> [ORDA – プロセス間でエンティティセレクションを共有する](https://blog.4d.com/ja/orda-share-an-entity-selection-between-processes/)