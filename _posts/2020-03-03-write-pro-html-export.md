---
layout: post
title: "4D Write ProのHTMLエクスポート"
date: 2020-03-03 08:00:00
categories: 仕様
tags: 17.x writepro
---

4D Write Proドキュメントを``wk web html``形式でエクスポートした場合，セクション・ヘッダー・フッターなどは失われることになります。これは仕様です。

4D Write ProのHTMLフォーマットは，XHTMLフォーマットを拡張することで，セクション・ヘッダー・フッターなどを表現しています。HTML 5には，``section`` ``header`` ``footer``といったタグが存在しますが，4D Write ProのHTMLフォーマットは，HTML 4をベースにしているため，こうしたタグには対応していないことが関係しています。
