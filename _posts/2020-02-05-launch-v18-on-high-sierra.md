---
layout: post
title: "macOS 10.13 High Sierraとv18"
date: 2020-02-05 00:46:00
categories: 注意点 
tags: 18.x mac
version: 18.x
---

Mac版のv18は，4D SASによってコード署名され，アプリ公証（ノータリゼーション）にも合格していますが，macOS 10.13 High Sierraでは，初回の起動時に「開発元が未確認のため開けません」というエラーが表示されます。これは，4D.app特有の現象であり，4D Serverでは発生しません。4D.appには，モバイルアプリのジェネレーター（4D for iOS）がプリインストールされていますが，このSDKのSwiftフレームワークは，High Sierraにインストールされているものよりもバージョンが新しいため，GateKeeperがアプリの検証に失敗してしまうようです。

4D for iOS v18のシステム要件は・・・

Xcode 11.2
Swift 5.1
iOS 13.2 
macOS 10.14.4

・・・となっています。

https://developer.4d.com/4d-for-ios/docs/en/prerequisites.html

4D v18 LTSのシステム要件は・・・

macOS High Sierra (10.13) – macOS Catalina (10.15)

・・・ですが，杖術した問題が発生するようであれば，MojaveまたはCatalinaを使用することが推奨されています。

https://jp.4d.com/product-download/4D-v18-LTS

開発プラットフォームをアップグレードすることが難しい場合，下記いずれかの方法で問題を回避することができます。

- [Swift](https://support.apple.com/kb/DL1998?locale=fr_FR)をインストールする【推奨】

- [Mac で App を安全に開く](https://support.apple.com/ja-jp/HT202491)
