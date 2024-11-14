---
layout: fix
title: "プロパティをクリアするには"
date: 2024-11-13 08:00:00
categories: 仕様
tags: programming 20r6
---

20r6以降，クラスのプロパティ型を`property`キーワードで宣言した場合，オブジェクト・コレクション・バリアント以外のプロパティに`Null`を代入するコードは，シンタックスエラーが返されるようになりました。つまり，`var`キーワードで宣言した変数と同じような扱いになります。過去バージョンでは，`Null`を代入してもエラーになりませんでした。

<img src="https://github.com/user-attachments/assets/7f409be1-5bbc-4f0a-8549-5028dfdfd776" width=300 height=auto />


クラスをインスタンス化した直後には，プロパティが未定義となっています。未定義であって`Null`ではないことに留意してください。プロパティを未定義に戻したいのであれば，未定義の変数を代入することができます。

```4d
$object.myAttribute:="hello"
var $undefined  // 初期化されていないバリアント型の変数は未定義
$object.myAttribute:=$undefined
```
プロパティそのものを消去したいのであれば`OB REMOVE`を使用してください。`Null`を代入することによって未定義にできるのは，オブジェクト・コレクション・バリアント型の変数やプロパティだけです。