---
layout: post
title: "OUTER JOINは暗示的でなければならない"
date: 2019-07-06 12:00:00
categories: 仕様
tags: sql 
version: 17.x
---

4DのSQLは，暗黙的な``LEFT JOIN``をサポートしていません。これは仕様です。たとえば，下記のコードは``OUTER JOIN``を``WHERE``で暗黙的に示唆しているので，「実装されていない機能です」というエラーが返されます。

```sql
Begin SQL
	SELECT Employees.name, Employees.depID, Departments.depID, Departments.depName
	FROM Employees
	LEFT OUTER JOIN Departments
	ON Employees.DepID = Departments.DepID
	WHERE Employees.KeyID = Departments.KeyID
	INTO :Lbx2;
End SQL
```

初期のバージョン（v13）では，このようなSQLを実行してもエラーが返されませんでしたが，結果も正しくありませんでした。

<i class="fa fa-external-link" aria-hidden="true"></i> [結合のサポート](https://doc.4d.com/4Dv17R5/4D/17-R5/Support-of-joins.300-4142705.ja.html)
