---
layout: fix
title: "システム要件とCPUコア数"
date: 2023-05-23 08:00:00
categories: 仕様
tags: threadsafe server
---

公式サイトの[ダウンロードページ](https://jp.4d.com/product-download/Feature-Release)には，簡潔な**最小動作環境**および**[ソフトウェアとハードウェアの必要環境の詳細](https://download.4d.com/Documents/Products_Documentation/LastVersions/Line_19R8/VIntl/4D_v19_R8_SystemRequirements_EN.pdf)**のURLが掲載されています。ハードウェアについては，クライアントは`2`コア以上，サーバーは`4`コア以上のCPUを搭載しているコンピューターが推奨されています。

> Client computers must have a minimum of a 2 core CPU, while servers should have 4 or more cores.

推奨されているCPUコア数やメモリの容量はひとつ目安です。実際には同時接続ユーザー数・アプリケーション設計・データファイルのサイズといった要素を考慮に含める必要があります。

クライアントのコア数として`2`が推奨されている背景には，アンチウイルスなどのセキュリティソフトの存在が関係しています。多くの企業では，損害保険上の必要事項としてセキュリティソフトをインストールすることが要求されていますが，大抵の場合，バックグラウンドで動作するそのようなソフトはCPUコア`1`個をほぼ占有するので，4Dを快適に使用するためには少なくとも`2`個のCPUコアが望ましいと考えられています。

アプリケーションの設定やプロセス処理の方法にもよりますが，4D Serverは，ORDA・DB4D・HTTP・SOAP・SQLなどリクエストをプリエンプティブモードで並行処理することができるので，`4`コア以上が推奨されています。
