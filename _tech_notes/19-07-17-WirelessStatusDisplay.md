---
layout: technote
original_title: Inexpensive Wireless Status Display solution with 4D
title: ワイヤレス・ステータス・ディスプレイ・ソリューション
author: Vance Vilanueva
position: Technical Services Engineer, 4D Inc.
date: 2019-07-17 00:00:00
categories: セットアップ
tags: deployment display 
version: 17
---

安価で、4Dの運用に関するステータスを表示するソリューションの紹介です。([原文](https://kb.4d.com/assetid=77888)）
<!--more-->

## 要約
---
ハードウェアのコンポーネントが安価になっているので、オンサイトで4Dを運用するためのステータスを表示する情報ソリューションを提供する機会も必要となっています。メモリやハードディスクの愛容量、障害エラー、ネットワーク接続、アップタイム、バックアップステータスなどのステータス情報を、コンパクトなワイヤレスディスプレイシステムに統合できます。このすぐに利用可能なデータは、エンドユーザーが状況を報告するのに役立つだけでなく、マシンにアクセスする必要性を減らすことができます。このコンセプトは現在の製品に付加価値をもたらすハードウェアの側面と、4Dで実現可能なことを実現します。このテクニカルノートでは、4Dデータベースと簡単に通信できる安価なワイヤレスディスプレイソリューションについて説明します。

## はじめに
---
4Dはビジネスアプリケーションを作成する開発ツールです。多くの4D開発者がアプリケーションの開発に成功し、パースペクティブ・マーケットで運用しています。アプリケーションのフォーマットでデータを表示することからWebページにロードすることまで、純粋にソフトウェアによって開発されます。でも、そこで疑問です。4Dは単独でソフトウェアアプリケーションとして動くのか？4Dとハードウェアデバイスと4Dの作用は？このテクニカルノートは、ハードウェアとコミュニケートできる新しい光をもたらします。4DのWebサーバーは、コンピュータ/ラップトップ、モバイルデバイスなど、ウェブブラウザーを持つ典型的なクライアントからHTTPリクエストを受けることができます。しし、マイクロコントローラーのようなハードウェアは、同じHTTPリクエストを生成できるクライアントに限定されません。HTTPクライアントを装うハードウェアデバイスと通信する4Dの機能や他の可能性を開くことができます。この文書では、4Dと通信してデータをLCDに表示するワイヤレスハードウェアシステムの構築方法について説明します。

## 概要
---
このテクニカルノートの目的は、4DのWebサーバーがラップトップ、コンピュータやモバイルデバイスではなく、マイクロコントローラーを使用してデバイスと通信する「箱の外側」アプローチを示すことです。しかし、これの何が本当に新しいのでしょうか？コンピュータ、ラップトップ、およびモバイルデバイスは、ブラウザー経由で4DのWebサーバーと通信したり、HTTPリクエストを通して4Dコマンドと通信したりできます。これはマイクロコントローラーを使った場合とどう違いますか？
マイクロコントローラーがあれば、何も変わりません！通信手段としてHTTPリクエストを実行します。

### マイクロコントローラーとは？
一つの統合された集積回路上にある小さなコンピュータです。本質的にはチップの上のシステムで、一つの仕事を実行することに特化し、特定のアプリケーションを実行します。

### なぜマイクロコントローラーを使うのか？
コンピュータ、ラップトップ、モバイルデバイスは、たくさんの仕事をこなすために、高いキャパシティで操作するように設計されています。最小限のタスクだけを実行するマシンを専用にするのは行き過ぎです。マイクロコントローラーは、最小限のタスクを実行できるソリューションです。ここでは、マイクロコントローラーを使用する場合の利点と欠点について説明します。

#### マイクロコントローラーを使う利点
- 安価で購入できる。
- 他のハードウェアデバイスとインターフェイス可能。
- ループ中の特定のタスクにフォーカスする。
- 低電力の消費で利用。
-	省スペースパソコン (SFF) 設計。
-	異なるアプリケーションに実装方法が多数。

#### マイクロコントローラーを使う短所
-	システムをビルドするためのハードウェアの設計。
-	操作するためにプログラミングが必要。
-	大量に組み合わせるために作業が必要。

#### 利用例
マイクロコントローラーは多くのアプリケーションでどこにでも使われています。以下の例で実行されている操作には本格的なコンピュータは必要ないことに気づいていない人もいるでしょう。

- カー・アラームシステム
- ホーム・アラームシステム
- 音を出したり動いたりする動物の玩具
- 不定期のグリーティングカード
- 建物に入るためのRFIDカードリーダー
- 手持ちのバーコードスキャナー

それぞれのシステムが必要とする程度によりますが、マイクロコントローラーは、同じ作業を実行するためにオペレーティングシステムを起動するコンピュータを使うことなく、上記の例の作業を行う重要な役割を担っています。

#### 周辺機器とのインターフェイス
マイクロコントローラーはハードウェアデバイスなので、他のハードウェアデバイスと接続する機能も備えています。ひとつのアイデアとして、以下のリストのように接続できます：

- センサー – 温度、動作の検出、速度など。
- ディスプレイ – LCD（液晶ディスプレイ）とLED（発光ダイオード）スクリーン。
- インジケーター – スピーカー、アラーム、振動機器など。
- デバイス – キーボード、マウス、プリンター、スキャナー、モデムなど。

すでにあるものの概要ですので、デザインの可能性は無限です。

マイクロコントローラーは多くのものとつなぐことができるので、4Dともつなぐことができます。前述のように、4DのWebサーバーは、Webブラウザーや4Dコマンド呼び出し、またはHTTPプロトコルを生成/模倣できるデバイスを介して、クライアントからHTTPリクエストを受けることができます。マイクロコントローラーだけあれば可能です。

### 4D Webサーバーが重要

デバイスからWebリクエストがあった時、4D Webサーバーはそれらを様々な方法で扱えます。例えば下記のリクエストを4D Webサーバーへ送ることができます：
	
- CRUD – Get, Post, Put, Delete
- Soap – XMLパッケージで作られたCall
- Rest – JSONとして返されるCall
- FTP – 転送されるファイル
- 4D Method – 4Dメソッドで作られるURLリクエスト

このドキュメントでは、4Dデータベースからどのデータを送信するかについて慣れた形でプログラムできる4Dメソッドを利用することに焦点を当てています。

#### 4Dメソッド
サンプルでhttp://<serverIP>/yourMethod としてリクエストが作成された時、4D Web Serverは”yourmethod”メソッドにアクセスでき、クライアントに送り返します。この4Dへのエントリーポイントは、マイクロコントローラーを使ったソリューションが可能なところへデータを送り返すことができます。次のセクションでは、4Dとマイクロコントローラーが通信できるように何かを組み立てるシンプルなソリューションについて話します。

### ワイヤレス・ディスプレイ・ソリューション
説明を簡単にするために、このソリューションはマイクロコントローラーと、4D Web Serverが通信できるLCDとの接続の基本的な紹介を意図しています。既存の、あるいは新しい4Dデータベースがあったとしても、このソリューションはアドオンです。以下はワイヤレス・ディスプレイ・ソリューションの概要です：

![図 1 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-1.png){: .align-center}


### マイクロコントローラーを選択する
簡単なものから複雑なものまで、多くのマイクロコントローラーがあります。また、より多くのタスクができるものは、それだけ高価になります。以下は参考までに一般的なマイクロコントローラーの分析結果です：

![図 2 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-2.png){: .align-center}

ワイヤレス・ディスプレイ・ソリューションは、マイクロコントローラーで使えるワイヤレス・ネットワーク(WIFI)機能付きのLCDスクリーンが必要です。LCDスクリーンで、マイクロコントローラーと通信する方法は12Cを通すことです。12Cについてはこのドキュメントの後の部分で説明しています。このアプローチで、それぞれの間のたくさんのワイヤとのはんだ付けや接続の作業が減ります。そしてマイクロコントローラーは4D Web Serverと通信しなければならないので、ネットワーク通信が必要です。そのため、マイクロコントローラー内にWIFIを持っていれば、接続のためのWIFIモジュールを設計する必要が減ります。

### Raspberry PI
Raspberry PIは、これまでのところリストの中で最も高いものです。それにはインターフェイスのオプションが多く含まれていて、すぐに仕事ができます。Raspberry PIで一番安いバージョンでも仕事はできますが、需要が多く在庫が不足していて見つけるのは難しいのです。

### Teensy
この特別なマイクロコントローラーは、作業はできますが、WIFIモジュールの接続が必要です。

この特別なマイクロコントローラーは,作業はできますが、WIFIモジュールの接続が必要です。
### WeMos（Arduinoコンパチブル）
Arduinosはとてもよく使われているデバイスです。選択できる異なるボードタイプがたくさんありますが、シンプルさの点では、このタイプはこれまでで最も安く、LCDの表示ができWIFI経由で4D Web Serverと通信ができます。

次の章では、ワイヤレス・ディスプレイ・ソリューションに使われるLCDについて話します。

## LCD
コンピュータとモバイルデイバイスにとって、ディスプレイは実際に何がシステムに起こっているのかを知るのに必要です。例えばコンピュータに接続しているモニターは、起動からシャットダウンまでの間、リアルタイムの状況を正確に見せてくれます。同様に、多くのマイクロコントローラーは、LCD（液晶ディフプレイ）に接続して、実行状況の状態を見せてくれます。

### LCDとは？
電流によって活性化する液晶で構成されています。多くの場合、英数字の情報を一行、あるいは複数行、表示するのに使われます。以下の二つの画像は二つのLCDディスプレイが32文字(16x2)と80文字(20x4)を表示しています。

![図 3 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-3.png){: .align-center}

マイクロコントローラーから情報を検索するには、プログラマーが表示するものをコントロールします。

### 配線をつなぐ
典型的な例では、上記のLCDは16ピン-アウト接続でマイクロコントローラーと接続しています。たくさんのワイヤを使った複雑な接続を避けるために、前述のLCDとの接続方法はI2Cシリアルプロトコルを経由し、4本のワイヤしか必要ありません。I2CモジュールはLCDの16ピン-アウトを4ピンに減らした基盤につながります。

![図 4 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-4.png){: .align-center}

マイクロコントローラー間の通信の内部的な動きは、実装セクションで説明します。

このドキュメントは、4D Webサーバーを組み込むワイヤレス・ステータス・ディスプレイ・ソリューションの構築の実装を説明するものであることを覚えておいてください。内容の大部分は4D Webサーバーと接続するように導くハードウェア部分の説明です。これは4Dで動作できる新しい道筋をデモするためのものです。実装部分を説明した後は、サンプルの4Dデータベースを提供して、ワイヤレス・ステータス・ディスプレイ・ソリューションを使った事例を体験します。

# 実装
---
この実装のコンセプトは、基礎からワイヤレス・ステータス・ディスプレイ・ソリューションの構築を理解することです。マイクロコントローラーとツールは、LCDと接続したりプログラミングする環境を設定するために説明されています。この章の大部分は、4D Webサーバーと通信するための、ワイヤレス・ステータス・ディスプレイ・ソリューションのハードウェア部分の設計と開発をカバーしています。

## ワイヤレス・ステータス・ディスプレイ・ソリューション
前の章でのマイクロコントローラーの選択は、コストの削減と最小機能の維持を目指していました。したがって、Arduino マイクロコントローラーを選択することはもっともなソリューションです。初心者には、このマイクロコントローラーは出発点として良いもので、学習期間を短縮できてコードを理解しやすいのです。この選択に対して、ArduinoファミリーのWeMos ESP8266は、状況をレポートするためのLCDとの通信が簡単にできます。ワイヤリングとコードの支障は、この章で説明しています。一度ワイヤレス・ステータス・ディスプレイ・ソリューションを合体すれば、4D Webサーバーと通信が可能です。

## 部品リスト
ワイヤレス・ステータス・ディスプレイ・ソリューションを始めるためには、ソリューションを構築するのに以下の部品が必要です。ハンダ付けが必要であることに注意してください。以下のリファレンスにある「部品」を参照して：

- Arduino WeMos ESP8266キット（ハンダ付けのためのソケットとヘッダーを含む）
- LCD 20x4 (I2C)もしくはLCD 16x2 (I2C)
- レベル・シフター回路
- 実験用回路版とジャンパー（試作品のテスト）
- 電源5ボルト直流
- マイクロUSBケーブル

## Arduino WeMos ESP8266
この16ピンのマイクロコントローラーには、I2Cプロトコルを使ったLCDに通信するためのWIFIとデータラインが含まれています。このセクションはWeMos ESP8266の初期の設定のその先を説明します。

![図 5 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-5.png){: .align-center}

### 始めるにあたり
Arduinoを使って開発するには、統合開発環境”IDE”が必要です。開発者がソフトウェアを書いたりテストしたりするのに必要な、基本的なツールを統合しています。そこにはコードエディターやコンパイラー、インタープリタ、そして開発者がシングル・グラフィカル・ユーザーインターフェイスを経由してアクセスできるデバッガーも含まれます。以下のリファレンスは、”Audino IDE”のダウンロード場所について書かれています。このドキュメントでは、現状のIDEは以下のように示されます：

![図 6 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-6.png){: .align-center}

### WeMos ESP8266とコンピュータを接続
WeMos ESP8266はマイクロUSBでコンピュータ(Mac or Windows)に接続します。以下の写真にあるようなデータと電力のケーブルです。このUSBケーブルはボードの電力を供給します。後の章で述べていますが、このケーブルを使用しない場合は、独立した電力源が必要です。

![図 7 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-7.png){: .align-center}

WeMos ESP8266をコンピュータに接続すると、通信のためのドライバーが必要となります。通常は、OSは自動的にマイクロコントローラーのドライバーを見つけることはできません。ネイティブではないからです。WeMos ESP8266のドライバーチップは”CH340G”で、”CH340G drivers”の下のリファレンスリンクにあります。インストールした時に、以下のように見えるはずです（Windows – 右、Mac – 左）：

![図 8 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-8.png){: .align-center}

### Arduino IDEを設定

IDEソフトウェアをインストールしても、開発されたファームウェアを更新するためのWeMos ESP8266ライブラリーは含まれません。この章の手順は、ライブラリーを正しくインストールするためのガイドです。

### WeMos ESP8266ボードライブラリーURL
追加するWeMos ESP8266ボードライブラリーの場所を”Preferences”に設定します。

![図 9 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-9.png){: .align-center}

以下のURLは緑で囲った”Additional Boards Manager URLs”に入力します：
http://arduino.esp8266.com/stable/package_esp8266com_index.json

#### WeMos ESP8266ボードのインストール
ボードURLを”Preferences”に設定したとき、ボードは”Boards Manager”にインストールすることができます。緑で囲った”Install”ボタンをクリックします。

![図 10 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-10.png){: .align-center}

#### WebMos ESP8266ボードの選択
WeMoss ESP8266ボードをインストールすると、”WeMos D1 R2 & mini“を選択できます。

![図 11 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-11.png){: .align-center}

#### WeMos ESP8266 アップロードスピードとポートを設定
以下はWeMos ESP8266をプログラムするためのアップロードスピードとポートの設定です（Windows – 右、Mac – 左）。

![図 12 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-12.png){: .align-center}

#### WeMos ESP8266をプログラミング
Arduino IDEコードエディターは以下のようになります。

![図 13 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-13.png){: .align-center}

本質的にWeMos ESP8266をプログラムするには”Upload”を選択します。プログラムはマイクロコントローラーのフラッシュにアップロードされます。これは必要なだけ何回でも書き直せます。

![図 14 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-14.png){: .align-center}

この章では、プログラミングを開始するためのWeMos ESP8266ライブラリーとArduino IDEの設定をカバーしました。次の章では、WeMos ESP8266とLCD通信プロトコルについて話をします。

## LCD
WeMos ESP8266がデータを送ってLCDに表示する場合には、様々なインターフェイスで送ることができます。上記のように、I2Cプロトコルを使うのは簡単で、WeMosとLCD間のインターフェイスを複雑に書く必要はありません。

### I2Cプロトコル
マスター/スレイブ・シリアル・バス・プロトコルは、低速デバイス（スレイブ）をマスターデバイスに接続するために、二本のワイヤ・インターフェイスが必要です。以下は、シリアルクロック(SCL)行に同期している間に、シリアルデータ(SDA)として通信が一行使うバスシステムです。

![図 15 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-15.png){: .align-center}

各スレイブは独自のアドレスを持っています。トランスミッションは一度に8ビット（１バイト）です。例えば、もしもASCII文字がバスラインに送られたら、以下のようにバイナリービットとして表示されます：

![図 16 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-16.png){: .align-center}

LCDはWeMos ESP8266に対してスレイブデバイスになります。データが転送されたとき、マスターは”SDA”ラインによって”S”を使ったトランスミッションを開始します。”B1”は、”B2”から”BN”までのデータがフォローするスレイブデバイスのアドレスです。マスターがトランスミッションを受け終えたとき、”P”で終了し、バスの中の他のデバイスが通信することができます。下記のダイアグラムはスレイブデバイスごとの各トランスミッションのプロセスです。

![図 17 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-17.png){: .align-center}

I2Cプロトコルについてさらに詳しい情報は、以下の”I2C”リファレンスを参照してください。上記のダイアグラムのデータは、シグナルが離散している、つまり高いシグナルは”1”で低いシグナルは”0”である、と仮定しています。通常、マイクロコントローラーは3.3ボルトあるいは5ボルトで操作できます。WeMos ESP8266に対するデータシグナルは、3.3ボルトを使います。3.3ボルトは高いシグナルで0ボルトは低いシグナルと考えられます。他方LCDは、5ボルトシステムです。3.3ボルトのシグナルは、高いシグナルとしては転送されないでしょう。以下は5ボルトシステムの図です。

![図 18 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-18.png){: .align-center}

これはレベルシフター回路がアシスタントとして入っています。

### レベルシフター
この回路は、ロジックレベルシグナルを適正なボルテージリファレンスにブーストするように設計されています。SDAとSCLKのデータシグナルと一緒にボルテージリファレンスを追加することにより、シグナルの高低を区分けするに必要なボルテージスレッショルドにブーストすることができます。回路は下記のように見えます：

![図 19 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-19.png){: .align-center}

例えば、”LV1”と”LV2”はWeMos ESP8266からのSDAとSCLKのインプットシグナルになります。回路のアウトプットはLCDのSDAとSCLKへの”HV1”と”HV2”です。このケースでの”LV”はWeMos ESP8266からの3.3ボルトになり、”HV”は5ボルトに接続します。接続時に、シグナルロジックは下記のようになります：

![図 20 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-20.png){: .align-center}

以下のリファレンスに”ロジックレベル”のさらなる情報が詳述されています。次の章では、WeMos ESP8266とレベルシフター回路、LCDの間でのインターフェイスの合体について議論します。

## LCDのインターフェイス
WeMos ESP8266は、下記に示した５つのワイヤが必要です。レベルシフター回路と接続していて、それはLCDに接続しています。

![図 21 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-21.png){: .align-center}

実際の接続の写真

![図 22 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-22.png){: .align-center}

ワイヤが接続したとき、LCDはソフトウェア経由でコントロールするためにArduino IDE内のライブラリーが必要です。

## ArduinoへLCDライブラリーを追加する
WeMos ESP8266 に対するLCDライブラリーはLCDにデータを送ることが必要です。下記のリファレンスの中で”LCD library for Arduino WeMos ESP8266”として配置されています。

![図 23 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-23.png){: .align-center}

この章ではWeMos ESP8266へのLCDの設定と接続を述べました。次の章は電力オプションについてカバーします。

## WeMos ESP8266の電力オプション
WeMos ESP8266の設定の始まりでは、電力源はコンピュータから5ボルトを供給されるUSBケーブルを使っていました。下記のようなアダプターでも同じように供給されました。

![図 24 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-24.png){: .align-center}

別のオプションは、ワイヤをハンダ付けして、以下の図の緑の部分のように5ボルトの電源アダプターからボードに接続することができます。

![図 25 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-25.png){: .align-center}

## ワイヤアレス・ステイタス・ディスプレイ・ソリューションを囲む
最初に、プロトタイプようにワイヤを接続するとき、ブロードボードセットアップを通して以下のように見えるでしょう：

![図 26 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-26.png){: .align-center}

筐体やケースは理想的なアプローチですが、全てにフィットするぴったりなものを見つけることはできないかもしれません。様々な形状やサイズがあり、修正作業が必要かもしれません。下記はウェブで検索したものです：

![図 27 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-27.png){: .align-center}

他のオプションとしては、3Dプリンターを使ってカスタム筐体を作成する手段もあります。参考までに”Tinkercad”や”Thingiverse”のようなサイトは、”LCD 2004”や”LCD 1602”で検索すると、ダウンロードできる無料プランが含まれています。次の章ではWeMos ESP8266のコーディングについて議論します。

## コーディング
前述のArduino IDEコードエディターでは、スタート・テンプレートに”setup”と”loop”機能が下記のように含まれています。

![図 28 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-28.png){: .align-center}

Arduinoのコーディング言語はC/C++です。実行した時の起動は、”setup”機能の前のコードが指定されたライブラリーを呼び出し、それから”setup”を起動し、”loop”を無期限に実行します。

### ライブラリーの呼び出し
“setup”機能の前に、下記のようにArduino IDE ライブラリーの中で指定された場所にWIFI、LCD、I2Cのライブラリーを呼び出します。

```
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266HTTPClient.h>
#include <LiquidCrystal_I2C.h>
#include <Wire.h>

// For 16x2
LiquidCrystal_I2C lcd(0x3F,16,2); // Check I2C address of LCD, normally 0x27 or 0x3F

// OR

// For 20x4
LiquidCrystal_I2C lcd(0x3F,20,4); // Check I2C address of LCD, normally 0x27 or 0x3F
```

### Setup機能
“setup”機能には、初期化が必要なために一度だけ起動するコードが含まれています。ワイヤレス・ステイタス・ディスプレイ・ソリューションでは、LCDとWIFIを呼び出します。

#### LCD setup
“Wire.h”ライブラリーからI2Cを経由してLCDが接続します。D1 (SCL)とD2 (SDA)に固定されています。以下のコードはLCDの初期化です：

```
lcd.begin(4,5);    //In ESP8266-01, SDA=4, SCL=5
```

#### WIFI setup
アプリケーションのループに行く前に、接続のためのWIFI設定が必要です。以下のコードはWIFI機能を呼び出し、SSIDを検索し、ネットワークを認証します。

```
  WiFi.mode(WIFI_STA);
  WiFi.begin("SSID", "Password");

  while(WiFi.status() != WL_CONNECTED) {
// Some code to display in LCD while connecting
}
```

### ループ機能
“Loop”機能は、ファンクションコードの最初の行から最後の行までを実行して、それを繰り返すというコードが含まれています。以下は使用される幾つかの機能です：

- lcd.home() //LCDの行と列を0に設定
- lcd.setCursor(x,x) //LCDのカーソルを行と列の位置で設定
- lcd.print(“Some text”) //”lcd.setCursor”位置からLCDヘ印刷
- HTTPClient //HTTPストラクチャーを作成（例：HTTPClient http）
- http.begin // HTTP URLを作成
- http.get //HTTPでリクエストを受け取る
- http.getString  //HTTPでリクエストからストリングを受け取る
- payload.substring //リクエストされたストリングからデータを解凍
- http.end  //リクエストのエンド

#### 16x2 LCD表示へのプログラミング
このLCDは1行につき8列を含む２行として設定します。Lcd.setCursor(x,y)を使うときは、’x’には列の位置を、’y’には「行」を代入します。例えば、lcd.setCursor(0,0)はカーソルを0列の0行に設定します。

#### 20x4 LCD表示へのプログラミング
このLCDは1行につき20列を含む4行で設定されます。LCDの第３行にアクセスするには、lcd.setCursor(0,2)に設定し、第４行であればlcd.setCursor(0,3)にします。

LCDに対する特別な機能は、下記のレファレンスでは”Liquid Crystal”としてみることができます。下記は、サーバーからデータをリクエストしてLCDに表示するという”Loop”機能を使ったサンプルコードです：
```
delay (5000);

  lcd.home ( );           // At column=0, Row=0
  lcd.setCursor (0, 0););
  lcd.print (“Display. . .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
  
  HTTPClient http;
  http.begin (http://<serverIP>/4dAction/Get4DData);
  int httpCode = http.GET ( );

  if (httpCode > 0) {
     if (httpCode == HTTP CODE OK) {
        String payload = http.getString ( );
        String result = payload.substring (17,25);
        lcd.setCursor (8, 1);
        lcd.print (result);
        lcd.setCursor (0,0);
        lcd.print (“4D                 “);
      }
}f
else {

}
http.end ( );
```
この章内のコードは、WeMos ESP8266をコンパイルとアップロードした時に、4D Webサーバーへデータをリクエストするクライアントとして動きます。”<serverIP>”は4D WebサーバーIPアドレスを意味します。次の章では、4D Webサーバーにアクセスできる4Dのメソッドを作成することについて話します。 

## 4D Webサーバー
このドキュメントのほとんどは、4D Webサーバーのクライアントとして動作するハードウェアのインターフェイスとデザインを紹介してきました。下記のシンプルな例は、4D Webサーバーをアクティベートして、クライアントがアクセスできる4Dメソッドを作成するだけです。

### メソッドの作成
メソッドを作成するには、”4DタグとURL (4DACTION…)”属性が下図のプロパティの中でチェックされなければなりません：

![図 32 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-32.png){: .align-center}

下記はクライアントがアクセスできるサンプルコードです：
```
// Method: Get4DData
// ---------------------------------------------
C_OBJECT($obj)
C_TEXT($text)

// some code to put into $obj
WEB SEND TEXT (JSON stringify($obj))

// or
WEB SEND TEXT($text;"application/json")
```

次の章では実装演習の利用とサンプルデータベースへの組み込みの説明です。

# ワイヤレス・ステータス・ディスプレイ・ソリューションのサンプル
この章の目的は、WebサーバーとLCDで表示するデータを入力するフォームを含む、サンプルの4Dデータベースとともにワイヤレス・ステータス・ディスプレイ・ソリューションのデモを行うことです。デモは以下のように分かれます：

- 20x4 LCDを使ったデモ
- 16x2 LCDを使ったデモ
- LCDに手動でデータを入力するデモ

二つのLCDは、WeMos ESP8266と4Dメソッド双方に対するコーディング方法のアイデアを提供するためにデモをします。デモを起動するために、4D Webサーバーをポート80で開始する必要があります。以下はデモのために提供されている、WeMos ESP8266と4Dデータベースに対するソースコードです：

![図 33 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-33.png){: .align-center}

## 20x4 LCDを使ったデモ
前の章で提供されたWeMos ESP8266用のサンプルコードで、4D Webサーバーのクライアントとして機能するために必要な基礎を理解するためのものでした。このセクションでは、20x4 LCD用のフルコードを提示します。WeMos ESP8266は４Dメソッド”WemosData20x4”にアクセスします。

### WeMos ESP8266コード

このコードはWIFIの設定をデモします。”WemosData20x4”メソッドへの4Dアクションwebリクエストを呼び、LCD上に表示します。サンプルのストリングが、下記のように80バイトとして4Dメソッドから送られます：

Backup OK: 11/15/17Virt 1.1GBFree 25.6GUsers: 1  Proz: 4  Cache:0.01/0.4 GB

このコードは20x4に合わせて、各行を20バイトに分けています。
```
// ESP8266 with 20x4 i2c LCD
// Compatible with the Arduino IDE 1.6.6
// Library https://github.com/agnunez/ESP8266-I2C-LCD1602
// Original Library https://github.com/fdebrabander/Arduino-LiquidCrystal-I2C-library
// Modified for ESP8266 with GPIO0-SDA GPIO2-SCL and LCD1206 display edit library
// and change Wire.begin() by Wire.begin(sda,scl) or other GPIO's used for I2C
// and access from lcd.begin(sda,scl)
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266HTTPClient.h>
#include <LiquidCrystal_I2C.h>
#include <Wire.h>

LiquidCrystal_I2C lcd(0x27,20,4); // Check I2C address of LCD, normally 0x27 20x4
uint8_t heart[8] = {0x0,0xa,0x1f,0x1f,0xe,0x4,0x0}; // example sprite bitmap
int loginstatus = 0;
ESP8266WiFiMulti WiFiMulti;

void setup() {
  lcd.begin(4,5); // In ESP8266-01, SDA=4, SCL=5
  lcd.backlight();
  WiFi.mode(WIFI_STA);
  WiFi.begin("SSID", "PASSWORD");
  lcd.setCursor(0, 0);
  lcd.print("Connecting");

  while(WiFi.status() != WL_CONNECTED) {
   lcd.setCursor(10, 0);
   lcd.print("...");
   delay(500);
   lcd.print(" ");
  }
  
  lcd.setCursor(0, 0);
  lcd.print(" ");                  ");
}

void loop() {
  delay(5000);
  lcd.home(); // At column=0, row=0
  HTTPClient http;
  http.begin("http://<serverIP>/4dAction/WemosData20x4");
  int httpCode = http.GET();

  if (httpCode > 0) {
    if (httpCode == HTTP_CODE_OK) {
      String payload = http.getString();
      String result1 = payload.substring(0,20);
      lcd.setCursor(0, 0);
      lcd.print(result1); // Row 1
      String result2 = payload.substring(20,40);
      lcd.setCursor(0, 1);
      lcd.print(result2); // Row 2
      String result3 = payload.substring(40,60);
      lcd.setCursor(0, 2);
      lcd.print(result3); // Row 3
      String result4 = payload.substring(60,80);
      lcd.setCursor(0, 3);
      lcd.print(result4); // Row 4
     }
    }
  http.end();
}
```

### 20x4 LCDに対する4D アクションメソッド
LCDで表示されるデータのサンプルセットは、最後のバックアップの日付、仮想メモリ、フリーメモリ、ユーザー数、プロセス数、使用するキャッシュ、になります。情報を解凍するキーとなる4Dコマンドは、GET MEMORY STATICSとGET BACKUP INFORMATIONです。前述のように、リクエストごとに80バイトのデータが送られます。

```
// ----------------------------------------------------------------------
// Name: WemosData20x4
// Description: 4D Action method will output the following of 80 bytes:
//              - Backup date
//              - Virtual memory and Free memory
//              - Number of users and Processes
//              - Cache used
//
// Example String:
// Backup OK: 11/15/17Virt 1.1GBFree 25.6GUsers: 1 Proz: 4 Cache:0.01/0.4 GB
//
// Example on 20x4 LCD output:
// Backup OK: 11/15/17
// Virt 1.1GB Free 25.6G
// Users: 1 Proz: 4
// Cache: 0.01/0.4 GB
// ----------------------------------------------------------------------
C_DATE($lastbkdate;$nextbkdate)
C_TIME($lastbktime;$nextbktime)
C_TEXT($backup;$user;$cache;$mem;$answer)
C_REAL($freememsize)
ARRAY TEXT($arrtext;0)
ARRAY REAL($arrreal1;0)
ARRAY REAL($arrreal2;0)
GET MEMORY STATISTICS(1;$arrtext;$arrreal1;$arrreal2)
GET BACKUP INFORMATION(Last backup date;$lastbkdate;$lastbktime)
GET BACKUP INFORMATION(Next backup date;$nextbkdate;$nextbktime)

Case of
  : ($nextbkdate<Current date)
   $backup:="Backup last: "+String($lastbkdate)
  : ($nextbkdate=Current date)
   If ($nextbktime>Current time)
    $backup:="Backup OK: "+String($lastbkdate)
   Else
    $backup:="Backup last: "+String($lastbkdate)
   End if
Else
  $backup:="Backup OK: "+String($lastbkdate)
End case

$backup:=Substring($backup;1;18)+Substring($backup;21;22)
$user:=Substring("Users: "+String(Count users)+"       ";1;11)+Substring("Proz:
"+String(Count user processes)+"       ";1;9)
$freememsize:=$arrreal1{4}

If ($freememsize<(100*1024*1024)) // 1000 mb
  $mem:="WARNING - Free Mem: "+String(Round($freememsize/(1024*1024*1024);1))+"GB"

Else
  $mem:=Substring("Virt "+String(Round($arrreal1{6}/(1024*1024*1024);1))+"GB
";1;10)
      $mem:=$mem+Substring("Free
"+String(Round($freememsize/(1024*1024*1024);1))+"GB";1;10)
End if

$cache:=Substring("Cache:"+String(Round($arrreal1{2}/(1024*1024*1024);2))+"/"+String(
Round($arrreal1{1}/(1024*1024*1024);1))+" GB      ";1;20)

If (<>manualSendToLCD#1)
 $answer:=$backup+$mem+$user+$cache
Else
 $answer:=<>LCDMessage20_4
End if

WEB SEND TEXT($answer;"application/json")
```

WeMos ESP8266が起動してネットワークに接続している時、下記の表示が5秒ごとに現れます。
![図 36 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-36.png){: .align-center}

## 16x2 LCDを使ったデモ
20x4と同様に、この章では16x2 LCD用のフルコードを提示します。スクリーンはより小さいサイズなので、二つのメソッドがこのコード内でアクセスして、同じようなデータを表示します。
WeMos ESP8266は4Dメソッドの”WemosData16x2_1”と”WemosData16x2_2”にアクセスします。

### WeMos ESP8266コード
このコードは、WIFIのセットアップのデモを実行します。７秒間隔で”WemosData16x2_1”と”WemosData16x2_2”メソッドに対して4Dアクションwebリクエストを呼びます。
サンプルストリングは各4Dメソッドから32ビットで送付されます。

BKUP OK:11/15/17VM:1.1G FM:25.6G

Users:1 P:4 Cache:0.01/0.4GB

16x2なので、行ごとに16バイトに分割します。
```
// ESP8266 with 16x2 i2c LCD
// Compatible with the Arduino IDE 1.6.6
// Library https://github.com/agnunez/ESP8266-I2C-LCD1602
// Original Library https://github.com/fdebrabander/Arduino-LiquidCrystal-I2C-library
// Modified for ESP8266 with GPIO0-SDA GPIO2-SCL and LCD1206 display
// edit library and change Wire.begin() by Wire.begin(sda,scl) or other GPIO's used
for I2C
// and access from lcd.begin(sda,scl)
#include <ESP8266WiFi.h>
#include <ESP8266WiFiMulti.h>
#include <ESP8266HTTPClient.h>
#include <LiquidCrystal_I2C.h>
#include <Wire.h>
LiquidCrystal_I2C lcd(0x3F,16,2); // Check I2C address of LCD, normally 0x3F 16x2

uint8_t heart[8] = {0x0,0xa,0x1f,0x1f,0xe,0x4,0x0}; // example sprite bitmap
int loginstatus = 0;
int count = 0;
ESP8266WiFiMulti WiFiMulti;

void setup() {
 lcd.begin(4,5); // In ESP8266-01, SDA=4, SCL=5
 lcd.backlight();
 WiFi.mode(WIFI_STA);
 WiFi.begin("SSID", "PASSWORD");
 lcd.setCursor(0, 0);
 lcd.print("Connecting");

while(WiFi.status() != WL_CONNECTED) {
 lcd.setCursor(10, 0);
 lcd.print("...");
 delay(500);
 lcd.print(" ");
}

 lcd.setCursor(0, 0);
 lcd.print(" ");
}

void loop() {
 delay(7000);
 lcd.home(); // At column=0, row=0
 HTTPClient http;

if (count == 0) {
 http.begin("http://<serverIP>/4dAction/WemosData16x2_1");
 count = 1;
} else if (count == 1) {
 http.begin("http://<serverIP>/4dAction/WemosData16x2_2");
 count = 0;
}

int httpCode = http.GET();
 if (httpCode > 0) {
  if (httpCode == HTTP_CODE_OK) {
    String payload = http.getString();
    String result1 = payload.substring(0,16);
    lcd.setCursor(0, 0);
    lcd.print(result1); // Row 1
    String result2 = payload.substring(16,32);
    lcd.setCursor(0, 1);
    lcd.print(result2); // Row 2
   }
  }
 http.end();
}
```

### 16x2 LCDでバックアップと仮想メモリーに対する4Dアクションメソッド
LCDで表示されるデータのサンプルセットは、限定された表示スペースのため、最後のバックアップの日付、仮想メモリ、フリーメモリです。情報を解凍するために使われるキーとなる4Dコマンドは、GET MEMORY STATISTICSとGET BACKUP INFORMATIONです。前述のように、リクエストごとにデータは32バイトで送られます。

```
// ----------------------------------------------------------------------
// Name: WemosData16x2_1
// Description: 4D Action method will output the following of 32 bytes:
//           - Backup date
//           - Virtual memory and Free memory
//
// Example String:
// BKUP OK:11/15/17VM:1.1G FM:25.6G
//
// Example on 16x2 LCD output:
// BKUP OK: 11/15/17
// VM:1.1GB FM:25.6G
// ----------------------------------------------------------------------
C_DATE($lastbkdate;$nextbkdate)
C_TIME($lastbktime;$nextbktime)
C_TEXT($backup;$mem;$answer)
C_REAL($freememsize)
ARRAY TEXT($arrtext;0)
ARRAY REAL($arrreal1;0)
ARRAY REAL($arrreal2;0)

GET BACKUP INFORMATION(Last backup date;$lastbkdate;$lastbktime)
GET BACKUP INFORMATION(Next backup date;$nextbkdate;$nextbktime)
GET MEMORY STATISTICS(1;$arrtext ;$arrreal1;$arrreal2)

Case of
   : ($nextbkdate<Current date)
     $backup:="BKUP last: "+String($lastbkdate)
   : ($nextbkdate=Current date)
     If ($nextbktime>Current time)
      $backup:="BKUP OK:"+String($lastbkdate)
     Else
      $backup:="BKUP last:"+String($lastbkdate)
     End if
    Else
     $backup:="BKUP OK:"+String($lastbkdate)
End case

$backup:=Substring($backup;1;14)+Substring($backup;17;18)
$freememsize:=$arrreal1{4}
If ($freememsize<(100*1024*1024)) // 1000 mb
  $mem:="VM:W"+String(Round($freememsize/(1024*1024*1024);1))+"G"
Else
  $mem:=Substring("VM:"+String(Round($arrreal1{6}/(1024*1024*1024);1))+"G";1;10)
  $mem:=$mem+Substring(" FM:"+String(Round($freememsize/(1024*1024*1024);1))+"G";1;10)
End if

If (<>manualSendToLCD#1)
  $answer:=$backup+$mem
Else
  $answer:=<>LCDMessage16_2
End if

WEB SEND TEXT($answer;"application/json")
```

WeMos ESP8266が起動してネットワークが接続している時、以下のように表示されます。

![図 37 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-37.png){: .align-center}

### ユーザー、プロセス、キャッシュに対する16x2 LCD用の4Dアクションメソッド
LCD上に表示されるデータのサンプルセットは、限られた表示スペースですので、ユーザー数、プロセス数と使用しているキャッシュです。

```
 // ----------------------------------------------------------------------
  // Name: WemosData16x2_2
  // Description: 4D Action method will output the following of 32 bytes:
  // - Number of users and Processes
  // - Cache used
  //
  // Example String:
  // Users: 1 P: 4 Cache:0.01/0.4GB
  //
  // Example on 16x2 LCD output:
  // Users: 1 P: 4
  // Cache:0.01/0.4GB
  // ----------------------------------------------------------------------
C_TEXT($answer;$cache)
ARRAY TEXT($arrtext;0)
ARRAY REAL($arrreal1;0)
ARRAY REAL($arrreal2;0)
GET MEMORY STATISTICS(1;$arrtext;$arrreal1;$arrreal2)

$user:=Substring("Users: "+String(Count users)+"    ";1;9)+Substring(" P:
"+String(Count user processes)+"     ";1;7)
$cache:=Substring("Cache:"+String(Round($arrreal1{2}/(1024*1024*1024);2))+"/"+String(
Round($arrreal1{1}/(1024*1024*1024);1))+"GB";1;17)

If (<>manualSendToLCD#1)
 $answer:=$user+$cache
Else
  $answer:=<>LCDMessage16_2
End if

WEB SEND TEXT($answer;"application/json")
```

最初のメソッド”WemosData16x2_1”を呼んだ後に表示されるのは下記の画面です。

![図 38 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-38.png){: .align-center}

## LCDに手動でデータを入力するデモ
このデモはユーザーに、20x4と16x2の双方でLCDにデータを入力するUIを提供します。デモを起動するために、メニューバーにDemo -> SEND DATA TO LCDがあります。”WemosData20x4”、”WemosData16x2_1”と”WemosData16x2_2”のメソッドは、以下のフォームで入力されたデータをオーバーライドできるプロセス間変数を含みます。

![図 39 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-39.png){: .align-center}

## 20x4 LCDに手動でデータを入力
各行にデータを入力できます。これがLCD行を示しています。”CHARS”は左欄に入力された文字の数を示して、20から始まります。

![図 40 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-40.png){: .align-center}

“SEND TO LCD”ボタンを押すと、”WemosData20x4”メソッド内のプロセス間変数を修正し、下図の表示になります。

![図 41 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-41.png){: .align-center}

## 16x2 LCDに手動でデータを入力
“20x4 LCD”と同様に、これは16文字で2行だけ表示できます。”CHARS”は左欄の文字数を示していて、16から始まります。

![図 42 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-42.png){: .align-center}

“SEND TO LCD”ボタンを押すと、”WemosData16x2”と”WemosData16x2_2”メソッド内のプロセス間変数を修正し、下図の表示になります。

![図 43 : ](/images/WirelessStatusDisplaywith4D/17-22_wsd-43.png){: .align-center}

# 終わりに
---
このテクニカルノートでは、ワイヤレス・ステータス・ディスプレイ・ソリューションように設計されたハードウェアのひとつから、4Dを使った通信の「既存の枠組みに囚われない」アプローチを紹介しました。この実装以外の方法もありますが、このドキュメントのポイントは、学習曲線を減らすことによって、ハードウェア設計の世界に足を踏み込んでもらうことにあります。多くの既存の、あるいは新しい4Dデータベースは、エンドユーザーにステータスとより多くを提供し、このソリューションの恩恵を得られます。


# 参考資料
---
Arduino IDE – https://www.arduino.cc/en/Main/Software
Programming Arduino WeMos ESP8266 - http://www.instructables.com/id/Programmingthe-
WeMos-Using-Arduino-SoftwareIDE/
CH340G drivers (Windows) - http://www.arduined.eu/files/CH341SER.zip
CH340G drivers (Mac) - https://github.com/MPParsley/ch340g-ch34g-ch34x-mac-os-x-driver
LCD library for Arduino WeMos ESP8266 – https://github.com/agnunez/ESP8266-I2C-LCD1602
Liquid Crystal – https://www.arduino.cc/en/Reference/LiquidCrystal
I2C – http://i2c.info/
Logic Levels - https://learn.sparkfun.com/tutorials/logic-levels
Tinkercad – http://www.tinkercad.com
Thingiverse (20x4) – https://www.thingiverse.com/thing:1650630
Thingiverse(16x2) - https://www.thingiverse.com/thing:670011
Parts:
WeMos ESP8266 kit – https://aliexpress.com (search for “ESP8266 by WeMos” ~$3)
LCD 20x4 (I2C) – https://aliexpress.com (search for “lcd 20x4 i2c” ~$4)
LCD 16x2 (I2C) – https://aliexpress.com (search for “lcd 16x1 i2c” ~$3)
Level shifter circuit – https://aliexpress.com (search for “level shifter” ~$3)
Breadboard with jumpers – https://aliexpress.com (search for “bread board kit” ~$4)
Power adapter 5 Volts DC – https://aliexpress.com (search for “travel charger portable 5v”)
Micro USB cable – https://aliexpress.com (search for “micro usb cable”)
