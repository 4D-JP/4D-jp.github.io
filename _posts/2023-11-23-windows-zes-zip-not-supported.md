---
layout: fix
title: "Windowsの圧縮フォルダ機能はAES暗号化をサポートしていない"
date: 2023-11-23 08:00:00
categories: 仕様
tags: windows zip security
---

[ZIP Create archive](https://developer.4d.com/docs/ja/API/ZipArchiveClass/#zip-create-archive)でZipファイルをパスワード保護した場合，アーカイブはAES暗号化されます。Windowsの圧縮フォルダ機能は，歴史的な経緯により，[AES暗号化をサポートしていない](https://devblogs.microsoft.com/oldnewthing/20180515-00/?p=98755)ため，そのようなファイルをWindowsの標準機能で展開することはできません。これは（Windowsの）仕様です。AES暗号化されたZipファイルは，7-Zipなどをツールで展開することができます。