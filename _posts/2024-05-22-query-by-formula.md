---
layout: fix
title: "ORDAでフォーミュラによるクエリ"
date: 2024-05-20 08:00:00
categories: 仕様
tags: programming orda preemptive
---

クラシック言語の`QUERY BY FORMULA`に相当するクエリをORDAで実行する場合，[`.query()`](https://developer.4d.com/docs/ja/20-R4/API/DataClassClass#query)のプレースホルダーと`Formula`オブジェクトを使ってフォーミュラ引数を条件に使用したり，`eval()`ステートメントを使ってテキストでフォーミュラを記述したりすることができます。あるいは，検索条件そのものをフォーミュラで渡すこともできます。

[ドキュメント](https://developer.4d.com/docs/ja/20-R4/API/DataClassClass/)に明記されているように，クエリ条件のフォーミュラはサーバー側で評価されます。

> 4D Server: クライアント/サーバーにおいては，フォーミュラはサーバー上で実行されます。このコンテキストにおいては，`querySettings.args`オブジェクトのみがフォーミュラに送信されます。

4D 20以降，サーバー側のデータモデルクラス関数がコンパイルモードでは[常にプリエンプティブプロセスで実行される](https://developer.4d.com/docs/ja/20/ORDA/ordaClasses/#プリエンプティブ実行)ようになりました。

> クライアント/サーバーで動作するように設計されているプロジェクトでは、データモデルクラス関数のコードがスレッドセーフであることを確認してください。 スレッドセーフでないコードが呼び出された場合，実行時にエラーが発生します （シングルユーザーアプリケーションではコオペラティブ実行がサポートされているため，コンパイル時にはエラーが発生しません）。

4D 19では，シングルユーザーアプリケーションと同じように，呼び出し元のプロセスによってプリエンプティブまたはコオペラティブプロセスで実行されるという仕様でした。

---

`.query()`をクライアント側のプロセスがコオペラティブモードで実行されている場合，`eval()`や`Formula`はそちらのメソッドに記述することになるため，コンパイル時にはスレッドセーフのチェックをすり抜けてしまい，サーバー側のプリエンプティブプロセスで当該メソッドを実行しようとした段階でランタイムエラーが返されることになります。クエリにフォーミュラを含める場合，そのフォーミュラがスレッドセーフであることをしっかり確認してください。

`.query()`の条件にフォーミュラを埋め込むよりも，クラスを拡張してメンバー関数を実装したほうがORDAらしいコーディングであるといえます。個別のメンバー関数に「プリエンプティブプロセスを使用」という属性はありませんが，スレッドアンセーフなコードはシンボルファイルまたは`Compile project`のステータスオブジェクトで確認することができます。クラスを拡張してメンバー関数でサーバー側の処理を記述する場合，クラシック言語や既存のプロジェクトメソッドを混在させたりせず，プリエンプティブモードを前提にORDAでコーディングすることを心掛けると良いでしょう。