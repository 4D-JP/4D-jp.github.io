---
layout: fix
title: "JOINクエリの書き方"
date: 2024-02-28 08:00:00
categories: 仕様
tags: programming database
---

`QUERY BY FORMULA`および`QUERY SELECTION BY FORMULA`の「JOIN」シンタックスでリレーションクエリを記述する場合，リレーションフィールドは直接的なトークン（`[Table_1]Field_2`）で入力する必要があります。ポインターの逆参照など，間接的な記述をした場合，フィールドの参照ではなく，フィールドの値がクエリ条件になってしまい，正しい結果が返されません。これは仕様です。