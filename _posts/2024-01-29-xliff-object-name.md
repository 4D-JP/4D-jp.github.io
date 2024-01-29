---
layout: fix
title: "XLIFFとオブジェクトのタイトル"
date: 2024-01-29 08:00:00
categories: 仕様
tags: xliff userinterface
---

オブジェクト名を使用したXLIFF（下記）は，タイトルが空白のオブジェクトには適用されません。ランタイムモードでスタティックテキストなどのオブジェクトにXLIFFリソースを表示させるためには，プロパティリストに空白以外のタイトルが設定されている必要があります。これは仕様です。

```xml
<group resname="[ProjectForm]">
	  <group resname="Form1">
		<trans-unit resname="some_text">
		  <target>some_text</target>
		</trans-unit>
	  </group>
</group>
```