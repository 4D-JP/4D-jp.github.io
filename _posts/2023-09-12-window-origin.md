---
layout: fix
title: "window.origin"
date: 2023-09-12 08:00:00
categories: 仕様
tags: programming 20.x webarea
---

近年のWebブラウザおよびレンダリングエンジンは，`window.origin`でページのオリジンを参照することができなくなっています。たとえば，v19の統合Webエリアでファイルを開いた場合，`window.origin`は`file://`を返しますが，v20の統合Webエリアでファイルを開いた場合，`window.origin`は`null`を返します。現行のAPIは[`window.location.origin`](https://developer.mozilla.org/ja/docs/Web/API/Location/origin)です。

<i class="fa fa-external-link" aria-hidden="true"></i> https://stackoverflow.com/questions/55451493/what-is-window-origin
