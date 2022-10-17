---
layout: post
title: "高解像度ディスプレイの座標計算"
date: 2022-10-18 08:00:00
categories: 仕様
tags: 19.x windows dpi
---

[`SCREEN COORDINATES`](https://doc.4d.com/4Dv19R7/4D/19-R7/SCREEN-COORDINATES.301-5944911.ja.html)は，論理的な座標（ディスプレイのスケーリングを適用する前の値）を返します。高解像度ディスプレイの物理的なピクセル値（論理的な座標にした値）が返されるわけではありません。これは仕様です。下記のコマンドはいずれも論理的な座標を使用します。

* `OBJECT GET BEST SIZE` 
* `Menu bar height`
* `Screen height`
* `Screen width`
* `Tool bar height`
* `GET MOUSE`
* `POST CLICK`
* `POST EVENT`
* `CONVERT COORDINATES`
* `RESIZE FORM WINDOW`
* `GET WINDOW RECT`
* `SET WINDOW RECT`
* `OBJECT GET SUBFORM CONTAINER SIZE`
* `OBJECT GET SCROLL POSITION`
* `OBJECT SET SCROLL POSITION`
- `OBJECT GET COORDINATES`
- `OBJECT SET COORDINATES`
- `OBJECT MOVE`
- `FORM SET SIZE`
- `FORM GET PROPERTIES`
- `SVG Find element ID by coordinates`
- `SVG Find element IDs by rect`
- `SVG SHOW ELEMENT`
- `LISTBOX Get auto row height`
- `LISTBOX GET CELL COORDINATES`
- `LISTBOX GET CELL POSITION`
- `LISTBOX Get column width`
- `LISTBOX Get footers height`
- `LISTBOX Get headers height`
- `LISTBOX Get row height`
- `LISTBOX Get rows height`
- `LISTBOX SET AUTO ROW HEIGHT`
- `LISTBOX SET COLUMN WIDTH`
- `LISTBOX SET FOOTERS HEIGHT`
- `LISTBOX SET ROW HEIGHT`
- `LISTBOX SET ROWS HEIGHT`
