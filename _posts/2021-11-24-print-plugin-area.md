---
layout: post
title: "AreaList Proエリアの印刷"
date: 2021-11-24 11:31:00
categories: 仕様
tags: printing windows
version: 19
---

[AreaList Pro](https://www.e-node.net/en/P1/AreaList-Pro.html)など，Windows版のプラグインエリアを印刷するためには，旧式プリントレイヤーを有効にする必要があります。

```
SET PRINT OPTION(Legacy printing layer option;1) 
```

<i class="fa fa-external-link" aria-hidden="true"></i> [SET PRINT OPTION](https://doc.4d.com/4Dv19/4D/19/SET-PRINT-OPTION.301-5392129.ja.html) 
