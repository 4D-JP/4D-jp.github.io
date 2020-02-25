---
layout: technote
original_title: Notarizing a Built 4D Application in v17 and v18
title: v17とv18の4Dアプリケーションのビルドを公証する
author: Erick Lui
position: Technical Services Engineer, 4D Inc.
date: 2019-12-30 00:00:00
categories: セットアップ
tags: deployment certificate sign 
version: 17, v18
---

4Dアプリケーションの公証の方法の紹介です。([原文](https://kb.4d.com/assetid=78380)）
<!--more-->

## はじめに
---
macOS Catalinaのリリースに伴い、エンドユーザーが意図せずに悪意のあるソフトウェアをインストールするのを防ぐために、導入されたすべてのアプリケーションによりセキュリティ対策が追加されました。公証は、開発者がアプリをAppleの公証サービスに提出し、潜在的に危険なコードをチェックすることを要求するプロセスです。このテクニカルノートでは、構築されたv18アプリを公証する手順と、v17アプリとの違いについて説明します。


## v18で公証する方法
---
v18を使用する最大のメリットは、「アプリケーションに署名」機能が更新され、Catalinaのセキュリティ要件に対応できることです。もしv17アプリがCatalinaの「アプリケーションに署名」機能を使って署名されていたら、いくつかの内部バイナリには古い署名が残っていて、公証サービスに提出した後に警告やエラーが発生していました。v18の署名には全く手間がかからず、公証プロセス中にエラーが発生することはありません。

スタンドアロンでビルドされたv18アプリの公証は、以下のステップで行います：

1. 「アプリケーションに署名」設定にチェックして、認証名を入力して、アプリケーションをビルドします。
![図１：アプリケーションに署名設定](/images/notarization/sign-application.png){: .align-center}

2.  アプリが有効な署名を持っているか確認します（オプション）：
```
$ spctl -av {PATH_TO_APP}
```

　　例：
```
$ spctl -av "/Users/elui/Desktop/notarize_v18.app" 

```

a. 署名が有効の場合は、出力は以下のようになります：
```
/Users/elui/Desktop/notarize_v18.app: accepted
source=Developer ID

```

3. アプリを圧縮します（あるいは署名したDMGに入れます）。

4. アプリに特定のパスワードを生成します（公証のステップ中のログイン信任状に必要です）。

　　a. Applied.apple.comにログインします。

　　b. “Security”セレクションの中で、”Generate Password…”をクリックします。

　　c. ![図１：セキュリティにパスワード設定](/images/notarization/security-password.png){: .align-center}

　　d. このパスワードをクリップボードかキーチェーンパスワードにコピーします。後半のステップで使用します。

5. 以下のターミナル・コマンドを使ってアプリを公証します：

```
$ xcrun altool --notarize-app --verbose --file           
{PATH_TO_ZIPPED_APP} --primary-bundle-id {BUNDLE_ID} --username
{APPLE_EMAIL} --password {APP_SPECIFIC_PASSWORD}
```

　　a. ”-- verbose”は、情報やエラーの詳細な表示に役に立つフラッグです。

　　b. {BUNDLE_ID}は自分で名前をつけることができる識別子です。ダッシュまたはアンダースコアは使用できません。（例： com.4d.myApp)

　　例：

```
$ xcrun altool --notarize-app --verbose --file
"/Users/elui/Desktop/notarize_v18.zip" --primary-bundle-id
com.4d.myApp --username elui@4d.com --password abcd-efgh-ijkllmop
```

　　c. アプリのサイズによりますが、アップロードには数分かかる場合があります。

　　d. アップロードに成功したら、ターミナルに出力が表示されます。
  
```
No errors uploading ‘/Users/elui/Desktop/notarize_v18.zip’
RequestUUID = 23fc455c-9314-4495-b309-808f2e4cc40e
```

6. 全てのアップロードされたアプリの公証の履歴をチェックします（最新のアプリは一番上にリストされます）。

```
$ xcrun altool --notarization-history 0 --username {APPLE_EMAIL}
--password {APP_SPECIFIC_PASSWORD}
```

　　例：
  
```
$ xcrun altool --notarization-history 0 --username elui@4d.com -
password abcd-efgh-ijkl-lmop
```
　　a. 公証の状況は、初めてアップロードした時には”in progress”が表示されます。
  
![図2：In progress表示](/images/notarization/inprogress.png){: .align-center}

　　b. だいたい3-5分後に、公証履歴コマンドラインを再度走らせます。公証が成功すると以下のメッセージが表示されます。

![図3：公証成功](/images/notarization/success.png){: .align-center}

7. 公証の警告をチェックします。

　　a. ステップ6からRequestUUIDを使って、以下のコマンドを走らせます：
  
```
$ xcrun altool --notarization-info {REQUEST_UUID} --username{APPLE_EMAIL}
```
　　例：
  
```
$ xcrun altool --notarization-info 23fc455c-9314-4495-b309-
808f2e4c&nbsp;c4&nbsp;e --username elui@4d.com
```

　　b. ステップ4で生成されたアプリ特定のパスワードを入力します。

![図4：パスワード入力](/images/notarization/input-password.png){: .align-center}

　　c. Ctr/Cmd（コントロール/コマンド）キーをクリック、もしくはブラウザーでLogFileURLをコピー/ペーストして、JSON形式で警告/エラーを検証します。

![図5：エラーをチェック](/images/notarization/error-check.png){: .align-center}

　　d. 何か問題がないか検証します。

![図6：問題をチェック](/images/notarization/issue-check.png){: .align-center}

8. 配布チケットを貼り付けます。

　　a. チケットの目的は、Gatekeeperに「いつユーザーがダウンロードしても、あるいはアプリを動かしても、アプリが公証されている」ことを伝えて、Appleサーバーでチェックされることなく、macOS上でアプリを動かすことができるようにすることです。

　　b. 公証されたアプリにチケットを貼付します。
  
```
$ stapler staple {PATH_TO_NOTARIZED_APP}
```

　　例：

```
$ stapler staple "/Users/elui/Desktop/notarize_v18.app"
```

　　c.貼付が成功すると下記の出力が表示されます：

```
Processing: /Users/elui/Desktop/notarize_v18.app
The staple and validate action worked!
```

9. 公証と貼付を成功させるために最後のチェックをします。

　　a. もしここまでの手順が正常に実行されているならば、ステップ2と同じターミナル・コマンドを走らせます。

```
$ spctl -av {PATH_TO_NOTARIZED_APP}
```

　　例：
  
```
$ spctl -av /Users/elui/Desktop/notarize_v18.app
```

　　b. “Notarized Developer ID”が以下の出力のソースプロパティによってリストされているのが分かるはずです。

```
notarize_v18.app: accepted
source=Notarized Developer ID
```

　　c. 貼付が成功しているかを見るのには、以下のコマンドを走らせます：
```
$ stapler validate {PATH_TO_NOTARIZED_APP}
```

　　例：
  
```
$ stapler validate /Users/elui/Desktop/notarize_v18.app
```

　　成功した出力：

```
Processing: /Users/elui/Desktop/notarize_v18.app
The validate action worked!
```

10. ZIP/ DMG/ PKGなど公証されて貼付された4Dアプリケーションを配布する準備ができました。

## 免責事項：　2020年1月までの簡略化された公証要件

上記の4D v18の公証手順は、Appleが2020年1月まで公証要件を緩和しているため、4D v17で一時的に使用できます。2020年1月以降は、古いv17バイナリから公証警告がエラーになり、アプリの公証ができなくなる可能性があります。これらの問題を解決するためにこのシナリオを遅かれ早かれ補填することを強くお勧めします。<strong>（このテックノートの最後に追記として情報を記載しました。ご参照ください。）</strong>さらに重要なのは、Catalinaでは64ビット・アプリケーションしかサポートしていないため、次のような問題が発生する可能性があることです：

V17.x

・4D InternetCommands.bundleは32ビットです。

　　・アプリケーションの問題：アプリではいかなるInternet Commandsも走らせることができません。

　　・回避策：バンドルを削除して、Rリリースや、より新しいバージョンのInternetCommands.bundleに置き換える。

・PHPインタプリタ(php-fcg-4d)は32ビットです。

　　・アプリケーションの問題：アプリケーションは4D PHPコマンド上でランタイム・エラーを返します。

　　・回避策：ありません。4DアプリではいかなるPHPコマンドも走らせることができませんが、公証サービスはエラーを返しません。

## v17で公証する方法
---
次の手順では、4D v17.xを公証し、潜在的な公証の警告を修正する方法を示します。

### 最初に署名せずにアプリケーションを構築する
アプリを構築するが、署名は避けます。いまアプリに署名しない理由は、署名の階層を無効しないためには、内部コンテンツ（ネイティブ・コンポーネント、プラグイン、フレームワークなど）は内部から署名しなければならないからです。署名の階層が無効になっているとGatekeeperによって検出され、起動時にアプリケーションがクラッシュする可能性が高くなります。

![図7：署名しない](/images/notarization/no-sign.png){: .align-center}

### エンタイトルメント（資格）：その意味と必要性

エンタイトルメントは、プロパティリスト (.plist)ファイルに保存される、アプリケーションが持つことを許可される機能またはセキュリティ・パーミッションの種類を指定します。一般に、ユーザーを信頼して機密情報にアクセスする悪意のあるプラグインをユーザーがインストールするような状況を防ぐために、アプリケーションに付与するエンタイトルメントの数は最小限にすることをお勧めします。

4Dの場合、基本の4Dアプリに付与する必要のあるエンタイトルメントは、アプリの起動時にコード署名保護を無効にするDisable Executable Memory Protectionエンタイトルメントのみです。このエンタイトルメントを付与することは、起動時にファイルを変更する4Dの性質上、意味があります。この権限がない場合、4Dアプリケーションを開くとファイルの変更が検出され、署名が無効となり、結果としてアプリケーションがクラッシュします。つまり、このエンタイトルメントを付与すると、Gatekeeperは、ユーザーが4Dアプリケーションでファイル（構造ファイル、データファイル、ログファイルなど）を変更しても問題ないことを認識します。

そのほかの付与可能なエンタイトルメントは以下のリンクで見つけられます：
Https://deveoper.apple.com/documentation/budleresources/entitlements

### エンタイトルメントのプロパティリスト・ファイルを作成し、修正する

ビルドされた4Dアプリケーションは、Info.plistファイルを持っているので、このファイルをコピーしてほかのプロパティリスト・ファイルを作成することや、entitlements.plistに名前を変えて、適正なエンタイトルメントを使って修正することができます。

1. /path/to/yourBuilgApp.app/Contents/に移動します。

2. Info.plistをコピーして、ビルドされたアプリの横のような、アクセスしやすいディレクトリにペーストします。

3. Info.plistをentitlements.plistにリネームします。

4. コンテンツを修正するために、entitlements.plistファイルは以下のコマンドを使ってXMLフォーマットに変換します：

```
$ plutil -convert xml1 {PATH_TO_PLIST_FILE}
```

　　例：

```
$ plutil -convert xml1
"/Users/elui/Desktop/myApp/entitlements.plist"
```

5. Entitlements.plistをコードエディター（例：AtomやSublime）を使って開きます。変換した後で、フォーマットは読むことや編集することがとても簡単になると気づくでしょう。

6. <dict>タグを持つ全てのコンテンツを削除します。結果は以下のようになります：

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
"http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
</dict>
</plist>
```

7. Disable Executable Memory Protection Entitlementにtrueを付与し、ファイルを保存します。結果は次のようになります。

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
"http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>com.apple.security.cs.disable-executable-page-protection</key>
	<true/>
 	</dict>
  </plist>

```

8. Entitlements.plistファイルは、アプリケーション内で特定のコンテンツに署名する際に使用する準備ができました。

### 徹底的に署名する - ネイティブ・コンポーネント、フレームワーク、プラグイン

もしv17アプリケーションで公証を受けるのであれば、主に、「署名がない」か「期限切れ」に関するエラーを受け取ることになるでしょう。これらのエラーを解決し、署名の階層を無効にしないために、.appファイル内のコンテンツはアプリケーション自体よりも先に署名されなければなりません。コンテンツには、ネイティブ・コンポーネント、フレームワーク、プラグインやリソースが含まれます。全てのコンテンツは- -timestampオプションと、必要であれば- -entitlementsオプションを使ったタイムスタンプを伴って署名されなければなりません。

タイムスタンプを伴った繰り返し有効な署名をするために、以下のターミナル・コマンドを使います。- -verboseオプションは、もし署名に成功しなかった場合に、詳細な情報を表示するためにのみ使用されます。

```
$ codesign --verbose --timestamp --deep --sign {CERTIFICATE}
 {PATH_TO_UNSIGNED_ITEM}
```

　　例：
  
```
$ codesign --verbose --timestamp --deep --sign "Developer ID
Application: Company Inc (ABCDEFGHIJ)"
"/Users/elui/Desktop/myApp/17_3.app/Contents/Native
Components/Zip.bundle/Contents/MacOS/Zip"
```
いくつかのファイルで必要とされるランタイムとエンタイトルメント・オプション付きの署名をするために、以下のターミナル・コマンドを使います：

```
$ codesign --verbose --timestamp --deep --options=runtime --
entitlements {PATH_TO_ENTITLEMENTS.PLIST} --sign {CERTIFICATE}
{PATH_TO_UNSIGNED_ITEM}
```

　　例：

```
$ codesign --verbose --timestamp --deep --options=runtime --
entitlements "/Users/elui/Desktop/myApp/entitlements.plist" --sign
"Developer ID Application: Company Inc (ABCDEFGHIJ)"
"/Users/elui/Desktop/myApp/17_3.app/Contents/Native
Components/WebViewerCEF.bundle/Contents/Frameworks/4D
Helper.app/Contents/MacOS/4D Helper"
```

いくつかのファイルは、古いデフォルトの署名がついていますので、削除しなければなりません。署名を削除するには、以下のターミナル・コマンドを使います：

```
$ codesign --verbose –remove-signature {PATH_TO_SIGNED_ITEM}
```

　　例：

```
$ codesign --verbose –remove-signature
"/Users/elui/Desktop/myApp.app"
```

署名が必要なファイルのリストは以下の通りです：

#### ネイティブ・コンポーネント({APP_Path}/Contents/Native Components)

- Zip.bundle/Contents/MacOS/Zip

- 4DSLI.bundle/Contents/MacOS/4DSLI

- Write.bundle/Contents/MacOS/Write

- SVG.bundle/Contents/MacOS/SVG

- HTTPServer.bundle/Contents/MacOS/HTTPServer

- LDAPComponent.bundle/Contents/MacOS/LDAPComponent

- MonitorGraph.bundle/Contents/MacOS/MonitorGraph

- SQLServer.bundle/Contents/MacOS/SQLServer

- CodeEditor.bundle/Contents/MacOS/CodeEditor

- WebViewerCEF.bundle/Contents/Frameworks/Chromium Embedded
   Framework.framework/Chromium Embedded Framework

- WebViewerCEF.bundle/Contents/Frameworks/4D Helper.app/Contents/MacOS/4D Helper

　　o Must be signed with options runtime and entitlements

- WebViewerCEF.bundle/Contents/MaOS/WebViewerCEF

- WebViewerSystem.bundle/Contents/MacOS/WebViewerSystem

#### フレームワーク ({APP_Path}/Contents/Frameworks)

- zlib.framework/Versions/A/zlib

- KernelIPC.framework/Versions/A/KernelIPC

- DB4D.framework/Versions/A/DB4D

- Kernel.framework/Versions/A/Kernel

- ServerNet.framework/Versions/A/ServerNet

- libzip.framework/Versions/A/libzip

- XML.framework/Versions/A/XML

- GUI.framework/Versions/A/GUI

- TextCore.framework/Versions/A/TextCore

- SQLConnector.framework/Versions/A/SQLConnector

- icu.framework/Versions/A/icu

- hunspell.framework/Versions/A/hunspell

- Graphics.framework/Versions/A/Graphics

- libxerces-c_3_2.dylib

- libssl.1.0.0.dylib

- libcrypto.1.0.0.dylib

#### SASLプラグイン ({APP_Path}/Contents/SASL Plugin)

- libdigestmd5.plugin

#### リソース ({APP_Path}/Contents/Resources)

- php/Mac/php-fcgi-4d

　　o Old signature must be removed

　　o Must be signed with options runtime and entitlements

- Updater/Updater.app/Contents/Frameworks/KernelIPC.framework/Versions/A/KernelIPC

- Updater/Updater.app/Contents/Frameworks/Kernel.framework/Versions/A/Kernel

- Updater/Updater.app/Contents/Frameworks/XML.framework/Versions/A/XML

- Updater/Updater.app/Contents/Frameworks/libxerces-c_3_2.dylib

- Updater/Updater.app/Contents/MacOS/Updater

　　o Must be signed with options runtime and entitlements

#### MacOS ({APP_Path}/Contents/MacOS)

- InstallTool

　　o Old signature must be removed

　　o Must be signed with options runtime and entitlements

- HelperTool

　　o Old signature must be removed

　　o Must be signed with options runtime and entitlements

- {APP_NAME}

　　o This executable will have the same name as what you named your built app

　　o Old signature must be removed

　　o Must be signed with options runtime and entitlements

### 徹底的に署名をする - スクリプトを使った自動化

各パッケージを手動で署名するのは退屈な作業ですので、このテックノートでは全てのパッケージを一度に署名するスクリプトを掲載しました。以下の情報が含まれていることが必要です：

- Apple Developer ID Certificate

　　o E.G. Developer ID Application: MyCompany Inc (A1B2C3D4E5)

- Name of the built app with file extension

　　o E.G. myApp.app

- entitlements.plist is in the same directory as built app

- script file is in the same directory as built app

- Apple Developer email

- App specific password

- Primary bundle id for your built app (name it yourself)

　　o E.G. com.myCompany.myAppName


スクリプトを実行するには、ターミナルを開いて、ビルドされたアプリが含まれるディレクトリを操作します。スクリプトは以下のコマンドを使って実行できます：

```
$ ./notary_script.sh
```

このスクリプトは、認証に関する情報、アプリケーションの名称、そして「可能性のある公証警告を解除するためにIntenetCommands.bundlesの削除」に対して指示します。もしアプリケーションでInternetCommandsを使用されていない場合、先に進んで”y”を押して削除します。あるいは”n”を押してキープすることもできます。
ここから、スクリプトはパッケージ全体を徹底的に署名します。

全てに署名が済むと、スクリプトはアプリケーションの圧縮と公証を続けます。Apple ID emailアプリを特定するパスワード、自身の名前を設定できる主要なバンドルIDに対して指示をします。ここからスクリプトは圧縮されたアプリを公証のためにアップロードします。すべて成功すればアップロードのRequestUUIDが公証履歴ページのトップにリストされているのが見られます。

ここから先は、このテックノートのv18セクションのステップ6-10、公証ステータスをチェックし、警告を見て、貼付のステップを参照してください。4Dのバージョンにかかわらず同じプロセスになります。

参考までに、このテックノートにはスクリプトをうまく走らせる方法をデモしたビデオもあります。

公証スクリプトを走らせる：https://youtu.be/iiALUoz7Biw

公証ステータスをチェックする：https://youtu.be/Tvmqy9Yxxsc

## 終わりに
---
このテクニカルノートは、スタンドアロンのv18とv17アプリケーションの公証の違いについて述べています。Catalinaには4D v18を強くお勧めします。署名機能がアップグレードされていて、公証に必要な条件に対応していてとても効率的です。4D v17アプリケーションの公証もまだ可能ですが、デベロッパー側で署名プロセス中に追加の作業が必要です。ここに含まれているスクリプトは、v17での署名プロセスを自動化するのを助け、デベロッパーが修正するのも良いですし、ほかのスクリプトをオンラインで見つけて、特定のアプリケーションを効率的に公証するのも良いでしょう。

## 追記
---
<strong>2019年9月3日のApple Developerニュース</strong>
{[原文リンク](https://developer.apple.com/news/?id=09032019a )}

### 要旨：
Mac App Storeの外で配付されるMacソフトウェアをmacOS Catalinaで実行するためには，ノタリゼーション（公証）が引き続き必要です。アプリが公証に合格するための条件は，2020年1月まで，下記のとおり緩和されています（ログに警告が出力されますが，エラーにはなりません）。

　a. "Hardened Runtime"のcapabilityがentitlementsに含まれていない
 
　b. コンポーネントがApple Developer IDでコード署名されていない
 
　c. コード署名にセキュアなタイムスタンプが含まれていない
 
　d. 10.9以前のSDKでビルドされている
 
　e. "com.apple.security.get-task-allow"（プラグインのデバッグ等に必要）がentitlementsで有効にされている

### 解説：
4D v14からv17 R6の「アプリケーションビルド」画面に組み込まれている「コード署名」は，ノタリゼーション制度が実施される以前に開発されたということもあり，上記のa. c. に該当します。また，4Dのv12からv17 R4にプリインストールされているPHP，および，4D Internet Commandsプラグインは，上記の d. に該当します。また，4Dのv14からv17 R6の日本語版にプリインストールされているmecabモジュール（日本語形態素分解ライブラリ）は，Info.plistファイル内の実行ファイル名（MeCab）が実際のファイル名（mecab）と厳密に一致していないため，コード署名の前にファイル名を揃える必要があります。さらに，サードパーティ社製プラグインは，Info.plistファイル内で"Bundle OS Type code"が"4DCB"に設定されていることがあり，その場合，コード署名の前に"4DCB"から"BNDL"に修正する必要があります。

このテクニカルノートで紹介されている方法，つまり，4Dの「アプリケーションビルド」画面に組み込まれている「コード署名」を使用せずに，コマンドラインツールでコード署名を実行したアプリであれば，a. b. c. e. の条件には該当しませんが，PHP，および，4D Internet Commandsが d. の条件に該当します。


<strong>2019年12月23日のApple Developerニュース</strong>
{[原文リンク](https://developer.apple.com/news/?id=12232019a )}

### 要旨：
Mac App Storeの外で配付されるMacソフトウェアをmacOS Catalinaで実行するためには，ノタリゼーション（公証）が引き続き必要です。9月のニュースでは，移行期間として，公証のための条件が一時的に緩和されていることを伝えましたが，この措置は，2020年2月2日をもって終了します。2020年2月3日以降，アプリの公証には，本来の条件が適用されることになります。なお，2020年2月2日以前に合格したアプリは，引き続き，使用することができます。

### 解説：
2020年2月3日以降，このテクニカルノートで紹介されている方法でコード署名を実行したアプリ（4D v14からv17 R6）は，PHP，および，4D Internet Comandsが d. の条件に該当するため，公証エラーとなります。PHPを使用しないのであれば，PHPフォルダーを削除してからコード署名を実行することができるかもしれません（標準モジュールを取り外した運用は，サポート外となります）。同じように，4D Internet Commandsはビルドから除外，あるいはv17 R6以降のものと差し替えることができるかもしれません。いずれにしても，v17は，macOS 10.15 Catalinaを正式にサポートしていないことに留意してください。macOS 10.15 Catalinaで4Dを運用するのであれば，v18にアップグレードすることをご検討ください。




