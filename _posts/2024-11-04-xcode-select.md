---
layout: fix
title: "clangのアップデート"
date: 2024-11-03 08:00:00
categories: 仕様
tags: programming macos compiler
---

4Dは，Apple SiliconターゲットのコンパイルにApple clang（Xcode）を使用しています。OSのアップグレードに伴い，Xcodeもアップグレードした場合，初回のコンパイルで「デベロッパーツールが正しく設定されていない」というエラーが返されるかもしれません。

![](https://github.com/user-attachments/assets/c643870e-0034-4bb0-9693-7b95b5d84e1c)

OKボタンをクリックすると，XCodeの標準的なインストール先である*/Application/XCode.app* にデベロッパーツールのパスが設定されますが，他にも問題がある場合，別のエラーが返されるかもしれません。

![](https://github.com/user-attachments/assets/79a870d2-520c-4d70-b6ee-bbeacb573725)

エラーメッセージをみると，XCodeのライセンスに合意する必要がある，ということがわかります。XCodeを起動するか，エラーメッセージで勧められているコマンドライン`sudo xcodebuild -license`を実行することにより，Apple Siliconターゲットのコンパイルができるようになります。

![](https://github.com/user-attachments/assets/495dcada-a5fd-4cde-be48-cfba689edd52)