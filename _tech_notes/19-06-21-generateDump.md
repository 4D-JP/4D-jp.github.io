---
layout: technote
original_title: Generate a Dump
title: "ダンプファイルの生成方法について"
author: Stephanie Tirtiat, Cedric Gareau, Ilham Aba
position: 4D SAS
date: 2019-06-21 00:00:00
categories: セットアップ
tags: deployment dump
version: 11 -17
---

ダンプファイルを利用する理由と方法の紹介です。([原文](https://taow.4d.com/Generate-a-Dump/PS.1938114.en.html#)）
<!--more-->

## はじめに
---
ダンプファイルは、あとでデバッグするためのアプリケーションについて情報を記録するためのものです。4Dの場合、これらのファイルは技術部門で分析され、ダンプファイルから情報を解析して問題（4Dのクラッシュやフリーズ）の原因を突き止めることができます。

```
注記：
 - ダンプファイルはWindowsの下でのみ生成することができます。
 - 4D v11 SQL以降でのみ可能です。
```
 
## ダンプファイルの生成はいつ使うのか？
---
データベースが、論理的ではなく、ランダムにクラッシュする；　デバッグした時やデータベースを縮小した際に、クラッシュの原因が掴めない；という場合に、問題の原因に特化した有益な情報を提供してくれます。

もしクラッシュが、データベースの中でサンプルコードを使って通常の方法論に固執しても、簡単にシステマティックに再現するなら：サンプルコードやテストデータベース（可能ならば最小限のコードに省略されているもの）を付けたバグ・レポートを送ってください。クラッシュしたコードは、このケースではすでに見つかっているので、ダンプファイルは不要です。

## 4Dアプリケーションのクラッシュ
---
4Dアプリケーションがクラッシュした場合は、二つのWindowsエラーが得られます：


### 4D-Dumps

最初のケース：Windowsのダイアログ「4D Serverが止まりました」を表示

![図1：停止通告画面](/images/Dump/4D-dumps-1.png){: .align-center}

このケースでは、Windowsは最初から自動的にダンプファイルを生成します。（"4D.exe.dmp"あるいは"4D Server.exe.dmp")

生成されたダンプファイルは分析のためテクニカルサポートへ送られます；使用したバージョンのビルド番号を特定するのを忘れないでください。（例えば使用しているバージョンが"11.4.0.63572"であれば、ビルド番号は"63572"）

```
注記：もしアプリケーションがシステム・ディレクトリ（例："Programs"）の中にあり、ユーザーアカウントコントロール (UAC)が
有効の場合、ダンプファイルは作成されません。だからこそ、UACを無効にすることや、管理者権限で4Dアプリケーションを動かす
ことが重要です。（4Dアプリケーションで右クリックして「管理者として実行」を選択します。）
```

### MS-Dumps

DOSコマンドラインからダンプファイルを生成する

下記はDOSコマンドラインを使ってダンプファイルを生成する方法をカスタマーに提供しています：

  (1) このアプリケーションの最新バージョンをダウンロードしてインストールします：
    - 4Dアプリケーションが32ビットアプリケーションの場合：Windowsの32ビット版向けデバッギングツール（64ビットシステムを使っていたとしても32ビット番をインストールします）。
    - 4Dアプリケーションが64ビットアプリケーションの場合：Windowsの64ビット版向けデバッギングツール。
 
  (2) アプリケーションをインストールするフォルダーの場所を記録します（例：C:＼Program Files＼Debugging Tools for Windows (x86)）。
  
  (3) タスクマネージャーを開きます。
  
  (4) 2番目のタブを選択："Process"。
  
  (5) メニューの"Display"へ行き、"Choose columns..."を選択。
  
  (6) "PID" (Identifier of Process)をチェックして"OK"をクリック。
  
  (7) 4D Pocessを選択してそのPIDを記録。
  
  (8) DOSコマンドラインを開く (start -> execute -> cmd -> Open)。
  
  (9) アプリケーションをインストールしたフォルダーへ移動（例：C:＼Program Files＼Debugging Tools for Windows (x86)）。
  
  (10) 以下のように記述してPIDと4DプロセスのPIDを入れ替えます：
    ntsde-pvr-p PID -c".dump/mFhutip/u c:＼Dump4D.dmp;q"（最初にルートレベルへ書き込みができる権限があることを確認し、もしなければ次のようにパスを選択します　"C:＼Documents and Settings＼{user}＼Desktop＼Dump4D.dmp"）。
  
  (11) Cドライブのルートにダンプファイルが生成されます（この例では：対象となるフォルダーを選べます）。生成した日時は自動的に"Dump4D.dmp"ファイルの名前に追加されます。
  
  (12) 生成されらダンプファイルを4Dテクニカル・サポートへ送り分析します。使用している4Dバージョンの正確なビルド番号を特定します。（例えば、使用しているバージョンが"11.4.0.63572"であれば、ビルド番号は"63572"です。）もし使用しているバージョンが"11.4.65.589" (v11.4 Hotfix6)であれば、ビルド番号は"65589"として認識されます。
  
  ```
  重要：
  特定のフォルダーに読み込み/書き込みの権利があることを確認してください。（例えばVistaでは、ユーザー・コントロールが
  可能であれば、システムドライブのルートに書き込むことはできません。）
  ```
    

## Procdumpアプリケーションを使ってダンプファイルを生成
---
アプリケーションを入手してプロセスに従ってください。
ダウンロード先：[`http://taow.4d.com/Outil-ProDump/PS.22410189.fr.html`](http://taow.4d.com/Outil-ProDump/PS.22410189.fr.html)
