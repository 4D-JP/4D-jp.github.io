---
layout: post
title: "実数の計算"
date: 2022-09-23 08:00:00
categories: 仕様
tags: 19.x programming
---


実数の計算は，一般の算数とは違う計算であることに留意してください。たとえば，下記の計算は`-0.1`になりそうなものですが，実際にはそうではありません。これは仕様です。<i class="fa fa-external-link" aria-hidden="true"></i> [IEEE 754](https://ja.wikipedia.org/wiki/IEEE_754)

```4d
ALERT(String(64-64.1))
```

<img width="480" alt="" src="https://user-images.githubusercontent.com/10509075/192724985-6456768f-fb77-44be-af12-96a94938bf00.png">

