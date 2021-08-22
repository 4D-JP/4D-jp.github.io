---
layout: post
title: "入力可のチェックボックスおよびラジオボタン"
date: 2021-08-10 12:48:00
categories: 仕様
tags: v19 userinterface
---

v19以降，`OBJECT SET ENTERABLE`はチェックボックスやラジオボタンにも適用されるようになりました。ワイルドカードを使用してさまざまなフォームオブジェクトをまとめて制御している場合，注意が必要です。

バイナリモードでは，フィールドと変数が別々のオブジェクトでしたが，プロジェクトモードでは，その区別がありません。バイナリモードのストラクチャをプロジェクトモードに変換した場合，ブール型フィールドは，チェックボックスまたはラジオボタンになります。

v18では，チェックボックスおよびラジオボタンに「入力可」プロパティが存在しなかったため，ブール型フィールドは結果的にすべて入力可となりました。

v19では，チェックボックスおよびラジオボタンに「入力可」プロパティが存在します。v19でバイナリモードのストラクチャをプロジェクトモードに変換した場合，ストラクチャの「非表示」フィールドプロパティが参照され，`False`であれば，バイナリモードの「入力可」プロパティがそのままプロジェクトモードに継承されます。`True`であれば，プロジェクトモードの「入力可」プロパティは常に`False`となります。