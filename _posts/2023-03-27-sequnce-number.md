---
layout: post
title: "Sequence numberはSQL/ORDAに非対応"
date: 2023-03-27 09:00:00
categories: 仕様
tags: programming sql orda
---

[`Sequence number`](https://doc.4d.com/4Dv19/4D/19.6/Sequence-number.301-6270293.ja.html)から返されるシーケンス番号は，[`SAVE RECORD`](https://doc.4d.com/4Dv19/4D/19.6/SAVE-RECORD.301-6270285.ja.html)で新規レコードを保存するたびにインクリメントされます。SQLの`INSERT`やORDAの`entity.save()`ではインクリメントされません。これは仕様です。
