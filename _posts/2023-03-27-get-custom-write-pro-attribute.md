---
layout: post
title: "DOCXインポートログはオブジェクト記法で"
date: 2023-03-27 09:00:00
categories: 仕様
tags: programming writepro import
---

Write Proドキュメントには，既定の[属性](https://doc.4d.com/4Dv19R7/4D/19-R7/4D-Write-Pro-Attributes.300-6011946.ja.html)に加え，任意の[カスタム属性](https://doc.4d.com/4Dv19R7/4D/19-R7/Storing-4D-Write-Pro-documents-in-4D-Object-fields.200-6011877.ja.html)を設定することができます。[WP Import document](https://doc.4d.com/4Dv19R7/4D/19-R7/WP-Import-document.301-6011934.ja.html)で*.docx* ファイルを[インポート](https://doc.4d.com/4Dv19R7/4D/19-R7/Importing-and-Exporting-in-docx-format.200-6011884.ja.html)した場合，`wk import log`属性に変換ログが記録されますが，これは任意のカスタム属性に分類されるため，[`WP GET ATTRIBUTES`](https://doc.4d.com/4Dv19R7/4D/19-R7/WP-GET-ATTRIBUTES.301-6011937.ja.html)で参照することはできません。これは仕様です。

カスタム属性は[`OB Get`](https://doc.4d.com/4Dv19R7/4D/19-R7/OB-Get.301-5944957.ja.html)または[オブジェクト記法](https://doc.4d.com/4Dv19R7/4D/19-R7/Using-object-notation.300-5944969.ja.html)で一般的なオブジェクトと同じようにアクセスすることができます。
