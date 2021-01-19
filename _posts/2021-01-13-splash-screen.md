---
layout: post
title: "スプラッシュスクリーンを非表示にできない"
date: 2021-01-13 12:00:00
categories: 仕様
tags: userinterface
---

v14でACI0084254が修正されたことにより，環境設定の「[アプリケーションモードに移動する時にデザインモードを終了する](https://doc.4d.com/4Dv18/4D/18/General-Page.300-4575692.ja.html)」が有効にされていない場合，カスタムモードでは常にスプラッシュスクリーンが表示されるようになりました。その場合，データベース設定の「インターフェース」ページで「スプラッシュスクリーン」をオフにしても，スプラッシュスクリーンが強制的に表示されます。これは仕様です。

カスタムモードでメニューバーを表示するためには，メインプロセスが最前面でなければならず，プロセスが最前面であるためには，ウィンドウを表示していなければなりません。ACI0084254の修正前，環境設定の「アプリケーションモードに移動する時にデザインモードを終了する」が有効にされておらず，データベース設定の「スプラッシュスクリーン」もオフに設定されている場合，カスタムモードからデザインモードに切り替えた後，カスタムモードに復帰することができませんでした。修正により，環境設定の「アプリケーションモードに移動する時にデザインモードを終了する」が有効にされていない場合，強制的にスプラッシュスクリーンが表示されるようになりました。