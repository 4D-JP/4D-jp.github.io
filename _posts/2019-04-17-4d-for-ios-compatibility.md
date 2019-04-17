---
layout: post
title: "4D for iOSのためにmacOSとiOSのアップデートを控える"
date: 2019-04-17 10:10:00
categories: 注意点
tags: 17r4 4dforios mac
---

4D for iOSは，標準的なXcodeプロジェクトを出力し，ネイティブiOSアプリをビルドするツールです。17r4に組み込まれている4D for iOSは，ABI安定化前のSwiftを使用しているため，XcodeおよびiOSのバージョンが17r4開発当時のもの（Xcode 10.1）でなければアプリをビルドしたり，デバイスで動かしたりすることができません。これは仕様です。

#### バージョン対応表

| Xcode | Swift  | iOS  | 4D |
| ------------- | ------------- | ------------- | ------------- |
| 10.2 | 5 | 12 | 17r5 |
| 10.1 | 4.2.1 | 12 | 17r4 |
| 10.0 | 4.2 | 12 | 17r3 |
| 9.4.1 | 4.1.2 | 11.4 | 17r2 |

17r4の4D for iOSを使用するのであれば，Xcode 10.1の環境を用意し，アップデートは控えるようにしてください。

**注記**: デバイスをiOS 12.2にアップデートすると，Xcode 10.1ではデバッグができなってしまいますので，テストに使用するデバイスのアップデートも控えたほうが良いかもしれません。

すでにアップデートしてしまった場合，<i class="fa fa-external-link" aria-hidden="true"></i> [Apple](https://developer.apple.com/download/more/)から過去のXcodeをダウンロードすることができます。

17r5には，Xcode 10.2およびSwift 5に対応した4D for iOSが組み込まれています。最新版のXcodeを使用するのであれば，17r5（ベータ版）の4D for iOSをご検討ください。

なお，4D for iOSは，単独でダウンロードすることもできます。

<i class="fa fa-external-link" aria-hidden="true"></i> [ダウンロード](https://download.4d.com/Products/Current/4D_v17R4/)
