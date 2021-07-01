---
layout: post
title: "Intelアーキテクチャを優先するには"
date: 2021-07-01 12:00:00
categories: 注意点
tags: v19 mac silicon build
version: v19
---

Mac版v19デスクトップ・クライアント・サーバーランタイムは，すべて**Universal 2**アプリです。Intelターゲットに限定してコンパイルを実行しても，アプリにはApple Siliconの実行ファイルが含まれているため，M1マシンでは「Rosettaで開く」オプションを明示的に選択する必要があります。このオプションは，Finderの「情報を見る」画面で操作することができます。

「Rosettaで開く」オプションは，マシン毎の設定（Launch Services）であることに留意してください。開発者のMacでFinderの「情報を見る」画面を開き，「Rosettaで開く」オプションを有効にしたアプリを配付しても，ユーザーのMacには影響しません。

プラグインやコンポーネント等がApple Siliconに対応していないなどの理由により，「Rosettaで開く」オプションが必須なのであれば，Finderの「情報を見る」画面ではなく，`Info.plist`ファイルでIntelアーキテクチャが優先されるように設定することを検討してください。

```xml
<key>LSArchitecturePriority</key>
<array>
    <!-- architecture order of execution for universal binary 2 -->
    <string>x86_64</string>
    <string>arm64</string>
</array>
```

<i class="fa fa-external-link" aria-hidden="true"></i> [Building a Universal macOS Binary](https://developer.apple.com/documentation/apple-silicon/building-a-universal-macos-binary#overview)
