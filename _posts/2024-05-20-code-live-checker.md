---
layout: fix
title: "コードライブチェッカーの警告"
date: 2024-05-20 08:00:00
categories: 仕様
tags: programming compiler
---

[コードライブチェッカー](https://blog.4d.com/ja/introducing-code-live-checker-elevating-code-quality-in-4d-development/)は，タイプ入力中（コピー＆ペーストを含む）にオブジェクト記法の整合性をチェックする新しい仕組みです。[`var`宣言](https://blog.4d.com/ja/simplify-variable-declarations-assignments-in-a-single-line/)・[`property`宣言](https://blog.4d.com/ja/declaring-class-properties/)・[`#DECLARE`構文およびメンバー関数のプロトタイプ](https://blog.4d.com/ja/coder-friendly-syntax-for-class-functions-and-methods/)・[コンポーネントの名前空間](https://blog.4d.com/ja/access-your-component-classes-from-your-host-project/)といった新しいシンタックスを十分に活用していれば，従来のシンタックスチェックでは検出できない，論理的な不整合がエラーまたは警告としてコーディング中に表示され，ミスを未然に防ぐことができます。

コンパイルまたはシンタックスチェックを実行すると，ライブチェッカーの警告は一旦クリアされます。`enter`キーでトークナイズを実行するか，メソッドの編集を再開すると，ライブチェッカーが発動し，警告が再表示されます。これは仕様です。
