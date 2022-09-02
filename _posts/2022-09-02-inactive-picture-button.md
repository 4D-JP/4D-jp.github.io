---
layout: post
title: "非アクティブ状態のピクチャボタン"
date: 2022-09-01 12:00:00
categories: 仕様 
tags: userinterface projectmode
version: 19.x
---

Windows版の[ピクチャボタン](https://developer.4d.com/docs/ja/FormObjects/pictureButtonOverview.html)/ピクチャポップアップメニューは，ウィンドウが背面に移動しても非アクティブ状態になることはありません。これはプラットフォームの標準的な動作であり，仕様です。Mac版は，`4`ステート画像が設定されていれば，`4`番目のステート画像（[loopBackToFirstFrame](https://developer.4d.com/docs/ja/FormObjects/propertiesAnimation.html)）に切り替わることでグレーアウトされます。
