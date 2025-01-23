---
layout: fix
title: "QodlyScriptと4D"
date: 2024-01-24 08:00:00
categories: 仕様
tags: devcon24 programming language qodly
---

#### 4D Developer Conference 2024・質疑応答より

> **Qodly for 4D**で開発したプロジェクト（たとえばトレーニングで使用したレンタカーのアプリケーション）を**Qodly Cloud**に変換することはできるのでしょうか

クラウド版のQodly Server（Linuxプラットフォームで動作する軽量版の4D Server）は，バックエンドに4Dと同じデータベースエンジンを採用していますが，Windows/macOS版の4D Serverよりもできることが限られているため，Qodly for 4Dで開発したプロジェクトをQodly Cloudにそのまま変換することはできません。

Qodly Serverでアプリケーションが動作するためには，4Dではなく，**QodlyScript**ですべてがコーディングされていなければなりませんが，**QodlyScript**では下記のものが使用できません。

* プロジェクトメソッド
* データベースメソッド
* コンポーネントメソッド
* トリガ
* コマンド
* プラグインコマンド

クラスAPIについては，[SystemWorker](https://developer.4d.com/docs/ja/API/SystemWorkerClass/), [WebSocket](https://developer.4d.com/docs/ja/API/WebSocketClass), [SMTPTransporter](https://developer.4d.com/docs/ja/API/SMTPTransporterClass)など一部の例外を除き，基本的に4DとQodlyに共通です。

## QodlyScriptとは

QodlyScriptは，4DとJavaScriptによく似たプログラミング言語です。4DとQodlyScriptを比較すると

1. キーワードの違い
1. 演算子の違い
1. 変数名の違い
1. 定数名の違い
1. パラメーター区切りの違い
1. 演算子の優先順位の違い

が挙げられます。

#### キーワードの違い

QodlyのキーワードはJavaScriptと同じく[**ECMAScript**](https://262.ecma-international.org/5.1/#sec-7.6)に準拠しています。4Dのキーワードとは違い，①キャメルケースであり，②空白を含みません。また，一部のキーワードは統合されています。

|4D|QodlyScript|
|-|-|
|If|if|
|Else|else|
|End if|end|
|Case of|switch|
|While|while|
|End while|end|
|For|for|
|End for|end|
|Repeat|repeat|
|Until|until|
|For each|forEach|
|End for each|end|
|Use|use|
|End use|end|
|Function|function|
|Class extends|extends|
|Class constructor|constructor|
|var … : Text|var … : string|
|var … : Date|var … : date|
|var … : Time|var … : time|
|var … : Boolean|var … : boolean|
|var … : Integer|var … : integer|
|var … : Real|var … : real|
|var … : Picture|var … : picture|
|var … : Blob|var … : blob|
|var … : Collection|var … : collection|
|var … : Object|var … : object|
|var … : Variant|var … : variant|
|#DECLARE|declare|
|Alias|alias|
|Try|try|
|Catch|catch|
|End try|end|
|True|true|
|False|false|
|This|this|

#### 演算子の違い

4DとQodlyでは代入演算子および等価比較演算子が違います。

|4D|QodlyScript|
|-|-|
|\:=|=|
|=|==|
|#|!=|

#### 変数名の違い

Qodlyにはプロセス変数の概念がありません。変数のスコープは常にローカルです。変数名には，`$`・ `_`・Unicodeを使用することができますが，冒頭の文字に数字・`$`を使用することはできません。

|4D|QodlyScript|
|-|-|
|$myVar|myVar|

#### 定数名の違い

Qodlyの定数名は，`k`から始まり，キーワード同様にキャメルケースであり，空白を含みません。また，ASCIIコードの`Tab`など，リテラル表記で代用できるものは除かれています。

|4D|QodlyScript|
|-|-|
|4D REST digest|k4DRESTDigest|
|Tab|9|

#### パラメーター区切りの違い

Qodlyのパラメーター区切りはカンマ記号です。

|4D|QodlyScript|
|-|-|
|;|,|

#### 演算子の優先順位の違い

4Dでは単純に左から右に向かって演算子を評価しますが，Qodlyでは[ECMAScript](https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/Operator_precedence)と同じように演算子を評価します。

|4D|QodlyScript|
|-|-|
|3+10*2=26|3+10*2=23|

## Qodlyモード

将来のバージョンでは

1. QodlyScriptで4Dメソッドを記述する
1. Qodlyと同じ演算子の優先順位を4Dでも使用する

モードが提供される予定です。

また，4DからQodlyに対して[Open datastore](https://developer.4d.com/docs/ja/API/DataStoreClass/#open-datastore)を使用することができるように，Qodlyから4Dに対しても`openDatastore()`が実行できるようになる予定です。

## その他

* Qodly for 4DとQodly Cloudの*WebForm* は互換性があるので，一方のQodly Studioから他方の*Qodly Studio* にコピー＆ペーストすることができます。

* 4DのストラクチャとQodlyのモデルは同じものではありません。しかし，相違点には法則性があるので，変換プログラムを開発できるかもしれません。