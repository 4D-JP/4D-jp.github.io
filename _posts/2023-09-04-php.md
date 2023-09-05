---
layout: fix
title: "php.iniファイル"
date: 2023-09-04 08:00:00
categories: 仕様
tags: php programming
---

[`PHP Execute`](https://doc.4d.com/4Dv20/4D/20.1/PHP-Execute.301-6480818.ja.html)を実行すると，プロジェクトの`/RESOURCES/`フォルダーに既定の *php.ini* ファイルが（なければ）コピーされます。このファイルには，*4D_Execute_PHP.php* （4D/PHP間でパラメーターのデータ型を自動的に変換したり，PHPの関数を直接コールするためのユーティリティスクリプト）のパスが記述されています。このファイルは，ビルドした`php-cgi`を`php-fcgi-4d`にリネームし，内部PHPインタープリターの代わりに使用する場合にも使用されます。

[外部PHPインタープリターを使用する](https://doc.4d.com/4Dv19/4D/19.6/Executing-PHP-scripts-in-4D.300-6270547.ja.html)場合，`PHP Execute`に備えて事前にPHPを起動する必要があります。プロジェクトの`/RESOURCES/`フォルダーの *php.ini* ファイルは使用されません。コマンドライン引数で明示的に初期化ファイルのパスを渡す必要があります。これは仕様です。