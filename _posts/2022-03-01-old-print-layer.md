---
layout: post
title: "旧式プリントレイヤー"
date: 2023-03-01 15:00:00
categories: 仕様
tags: windows printing
version: 19r4
---

<i class="fa fa-external-link" aria-hidden="true"></i> [`SET PRINT OPTION`](https://doc.4d.com/4Dv19/4D/19.1/SET-PRINT-OPTION.301-5653182.ja.html)のドキュメントで説明されているように，Windows 64-bit版の印刷はDirect2Dベースの新しいプリントレイヤーが採用されていますが，セレクターの*Legacy printing layer option*を指定することにより，GDIベースの旧式プリントレイヤーに切り替えることもできます。

新しいプリントレイヤーは総合的な表現力が優れていますが，シンプルな帳票など，あえてシンプルな旧式プリントレイヤーのほうが望ましいようなケースがあるかもしれません。下記の例では，文字数に応じてテキストの配置が微妙に調整されるため，新しいプリントレイヤーでは数字の桁区切り位置が微妙にずれています。縦方向に位置を揃えたいのであれば，文字ごとにオブジェクトを配置するなど，フォームのデザインを見直す必要があるかもしれません。

* 旧式プリントレイヤー

<img width="453" alt="gdi" src="https://user-images.githubusercontent.com/10509075/156157705-784165bc-8b1c-4a9b-99f1-af97c2b2b48f.png">

* 新式プリントレイヤー

<img width="407" alt="msp" src="https://user-images.githubusercontent.com/10509075/156157753-cb3065cc-d36f-46f7-9110-35a8352464a3.png">
