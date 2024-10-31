---
layout: fix
title: "無効なファイルパス"
date: 2024-10-30 08:00:00
categories: 仕様
tags: programming 20r7
---

20r7では`File`のパス検証が改良されています。過去バージョンでは

```4d
$testFile:=File("dummy.jpg"; fk platform path)
```

のようなコードはエラーを返しませんでしたが，20r7ではエラーが返されるようになりました。無効なファイルパスは`Try`でハンドリングすることができます。

```4d
var $file:=Try(File("invalid path"))
If ($file#Null)

End if
```