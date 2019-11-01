---
layout: post
title: ヘッドレス4Dアプリケーション
date: 2019-10-28 00:00:00
categories: ブログ
tags: 18.x programming
author: Damien Fuzeau
---

![Headless4DApplication](/images/blog/10/107548_HeadlessApplication.jpg)

4D開発者として、グラフィカル・ユーザー・インターフェイス(GUI)を使わないアプリケーション、別名ヘッドレス・アプリケーション、を開発する必要に直面した経験をすでにお持ちでしょう。以前の4Dでは考えられませんでしたが・・・それも4D v18までです！このブログ記事では、新しく可能になった機能を使ってアプリケーションを”ヘッドレス”にする方法を説明します！

なぜヘッドレス・アプリケーションを作成するのでしょうか。今回はいくつかの使用例を挙げています。macOSでWindowsの動きをシミュレートする、あるいはサービス・マネージャーを使わずにWindowsのサービスの動きを実行するなどです。しかし、これら以上に、4Dでボットを開発するような新しい機会も開かれています。

#### どのようにヘッドレス・モードで4Dアプリケーションを起動するか？

4Dをヘッドレス・モードで起動するには、新しい”<a href="https://doc.4d.com/4Dv18/4D/18/Command-Line-Interface.300-4575704.en.html">headless</a>”パラメータとCLI（コマンド・ライン・インターフェイス）を使います。これは全てのアプリケーション・タイプで有効です：4D、4D Server、スタンドアロン、リモート、マージしたアプリケーション。下記の例では、現在のディレクトリが実行可能なディレクトリになります。

macOSサンプル（ターミナルがバンドルの”Contents/MacOS”フォルダーにある場合）：
```
./4D\Server --headless MyDatabase.4DLink
./"4D Server" --headless MyDatabase.4DLink
./4D --headless MyDatabase.4DLink
./MyBuiltRemoteApp --headless
```

Windowsサンプル：
```
"4D Server.exe" --headless MyDatabase.4DLink
4D.exe --headless MyDatabase.4DLink
MyBuiltRemoteApp.exe --headless
```

<a href="https://doc.4d.com/4Dv18/4D/18/Get-application-info.301-4505388.en.html"><span class="no translate command">Get application info</span></a>コマンドによって返されたオブジェクトに新しい”ヘッドレス”属性を追加しました。それによってインターフェイスの有無によらず、実行モードに依存したコードを書くほうがとても簡単となりました。

<strong>注意</strong>：　Windowsシステム上のサービスモードでアプリケーションが動いたとき、それは自動的にヘッドレス・アプリケーションとして実行されます。サービスを止めることで、4Dを正確な方法で終了します（例えば、macOSアクティビティ・モニターで”終了”アクションを使うように）。

#### 実行中に何が起こるのか？

おそらく疑問に思うことでしょう、「オーケー、それは嬉しい。が、ダイアログが表示されたとしたらどうなるのだろう？」と。ランタイム時に何が起こっているのかをずっと知らせるために、4Dは自動的に診断ログをヘッドレス・モードで起動します。このログは、かつて[{applicationName}.HDLS]タグを使って表示され、ログに取られた全てのユーザーインターフェイスをキャッチします。

一般的な動作では、4Dは何かを表示しようとするコマンドをキャッチして、コマンド名とコールチェーン一緒に警告イベントをログに取り、アクションをキャンセルします。稀に特別なケースもあります：

* もし有効なライセンスがない場合、4Dはこのシステム・イベント・ログと標準的な流れをログに取り、終了します。
* データベースの変換が必要な場合、4Dはこのシステム・イベント・ログと標準的な流れをログに取り、終了します。
* もし有効なデータベースあるいはデータファイルが見つからない場合、4Dはこのシステム・イベント・ログと標準的な流れをログに取り、終了します。
* デバッガーの表示が必要なとき、4Dはエラーをログに取り、”取り消し”アクションをシミュレートします。
* アラートが表示されたとき、4Dは”OK”アクションをシミュレートします。
* 「4Dを終了」コマンドがコールされたとき、4Dはログを取り、”OK”アクションをシミュレートします。
* マージされたアプリケーションがアップデートしなければならないとき、ログが生成され、アップデートを実行し、アプリケーションはヘッドレス・モードで再起動します。

### サンプル
例えば、Windowsのサービスとして起動したサーバー上で実行された<span class="no translate command">ALERT</span>コマンドは、サーバーの実行を止めることはもはやできません。4Dは自動的にコマンドをキャッチし、ダイアグノスティック・ログ中に警告行を書き込みます。次のように：

<strong>11 2019-07-11 18:53:52 [myTestDatabase Server.HDLS] WARN – (Alert: Test alert label)[{“type”:”projectMethod”,”name”:”myTestAlert”,”line”:2,”database”:”myTestDatabase”}]</strong>

このシステムはヘッドレス・アプリケーションで何が起こっているかを見るために作られていて、（必要であれば）コードを改良するためでもあります。

#### システムの標準ストリームを使う

新しいセレクター、``Into system standard outputs``、を<a href="https://doc.4d.com/4Dv18/4D/18/LOG-EVENT.301-4505620.en.html"><span class="no translate command">LOG EVENT</span></a>コマンドに追加し、テキストをstdoutとstderr標準ストリームへ送ることができます。ご存知のように、<a href="https://doc.4d.com/4Dv18/4D/18/LOG-EVENT.301-4505620.en.html"><span class="no translate command">LOG EVENT</span></a>コマンドにはオプションの”importance”パラメータがあります。そのため、イベントの重要性によって、コマンドはテキストを``Information message``と``Warning message`` に対してstdoutストリームで、``Error message``に対してstderrストリームで送ります。

<strong>stdout</strong>へテキストを送る：
<code class="fourd"><span class="no translate command">LOG EVENT</span>(<span class="notranslate variable">Info system standard outputs</span>;"This is a text for stdout";<span class="notranslate variable">Information message</span>)</code>


<strong>stderr</strong>へテキストを送る：
<code class="fourd"><span class="no translate command">LOG EVENT</span>(<span class="notranslate variable">Info system standard outputs</span>;"This is a text for stderr";<span class="notranslate variable">Error message</span>)</code>

そしてまた、4Dとアプリケーションによって生成された情報を検索するために、stdoutとstderr標準ストリームに対してリダイレクションを使うこともできます。デフォルトでは、これらのストリームはシステムの設定によって、一般的にコンソールに直接向かい、稀にスクリーンに向かいます。例えば、以下のコマンドラインを使って、標準ストリームをファイルにリダイレクトできます。

macOS：
```
./4D --headless MyDatabase.4DLink 1>stdout.txt 2>stderr.txt
```

Windows：
```
4D --headless MyDatabase.4DLink 1>stdout.txt 2>stderr.txt
```

ストリームのリダイレクションの組み合わせのリマインダー：
* <strong>1>outputFile</strong>：標準アウトプットストリームはシステムのデフォルトアウトプットの代わりにファイルに書き込まれます。ファイルはコマンドが起動した時に自動的に生成されます。もしすでに存在していれば、古いコンテンツは消去されます。
* <strong>1>>outputFile</strong>：上記のシンタックスと同じ動きをしますが、ファイルがすでに存在している場合、それはストリームのコンテンツに追加されます。
* <strong>2>errorFile</strong>：標準エラーストリームはシステムのデフォルトアウトプットの代わりにファイルに書き込まれます。ファイルはコマンドが起動した時に自動的に生成されます。もしすでに存在していれば、古いコンテンツは消去されます。
* <strong>2>>errorFile</strong>：上記のシンタックスと同じ動きをしますが、ファイルがすでに存在している場合、それはストリームのコンテンツに追加されます。
* <strong>2>&1</strong>：エラーストリームはアウトプットストリームにマージされます。
* <strong>1>&2</strong>：アウトプットストリームはエラーストリームにマージされます。

<strong>注意</strong>：macOSシステムでopenコマンドを使って4Dパッケージを起動することはでき、ストリームは4Dアプリケーションではなくこのコマンドで生成されます！

#### まとめ

これらの新しい利点によって、システムの必要な使用条件に適合し、またボットのような新しい機会を作成することもできます。これをあなたのソフトウェア工場の継続的な統合(CI)や継続的なテスト(CT)工程に組み込むかはあなた次第です。あなたのイマジネーションだけが唯一の制限なのです！

