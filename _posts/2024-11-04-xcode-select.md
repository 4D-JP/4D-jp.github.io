---
layout: fix
title: "clangのアップデート"
date: 2024-11-03 08:00:00
categories: 仕様
tags: programming macos compiler
---

4Dは，Apple SiliconターゲットのコンパイルにApple clang（Xcode）を使用しています。OSのアップグレードに伴い，Xcodeもアップグレードした場合，初回のコンパイルで「デベロッパーツールが正しく設定されていない」というエラーが返されるかもしれません。

![](https://github.com/user-attachments/assets/854cbae3-aecb-4c58-a5e2-d54a84c9109a)

OKボタンをクリックすると，XCodeの標準的なインストール先である*/Application/XCode.app* にデベロッパーツールのパスが設定されますが，他にも問題がある場合，別のエラーが返されるかもしれません。

![](https://github.com/user-attachments/assets/a026c1cf-d784-4ba0-a45c-fe9c6bc34ca4)

エラーメッセージをみると，XCodeのライセンスに合意する必要がある，ということがわかります。XCodeを起動するか，エラーメッセージで勧められているコマンドライン`sudo xcodebuild -license`を実行することにより，Apple Siliconターゲットのコンパイルができるようになります。

![](https://github.com/user-attachments/assets/791f363e-e8de-4023-9591-700129be08b7)
