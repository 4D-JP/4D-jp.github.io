---
layout: post
title: "HTTP timeoutは接続タイムアウトではない"
date: 2020-12-31 12:00:00
categories: 仕様
tags: programming network 
---

`HTTP SET OPTION`で設定できる`HTTP timeout`は，**接続タイムアウトではありません**。v18の初期リリースは，実装が間違っており，サーバー接続タイムアウト（サーバーがダウンしている場合，いつまでもレスポンスを待ち続けるようなことを避けるためのタイムアウト）にこのオプションが適用されていました。正しい動作は，HTTPレスポンスのタイムアウト（サーバーとの接続が確立された後，HTTPレスポンスが返されるまで待機する時間の上限）です。

**更新**: 

下記の不具合修正も参照

* ACI0101408 [v18.5 Hotfix 1](https://4d-jp.github.io/2021/07/21/release-note-version-18/) | [v19.0](https://4d-jp.github.io/2021/07/14/release-note-version-19/) | [19r2](https://4d-jp.github.io/202/release-note-version-19r2/)
  * `HTTP SET OPTION`の`HTTP timeout`オプションが`HTTP Get`の動作に反映されませんでした。つまり，サーバー接続に成功し，なかなか応答が返されず，切断もされない場合，いつまでもレスポンスを待ちました。 

* ACI0102310 [v19.0 Nightly Build > Hotfix 2](https://4d-jp.github.io/285/release-note-version-19/)
  * `HTTP Request`を続けて何度も実行した場合，`#17`（未実装の制御命令）エラーが返されることがありました。実際にはタイムアウトエラーが発生しています。`HTTP SET OPTION`で設定した秒数以内にレスポンスを読むことができなかった場合にエラーが返されます。 
