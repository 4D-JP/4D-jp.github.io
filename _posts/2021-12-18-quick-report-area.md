---
layout: post
title: "クイックレポートエリアの埋め込み"
date: 2021-12-17 00:00:00
categories: 仕様
tags: userinterface quickreport
version: 19
---

64ビット版のクリックレポートエリア（`%report (4D Report)`）は，従来のようなプラグインエリアではなく，標準的なウィジェット（サブフォーム）です。そのため，ウィジェットに共通の制限が適用されます。たとえば，コンテナオブジェクトが配置されたフォームのページを切り替えた場合，サブフォーム内のオブジェクトは*On Unload*イベントを処理することになります。クイックレポートエリアの場合，これは表示中のレポートが破棄されることを意味します。これは仕様です。ページを切り替えてもレポートが残るようにしたい場合，エリアをページ`0`に配置するか，オブジェクトの表示と非表示を切り替えることにより，疑似的なページ切り替えを表現する必要があります。

<i class="fa fa-external-link" aria-hidden="true"></i> [https://doc.4d.com/4Dv19/4D/19/Managing-quick-reports.300-5416648.ja.html](https://doc.4d.com/4Dv19/4D/19/Managing-quick-reports.300-5416648.ja.html)
