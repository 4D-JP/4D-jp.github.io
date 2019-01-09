---
layout: post
title: "Windows Server 電源プラン"
date: 2019-01-09 23:44:23
categories: セットアップ 
tags: windows server
version: 16.x
---

デスクトップ版のWindows 10には，電力を節約するための設定（電源とスリープの設定/追加の電源設定）が用意されています。デフォルトの電源プランは，「バランス」となっています。サーバー版のWindows 2008-2016もそうです。結果的に4D Serverは最高でも30-50%ほどのパフォーマンスに抑えられます。5%程度まで低下することもあります。プランを「高パフォーマンス」に設定すると，CPUの能力を常に100%発揮することができ，バックアップに要する時間やシーケンシャルクエリの速度が明らかに向上します。

https://support.microsoft.com/ja-jp/help/2207548/slow-performance-on-windows-server-when-using-the-balanced-power-plan

https://docs.microsoft.com/ja-jp/windows-server/administration/performance-tuning/hardware/power/power-performance-tuning

データベースのように高いパフォーマンスが常に求められるサーバーのCPUが省電力設定に切り替わることは，あまり望ましいことはではありません。省電力設定が有効になると，CPUはクロック周波数が引き下げられ，ある程度の時間，ある程度のリクエストが続かない限り，ずっと低速モードで動作します。CPUだけでなく，USBポートやネットワークインタフェースも省エネルギーモードで動作するか，スリープ状態になることさえあります。端的に言って，「バランス」などの省電力モードの電源プランでデータベースを運用することにほとんどメリットはないように思えます。
