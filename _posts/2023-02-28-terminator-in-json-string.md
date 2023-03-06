---
layout: post
title: "ORDAと文字コード0"
date: 2023-02-28 09:00:00
categories: 仕様
tags: orda clientserver
---

4Dのテキスト型は，値と文字列長の属性を持っているため，通常はC言語で文字列の終わりを示す`\0`が値に含まれていてもトランケートされません。しかし，クライアント/サーバー版のORDAは，内部的にREST APIを使用しており，JSON形式でエンティティを表現しているため，`\0`以降のテキストが取得できません。これは仕様です。そのようなデータはテキスト型ではなく，BLOB型で管理し，必要に応じて`BASE64 ENCODE`でエンコードすることを検討してください。