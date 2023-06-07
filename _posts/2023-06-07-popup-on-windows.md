---
layout: fix
title: "ポップアップメニューの項目選択とescape"
date: 2023-06-06 08:00:00
categories: 仕様
tags: windows userinterface
---

上下矢印キーでポップアップ/ドロップダウンメニューの項目をハイライト選択した後，*escape* キーで操作をキャンセルした場合，Windowsでは *On Data Change* イベントが発生します。macOSでは発生しません。これは仕様です。Win32 APIでは，上下矢印キーでメニューの項目をハイライト選択したタイミングで入力イベントが発生します。*escape* キーはメニューを閉じますが，それまでの操作が取り消されるわけではありません。