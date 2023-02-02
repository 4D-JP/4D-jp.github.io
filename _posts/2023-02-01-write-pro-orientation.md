---
layout: post
title: "向きと用紙サイズの関係"
date: 2023-02-01 09:00:00
categories: 仕様
tags: writepro printing
---

Write Proドキュメントの用紙向きを切り替えても，`wk page width`と`wk page height`が入れ替わるわけではありません。これは仕様です。幅と高さは飽くまで用紙の寸法に基づいており，レンダリングモードのPortrait/Landscapeといった向きの設定やページの回転とは無関係です。
