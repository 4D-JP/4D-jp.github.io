---
layout: fix
title: "長すぎるプリンター名"
date: 2025-07-09 08:00:00
categories: 仕様
tags: printing windows 
---

Microsoftの実装により，一部のWin32 APIは，プリンター名の`31`文字目以降を切り捨てるようです。従来のバージョンでは，この振る舞いを看過していましたが，Windows 24H2で発生するようになったMicrosoft Print to PDF印刷の不具合（ACI0105743）を調査する過程でエラー処置が強化されたことにより，特定のビルドではカレントプリンターの名称が`30`文字を超える場合に初回だけエラーが返されるようになりました（ACI0105792）。後者のエラーは，以前から潜在していた制限が修正の過程で浮かび上がったものであり，リグレッションではありません。