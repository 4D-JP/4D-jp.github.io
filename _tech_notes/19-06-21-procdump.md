---
layout: technote
original_title: Tool ProcDump
title: "ProcDumpツールの使い方"
author: Hassan Boulmarouf, Ayoub Chakri
position: 4D SAS
date: 2013-02-01 00:00:00
categories: セットアップ
tags: deployment dump
version: procdumpinterface v4
---

ProcDumpInterfaceの利用方法の紹介です。([原文](https://taow.4d.com/Outil-ProcDump/PS.22410189.en.html#)）
<!--more-->

## はじめに
---
"ProcDumpInterface.exe"は"ProcDump"とユーザーの間のインターフェイスで、MicrosoftのProcDump.exeツールを使いやすくするものです。監視のためにアプリケーションをプロファイルするのにも使えます。

"ProcDumpInterface.exe"ツールは、Attachmentsセクションの第二タブの下の左列でダウンロードできます。使用する4Dのバージョンに対応した最新のバージョンをダウンロードすることを勧めます。

"ProcDump.exe"はユーティリティーツールで、アプリケーションがクラッシュもしくはフリーズしたときにダンプファイルを生成します。

"ProcDump.exe"は"ProcdumpInterface.exe"ツールと共にパッケージされたダウンロードに含まれていますが、アップデートされたバージョンは下記のサイトからダウンロードできます。
[`http://technet.microsoft.com/en-us/sysinternals/dd996900.aspx`](http://technet.microsoft.com/en-us/sysinternals/dd996900.aspx)

"ProcDump.exe"は"ProcDumpInterface.exe"と同じディレクトリーに置かないといけません。
 
## "ProcDumpInterface"アプリケーションのインターフェイス
---
![図1：画面1](/images/Dump/ProcDump-1.png){: .align-center}
![図2：画面2](/images/Dump/ProcDump-2.png){: .align-center}


## 使い方
---

(1) ボタンで"ProcDump"がモニターするアプリケーションを指定。

(2) ボタンでダンプファイルを生成するディレクトリーを指定。

(3) "procdump.exe"のパス。初期設定では"procdumpInterface.exe"と同じパス。

(4) スライダーでダンプファイルに入れる情報の量を設定。

(5) チェックボックス - モニターしたアプリケーションがクラッシュしている間にダンプファイルを生成。

(6) チェックボックス - モニターしたアプリケーションが指定した時間中に反応しない場合にダンプを生成する。

(7) ボタンでモニタリングセッションを開始/停止する。

(8) ボタンですぐにダンプを生成する。

(9) ボタンでプロファイラーを開始する

(10) ボタンで"procdumpInterface.exe"アプリケーションを閉じる。

(11) ダイアログでアプリケーションがシンボルをダウンロードしていることを表示。

(12) ダイアログでプロファイラーを管理する小さなコントローラーを表示。

(13) ボタンでプロファイラーを一時停止/停止。

(14) ボランでプロファイルを有効にして"4D.sleepy"ファイルを生成する。

(15) ボタンでプロファイルを中止する。


## モニタリングセッションを停止
---
例外的なモニタリングセッションで、"ProcDump"はDOSウィンドウで起動します。

![図3：画面3](/images/Dump/4D-dumps-3.png){: .align-center}

モニタリングセッションを止めるには、DOSウィンドウでCtrl+Cの組み合わせを使います。もしくは、DOSウィンドウを閉じると監視しているアプリケーションも閉じます。

ハングアップしたセッションのモニタリングは、"Stop"ボタンで止められます。止めると"Start"ボタンに置き換わります。

## 設定
---

### シンボルサーバー
"ProcdumpInterface.exe"は二つのシンボルサーバーを使って必要なPDBをダウンロードします。両方のサーバーのURLは"ProcdumpInterface.ini"ファイルに保存されます。

  ```
  注意：このファイル("ProcdumpInterface.ini")は最初に"procdumpInterface.exe"を起動した後で自動的に生成されます。
  ```
![図4：画面4](/images/Dump/4D-dumps-4.png){: .align-center}

(16) "MicrosoftSymbolServerLocation"：このパラメータにはマイクロソフトのシンボルサーバーのURLが含まれています。(http://msdl.microsoft.com/download/symbols)

(17) "ProgramSumbolServerLocation"：このパラメータにはプロファイル用にアプリケーションのシンボルサーバーのURLが含まれています。初期設定では4DシンボルサーバーのURLです。("＼＼srv-4d＼SYMBOLES")

### 他の設定

他の設定は"ProcdumpInterface.exe"で変更可能ですが、以下は例外です：

![図5：画面5](/images/Dump/4D-dumps-5.png){: .align-center}

(18) "CacheDirLocation"：ダウンロードファイルのパスを指定。初期設定では"procdumpInterface.exe"を含むフォルダー。

(19) "useSymServer"：このパラメータは0か1です。アプリケーションがシンボルサーバーを使っているかいないかを示しています。

(20) "DowmloadSymbols"：このパラメータも0か1です。1の場合は、アプリケーションがシンボルファイルをダウンロードします。0の場合は何もしません。

## プロファイリング手順
---
### プロファイラーを開始する（ボタン9）
ボタン9"Launch profiler"をクリック。アプリケーションは欠けているシンボルをダウンロードし始め、まだ存在しない場合はキャッシュ・フォルダに入れます。

ダイアログ(11)がダウンロードの完了まで表示されます。
ダウンロードが完了すると、ダイアログ(11)が閉じられ、プロファイルコンローラー(12)が表示されてプロファイルを一時停止、中止、有効にできます。

### プロファイルを一時停止（ボタン13)
ボタン13"Pause"をクリックしてプロファイリングを一時停止します。ボタンラベルが"Resume"になります。

### プロファイリングの再開（ボタン13)
"Resume"ボタンをクリックするだけです。

### プロファイリングの中止（ボタン15）
"Cancel"をクリックするとファイルを生成せずにプロファイリングを中止します。

### プロファイルを有効にする（プロファイリングファイルを生成する）（ボタン14）
"OK"ボタンをクリックするとプロファイラーは".4pf"拡張子のついてファイルを生成します。この時のパスは"Output path"(2)で指定されたパスを使います。生成されたファイルはプロファイルあるいはモニターしたアプリケーションについての最初の情報として役立ちます。

## 保留された機能
---
 - セッションを作ってアプリケーションのハングアップやクラッシュを監視する。
 - 例外的なモニタリングセッションを、"Stop"ボタンを使って止める。DOSウィンドウのCtrl+Cは使わない。
 - モニタリングセッションの間にすぐにダンプを生成することを可能にする。
 - "Launch profiler"をクリックしたときに、"procdumpInterface.exe"が二回起動することがないようにプロファイル対象のアプリケーションを確認する。
 
 ## このドキュメントで使用されたキーワード
---
![図6：画面6](/images/Dump/4D-dumps-6.png){: .align-center} 
