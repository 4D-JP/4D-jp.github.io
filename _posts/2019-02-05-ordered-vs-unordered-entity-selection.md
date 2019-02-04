---
layout: post
title: "エンティティセレクション"
date: 2019-02-05 00:46:00
categories: 仕様 
tags: 17.x orda
version: 17.x
---

ORDAの[エンティティセレクション](https://doc.4d.com/4Dv17/4D/17/Entity-selections.300-3767324.ja.html)には，ordered（序列あり）とunordered（序列なし）が存在します。前者は従来の命名セレクションに，後者は従来のセットに似ています。

デスクトップ版，あるいはサーバー側でORDAの``query()``を使用した場合，データストア``ds``はローカルなので，デフォルトでunordered（序列なし）のエンティティセレクションが返されます。ordered（序列あり）のエンティティセレクションが必要であれば，``newSelection( )``に``dk keep ordered``オプションを渡すことができます。 

クライアント側でORDAの``query()``を使用した場合，データストア``ds``はリモートなので，常にordered（序列あり）のエンティティセレクションが返されます。つまり，クライアント側でORDAを実行した場合，``entitySelection.isOrdered()``は常に``True``を返しますが，同じコードをデスクトップ版で実行した場合，``False``が返されるかもしれません。これは仕様です。
