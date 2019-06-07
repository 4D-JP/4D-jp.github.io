---
layout: technote
original_title: Application Signing with 4D
title: "4Dのアプリケーション署名"
author: Timothy Aaron Penner
position: Senior Technical Services Engineer, 4D Inc.
date: 2018-09-04 00:00:00
categories: セットアップ
tags: deployment certificate sign 
version: 17
---

4Dアプリケーションに署名を付加する方法の紹介です。([原文](https://kb.4d.com/assetid=78116)）
<!--more-->

## はじめに
---
アプリケーションの署名は、アプリケーションを配布する工程の不可欠な部分です。これは一種の耐タンパー性ボトルや「剥がされたら無効」ステッカーのようなもので、消費者が商品を改竄されたかどうかを識別する手段として機能します。署名済みアプリケーションは、アプリケーションが改竄されていない場合のみ有効です。対照的に、アプリケーションに署名した後でバイナリファイルを変更すると、署名が無効になります。これは開発の最終段階に置ける追加のステップですが、開発時間が増えたとしてもそれがエンドユーザーの安心感の向上に繋がります。


## なぜアプリケーションに署名するのか
---
アプリケーションを顧客に配布する前に署名することには多くの利点があり、欠点はほとんどありません。全般的に利点は欠点を上回っています；しかし、開発者自身の開発と実際の運用にとって何が正しいのかを決めるのは開発者次第です。例えば、内部データベースのために社内で開発作業をする開発者は、一般に販売するアプリケーションの開発者ほど署名が重要ではないと考えるかもしれません。ただし、アプリケーションの署名は、実際にはどちらの状況でも役立ちます。長所と短所を見ていきましょう。


### アプリケーション署名の長所
アプリケーション署名は開発者とエンドユーザーの双方に有益となり得ます。
長所の例をいくつか挙げると：

　・バイナリーが操作されないように保護する
　・タンパー（外部から解析）されていないことを証明する
　・アプリケーションが信頼できるソースから出されていることを証明する
　・Windowsで移動した際に「信頼できないパブリッシャー」メッセージが表示されない

### アプリケーション署名の短所
わずかですがアプリケーション署名には短所があります。考慮すべきことの例をいくつか挙げると：

・アプリケーションの工程や準備に作業が追加される
　　開発工程が少し長くなり得る
・信頼できる認証機関($$$)から認証を受ける必要がある
　　開発費用が少し増える
・アプリケーションが最初に起動された時に署名が有効になる
　　初期起動の際に少し時間がかかる

## 署名認証を入手する
アプリケーションに署名する前に、開発者は署名証明書を取得する必要があります。MacとWindowsの証明書の取得方法にはいくつかの違いがあるため、このドキュメントのこのセクションは、Windows用とMac用の二つのセクションに別れています。

### Windows
署名証明書は、多数のオンラインSSL証明書ベンダーから入手できます。このテクニカルノートでは、自己署名証明書が使用されています；これが製品として販売される場合、自己署名証明書の代わりに信頼できるソースからの証明書を使用することが推奨されます。

#### 自己署名証明書の作成
以下のコマンドとパラメータはWindowsで自己署名証明書を作成するのに使用します：

　　コマンド：New-SelfSignedCertificate
　　パラメータ 1： -Type カスタム
　　パラメータ 2： -Subject “CN=4D, O=4D Inc, C=US”
　　パラメータ 3： -KeyUsage デジタル署名
　　パラメータ 4： -FriendlyName  “4D, Inc”
　　パラメータ 5： -CertStoreLocation  “Cert:|LocalMachine|My”

このテクニカルノートに使用されている値は入力されていますが、開発者はSubjectパラメータとFriendlyNameパラメータにカスタムデータを使用することができます。CertStoreLocationパラメータもカスタムデータを使用できますが、この場所は後で使用されるため、上記以外のものを使用する場合は、後で置き換える必要があります。

値が更新されたら、全てを１行にまとめ、次のようにElevatedPowerShellから実行します：

```
New-SelfSignedCertificate -Type Custom - Subject "CN=4D, O=4D Inc, C=US" - 
KeyUsage DigitalSignature - FriendlyName "4D, Inc" -CertStoreLocation
"Cert:＼LocalMachine＼My"

```
コマンドが正確に実行されると、結果は下記のようになります：

```
PSParentPath: Microsoft.PowerShell.Security＼Certificate::LocalMachine＼My 
Thumbprint                                Subject
----------                                -------
A6B2B0B3FECC6E4ELA3B562118F18BC82B63F304  CN=4D, O=4D Inc, C=US

```

署名の拇印は重要で後になってからも使用されます。この例では拇印はA6B2B0B3FECC6E4E1A3B562118F18BC82B63F304ですが、自宅でフォローしている人の拇印は違ってきます。次のセクション例では、必ず正しい拇印を使用してください。

注意：このプロセスではElevated PrivilegesのPowerShellウィンドウから実行する必要があります。

#### 証明書をPFXに転送する
次のステップは証明書をPFXファイルに書き出すことですが、これを行うにはパスワードを設定する必要があります。PowerShellコマンド　ConvertToSecureStringを使用して安全なパスワードを作成し、それをセッション変数 ($pwd)に格納します。PowerShellコマンド　ExportPFXCertificateを使用して、$pwdセッション変数を使用した証明書をPFX形式で書き出します。
次の2行のPowerShellコードは、$pwdセッション変数にパスワードを作成してから、証明書のエクスポートに$pwdセッション変数を使用します。

```
$pwd = ConvertTo-SecureString -String "thePassword" -Force -AsPlainText
Export-PfxCertificate -cert
Cert:＼LocalMachine＼My＼A6B2B0B3FECC6E4ELA3B562118F18BC82B63F304 -FilePath
C:＼signing＼cert.pfx -Password $pwd
```
最初のコマンドとパラメータの内訳は：

　　保存されたリターン値：$pwd
　　コマンド１: ConvertToSecureString
　　パラメータ1: - String “thePassword”
　　パラメータ2: - Force
　　パラメータ3: -AsPlainText

ターミナルの外で書かれた最初のコマンドは以下の通りです：

```
$pwd = ConvertTo-SecureString -String "thePassword" -Force -AsPlainText
```
これによりPowerShellコードの次の行で使用される$pwdセッション変数内に、安全な文字列としてパスワード (“thePassword”)を格納します。開発者は、passwordパラメータの値を変更してから、次の例で正しいパスワードを使用します。
使用される２番目のコマンドとパラメータの内訳は次の通りです：

　　コマンド ２: ExportPfxCertificate
　　パラメータ 1: -cert
　　Cert:|LocalMachine|My|A6B2B0B3FECC6E4E1A3B562118F18BC82B63F304
　　パラメータ2: -FilePath C:|signing|cert.pfx
　　パラメータ3: - Password $pwd

端末に表示される２番目のコマンドは、次のようになります（行の長さとドキュメントの幅のため、１行は複数行になっています。）：

```
Export-PfxCertificate -cert
Cert:＼LocalMachine＼My＼A6B2B0B3FECC6E4ELA3B562118F18BC82B63F304 -FilePath
C:＼signing＼cert.pfx -Password $pwd
```
拇印によって識別された証明書を転送し、$pwdセッション変数で定義されたパスワードを使用して、FilePathパラメータで指定されたパスにそれを転送します。このコマンドを実行するとき、開発者は正しい拇印を代入する必要があります。
全てのデータポイントが更新されたら、開発者は次の２つのコマンドを実行できます。

```
$pwd = ConvertTo-SecureString -String "thePassword" -Force -AsPlainText
Export-PfxCertificate -cert
Cert:＼LocalMachine＼My＼A6B2B0B3FECC6E4ELA3B562118F18BC82B63F304 -FilePath
C:＼signing＼cert.pfx -Password $pwd
```

これにより、パスワードで保護されたPFX証明書が指定の場所に配置されます。PFXファイルを使用するにはパスワードが必要です。
PowerShellでチェックされた出力は、次のようになります：

```
Directory: C:＼signing

Mode        LastWriteTime      Length Name
----        -------------      ------ ----
-a---   8/9/2018  3:06 PM        2701 cert.pfx

```
この画面は、ファイルが出力され短い要約が提供されたことを示しています。

### MacOS
MacOSプラットフォーム用の署名証明書は、XCodeの内部またはApple Developer ウェブサイトから作成できます。どちらの場合も、有効なAppleデベロッパプログラムのメンバーシップが必要です。


#### Appleのウェブサイトから証明書を取得する
Apple デベロッパーウェブサイトは以下のURLからアクセスできます：
https://developer.apple.com/account/

Appleのウェブサイトから証明書を取得する手順は、何年もの間変わり続けています。現在、開発者はiTunes接続ポータルを使用して証明書を取得する必要があります。

#### XCodeを使って証明書を取得する
XCodeから証明書を作成するには、まずXCodeを起動します。
XCodeのドロップダウンメニューからPreferencesメニューを選択します：

![図１：XCodeのメニュー](/images/app-signing/xcode-preferences.png){: .align-center}

Accountsタブを選択します。

![図２：XcodeのPreferencesメニューからAccountsを選択](/images/app-signing/xcode-accounts.png){: .align-center}

AppleIDアカウントがまだ追加されていない場合、＋ボタンをクリックしてアカウントを追加します（このアカウントにはApple デベロッパープログラムの有効なメンバーシップが必要です。）
一度AppleIDアカウントが追加されると、アカウント・ウィンドウの左側からアカウントを選択できます。それからManage Certificatesボタンをクリックします。
Manage Certificatesダイアログから、＋（プラス）をクリックして「Developer ID Application」を選択します。


![図３：Manage Certificatesダイアログ](/images/app-signing/manage-certificates.png){: .align-center}

画面の指示に従ってプロセスを完了します。

#### キーチェーン・アクセスの中に証明書を配置
一度完了していれば、証明書は証明書セクションの下のキーチェーン・アクセス・アプリケーションの中にリストされます。

![図４：キーチェーン・アクセス・アプリケーション](/images/app-signing/keychain-access-app.png){: .align-center}

このリストにある名称は証明書を調べるのに使われます。例えば、このスクリーンショットに描かれている証明書に使われている名前は、”Developer ID Application: 4D Inc (Q2R63U84YG)”です。

MSCでは修復できない大きな問題が発生した場合は、バックアップから復元した上でログを統合することで、データ・ファイルに対して行われた直近の変更までを復元することができます。

## MacOSでアプリに署名する方法
MacOSでは、取り込んだ4Dアプリケーションはビルド・アプリケーション・プロセスの中で署名できます。あるいは後からターミナル・アプリケーションから可能です。通常はビルド・アプリケーション・プロセスの中でアプリケーションに署名することが選択されますが、署名プロセスの間にエラーが発生した場合、プロセスを切り替えて、端末から署名を実行することが勧められます。その方がエラーの情報を多く得ることができるからです。。

### ビルド・アプリケーションの間に4Dからアプリケーションに署名するには
4Dのビルド・アプリケーション・ダイアログは、ビルドプロセスの間に開発者にコード署名のオプションを提供します。この機能はMacOSオペレーティングシステムでのみ可能です。このオプションはビルド・アプリケーション・ダイアログのLicenseタブの最後に表示されています：

![図５：ビルド・アプリケーション・ダイアログ](/images/app-signing/build-app.png){: .align-center}

4Dのビルド・アプリケーション・ダイアログは、ビルドプロセスの間に開発者にコード署名のオプションを提供します。この機能はMacOSオペレーティングシステムでのみ可能です。このオプションはビルド・アプリケーション・ダイアログのLicenseタブの最後に表示されています：
証明書の名称はAppleから提供される証明書の名称と一致していなければなりません。この名前はまたキーチェーン・アクセス・アプリケーションからも監視することができ、このドキュメントの「承認されたキーチェーン・アクセスを配置する」セクションのデモがあります。

#### エラーが発生した際の対処
問題が発生したら、ビルド・アプリ・ログの中にエラーが記録され、アプリケーションはディスティネーション・フォルダーには作られません。エラーメッセージは以下のようになるはずです：

![図６：コード署名に失敗しました](/images/app-signing/code-signature-failed.png){: .align-center}

ログの中のデータは次のようになります：

```
<Log>
 <MessageType>Error</MessageType>
 <Target>Application</Target>
 <CodeDesc>SIGNING FAILED</CodeDesc>
 <CodeId>38</CodeId>
 <Message>Code signature failed</Message>
</Log>
```

これを調査するには、開発者はコード署名オプションを不可にしてアプリケーションをリビルドしなければなりません。その後で端末からアプリケーションにコード署名を試みます。端末を使うことで、開発者は隠れているエラーメッセージを見ることができ、状況をよりよく理解し修正することができます。
以下のセクションの概要は端末からアプリケーションに署名する方法についてです。

### 端末からアプリケーションに署名する
時には端末から手動で署名プロセスを実行するのも有効です。ビルトイン・メカニズムにエラーが発生した場合は、これは重要なステップですが、署名プロセスがいかに作用しているかをより理解したい開発者にとっても有効なステップでもあります。どのようなケースであっても、このセクションでは端末からmacOSアプリケーションに署名する手動プロセスをカバーしています。
4Dによって署名に使用される一般的なシンタックスは：

```
codesign -s "${nameCertificat}" -fvvv "${PathSign}"
```
もしアプリケーションが”path/to/myBuiltApp.app/”に保存されていて、開発者が”Devloper ID Application: xyz (123)”という名称で署名を使って認証する場合、コマンドシンタックスは以下のようになります：

```
codesign -s "Developer ID Application: xyz (123)"" -fvvv
/path/to/myBuiltApp.app/
```

これを行うことで、発生していた隠れたエラーを露見させる役に立ちます。
見つけられる起こり得るエラーは：

　・　_./myBuiltApp.app: リソースフォーク、ファインダー情報、あるいは類似した残骸は不可
　・　_./myBuiltApp.app: 198秒ごとに異なるタイムスタンプ　- システムクロックをチェック
　・　_Developer ID Application: xyz (123): 不明瞭 (matches "Developer ID Application: xyz (123)" and "Developer ID Installer: xyz (123)" in /Users/username/Library/Keychains/login.keychain-db) 
　・　_Xcode/iOSライセンスに同意するには管理者権限が必要です。 “sudo xcodebuild -license”を作動してこのコマンドを再度試してください。

上記の各エラーは異なるソリューションが必要です。一度4Dの外でエラーに対処すれば、4Dの中でもう一度ビルド/署名を実行しても安全です。

## Windowsでアプリに署名する方法
Windowsでは、取り込まれた4Dアプリケーションは4Dの外で署名されなければなりません。（MacOSとは異なり）署名を伴うビルトイン・メカニズムがないからです。
以下のセクションの概要は、Windowsでアプリケーションに署名するプロセスです。このセクションの例題はデータポイントを使っています。このドキュメントの最初で、署名付き証明書を作成する時にちょっと出てきた例題で、それらのデータポイントは：
  証明書の場所：C＼signing＼cert.pfx
  証明書のパスワード：thePassword

しかし、もし開発者が上記のリストとは異なるデータポイントを使っている場合、代わりの正しい情報が必要です。

### 署名のインストール (Windows SDK)
Windows上でアプリケーションに署名するには、署名ツール・アプリケーションがすでにインストールされていることが必要です。この署名ツール・アプリケーションは、Windows SDKの一部で、以下のURLにあるマイクロソフトのウェブサイトから無料で利用できます。
http://go.microsoft.com/fwlink/p/?linkid=84091

一回インストールすれば、署名ツールはコマンド・プロンプト・ウィンドウから使えます。

### コマンド・プロンプトからアプリケーションに署名する
以下のコマンドはアプリケーションに署名するのに使用されます：

```
"C:＼Program Files (x86)＼Windows Kits＼10＼bin＼x64＼SignTool" sign /debug /f
c:＼signing＼cert.pfx /p thePassword /a C:＼Path＼to＼MyBuiltServer.exe
```
署名が成功した場合、アウトプットは以下のようになります：

```
The following certificates were considered:
    Issued to: 4D
    Issued by: 4D
    SHA1 hash: A6B2B0B3FECC6E4ELA3B562118F18BC82B63F304

The following additional certificates will be attached:
Done Adding Additional Store
Successfully signed: MyBuiltServer.exe

Number of files successfully Signed: 1
Number of warning: 0
Number of errors: 0
```
上記のアウトプットから1つだけ成功した署名ファイルがあることが分かります。
Exeファイルのファイル・プロパティを見ると、電子署名タブに署名の情報とアプリケーションに署名した会社の情報が表示されます。

### 既存の署名の削除
アプリケーションに既存の署名がある場合は、アプリケーション署名は失敗します。開発者は署名の前に、まず既存の署名を削除しなければなりません。

V16.4/v17.0以上であれば、内部ではdelcertというツールがビルド中に既存の署名を削除するのに使用されます。これによって、未署名のアプリケーションで、開発者によって署名が追加される状態のビルド・アプリケーションが作成されます。

V15以前では、4D Serverがマージしたアプリケーションのビルド時に署名されると、開発者は手動で署名の前に署名を削除する必要があります。

既存の署名を削除するには、オープンソース・アプリケーションの’delcert’が有用です。このアプリはXDAフォーラムから入手できます。

## 終わりに

このテクニカルノートでは、WindowsとMacOS双方のアプリケーションにコード署名する一般的なコンセプトを記述しました。二つのコード署名テクニックがあり、比較しています。開発者は複数の長所と短所を熟考すべきです。こうした情報は、4D開発者にとってMacOSとWindowsにとって必要な知識です。

### 注意点と外部リソース
この情報は、Windowsで自分で署名した証明書を作成するためのもので、マイクロソフトのウェブサイトの下記サイトで最新の情報に更新されています：
https://docs.microsoft.com/en-us/windows/uwp/packaging/create-certificate-package-signing


