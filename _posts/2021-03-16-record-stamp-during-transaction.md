---
layout: post
title: "トランザクションのロックスタンプ"
date: 2021-03-14 12:00:00
categories: 仕様
tags: orda transaction
---

ORDAにおける楽観的[レコードロック](https://doc.4d.com/4Dv18/4D/18/Entity-locking.300-4575758.ja.html)は，内部的な**スタンプ**に支えられていますが，トランザクション中に作成されたエンティティのインスタンスは，すべて同一のレコードからコピーされるので，スタンプの比較による排他制御は意味をなしません。

トランザクション中でなければ，`dataClass.get()`のようなコマンドで同一レコードから複数のエンティティを作成した場合，一方を`entity.save()`した後に他方を`entity.save()`しようとすると「スタンプが変更されたので保存できない」というエラーが返されますが，トランザクション中であれば，同じことしてもエラーが返されずに両方のエンティティが保存できます。これは仕様です。

<i class="fa fa-external-link" aria-hidden="true"></i> [Stamp has changed and Transaction](https://discuss.4d.com/t/aci0101779-stamp-has-changed-and-transaction/18045/3)
