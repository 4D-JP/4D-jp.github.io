---
layout: post
title: "対話型サービスの検出"
date: 2020-04-03 12:00:00
categories: 仕様
tags: windows server compatibility 
version: 1 8.x
---

v18（厳密には17r6）以降，4D ServerアプリケーションをWindowsのサービスとして登録した場合，「デスクトップとの対話」が使用できないようになりました。これは仕様です。4D Serverを管理者権限で起動し，「ファイル＞現在のデータベースをサービスとして登録する」を選択します。過去のバージョンでは，その後，Windowsの「サービス＞対話型サービスの検出」を開始すれば，4D Serverの「デスクトップとの対話」を有効にすることができました。

v18以降，サービスとして登録されたアプリケーションは，ヘッドレスモードで実行されます。このモードでは，一切のユーザーインタフェースが抑制され，アプリケーションからの出力はシステムイベントログや標準ストリーム（コマンドライン・インタフェース）に送られます。「デスクトップとの対話」は非サポートとなります。

https://doc.4d.com/4Dv18/4D/18/Registering-a-Database-as-a-Service.300-4672427.ja.html  
https://blog.4d.com/headless-4d-applications/
