---
layout: fix
title: "4D 19 修正リスト"
date: 2024-05-16 08:00:00
categories: 修正リスト
tags: "19.7"
build: 291571
version: "19.7"
permalink: /2024/111/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0104789 Windows版のみ。`SET PRINT OPTION`で設定した*Orientation option* の設定が`QR RUN`で出力したレポートの`2`ページ目以降に反映されませんでした。PDF/XPSに出力した場合は問題ありません。なお，印刷ジョブを開始する前に用紙の方向を設定すれば問題ありません。

**注記**: Direct2Dモードで印刷中に用紙の方向を変更した場合の処理が修正されました。

* ACI0104767 `WP Import document`でWrite Proドキュメントに特定の`.docx`ファイルをインポートした場合，アプリケーションがクラッシュしました。

* ACI0104290 ビット`4` (`16`) を指定せずに *Current process debug log* を有効化した場合，プラグインコマンドの呼び出しでアプリケーションがクラッシュしました。さきに全プロセスのデバッグログを有効化していれば問題ありません。