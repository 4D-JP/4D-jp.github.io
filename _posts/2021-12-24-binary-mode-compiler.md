---
layout: post
title: "M1搭載Macでコンパイルできない？"
date: 2021-12-24 15:00:00
categories: 仕様
tags: mac applesilicon
version: 19
---

v19はUniversal Binaryアプリです。つまり，IntelとApple Silicon，両方のアーキテクチャに対応しています。M1搭載Macでv19を起動した場合，Apple Siliconアーキテクチャの実行ファイルが優先的にロードされます。アプリは，ストラクチャファイルを選択する前に起動するため，バイナリモードの.4DBファイルを開いたとしても，デザインモードはApple Siliconアーキテクチャで動作することになります。

デザインモードがApple Siliconで動作している場合，バイナリモードのストラクチャをコンパイルしようとすると，エラーが返されます。

<img width="708" alt="compile-error" src="https://user-images.githubusercontent.com/10509075/147319815-4a2520e3-97c9-4eae-bb28-9146c926994d.png">
