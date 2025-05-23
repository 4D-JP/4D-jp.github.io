---
layout: fix
title: "Qodly Studioのライセンス"
date: 2025-05-22 08:00:00
categories: 仕様
version: 20r8
tags: orda qodly projectmode license clientserver programming
---

## Qodly Studioとは

[*Qodly Studio*](https://blog.4d.com/ja/introducing-qodly-studio/) は，4D Serverと[ORDA](https://developer.4d.com/docs/ja/ORDA/overview)をバックエンドとする本格的なWebアプリケーションを[ローコードで開発するためのツール](https://blog.4d.com/ja/master-web-applications-with-4d-qodly-pro-a-tutorial-series/)です。4D 20 R2以降のデザインモードに組み込まれており，[パートナープログラム](https://jp.4d.com/4d-partner-program)のシルバーまたはゴールドメンバーであれば，[使い始める](https://blog.4d.com/ja/get-started-with-qodly-studio/)ことができます。

> [4D 20 R8](https://blog.4d.com/ja/4d-qodly-pro-whats-new-in-4d-20-r8/)以降，4Dと*Qodly Studio* の組み合わせは*Qodly Pro* と呼ばれています。それまでの名称は*Qodly Studio for 4D* でした。（"Pro"ではない）*Qodly* は，4Dがクラウドサービスとして展開しているプラットフォーム (PaaS) のほうを指します。*Qodly* は，Amazon Web Services (AWS) データセンターにホスティングされた専用のアプリケーションサーバー（*Qodly Server*）をバックエンドとしており，開発〜運用〜保守まで，すべてブラウザで完結し，4Dや4D Serverは使用しません。

## Qodly Studioと4D

*Qodly Pro* を使った開発は，通常，4D Developer Professionalとブラウザの組み合わせで進めます。*Qodly Studio* のGUIでフロントエンドをデザインし，4Dのデザインモードでバックエンドの開発をする，というスタイルです。適宜，ブラウザでアプリケーションの出来栄えを確認します。アプリケーションを1から作り上げることもできますが，既存の4Dアプリケーション（プロジェクトモード移行済み）にWebインタフェースを追加するようなケースが基本的に想定されています。クラウドサービスの*Qodly* とは違い，バックエンドはフルスペックの4D Serverなので，既存のメソッドやロジック，プラグインやコンポーネントなど，すべての資源を有効に活用することができます。

*Qodly Pro* で開発したアプリケーションは，4D Server（ライセンスコード:`4USE`）で運用します。HTTPサーバーを使用しますが，Web Application Expansion（ライセンスコード:`4UWE`）は使用しません。ブラウザから*Qodly* に[ログイン](https://blog.4d.com/ja/improved-4d-client-licenses-usage-with-qodly-studio-for-4d/)したユーザーは，ログアウトするまで，4D Serverの接続クライアント`1`名としてカウントされます。必要であれば，4D Client Expansion（ライセンスコード:`4UCL`）を追加して，同時接続ユーザー数を拡大することができます。

## Qodly Studioと4D Server

4Dで開発されたアプリケーションは，クライアント/サーバー版に移行した場合でも，基本的にシングル版と同じような感覚で使うことができますが，ネットワーク経由で複数のユーザーが同時にアクセスするようになると，それまで気づかなかった課題がみつかるかもしれません。それで，日常的には4D Developer Professionalで開発し，時折，4D Serverで動作を確認することがベストプラクティスとなっています。

その点は，*Qodly Pro* も同じです。開発環境の4Dには存在せず，運用環境の4D Serverだけに存在する課題があるかもしれません。そのようなときは，[4D Serverと*Qodly Studio* の組み合わせ](https://blog.4d.com/ja/access-qodly-studio-for-4d-directly-from-your-4d-server-to-test-and-debug-your-code/)で*Qodly Pro* を使うことができます。つまり，サーバー側で*Qodly Studio* を起動して，サーバー側のコードのテストやデバッグを実行することができます。

## Qodly Studioとライセンス

*Qodly Pro* は，4Dの開発ツールセットに含まれています。2025年以降，4Dが提供する開発ツールは，すべてパートナープログラムに集約され，買い切りライセンスは，2024年12月31日に販売を終了しました。パートナープログラムのメンバーシップには，ブロンズ・シルバー・ゴールドの３段階があり，利用できるサービスやツールセットの内容に違いがあります。

*Qodly Pro* のライセンスは，4D Developer Professional（ライセンスコード:`PNDP`）に含まれています。このライセンスがアクティブであれば，「デザイン＞設定」および「ファイル＞Web管理」メニューに「Qodly Studio へのアクセスを有効化する」というチェックボックスが表示されます。前者はカレントプロジェクト，後者はすべてのプロジェクトが対象です。このライセンスは，シルバーおよびゴールドメンバーの特典です。

4D Server側で*Qodly Pro* を使用するためのライセンスは，4D Developer Bundle（ライセンスコード:`PNDB`）に含まれています。このライセンスがアクティブであれば，サーバー側の「ファイル＞Web管理」メニューにも「Qodly Studio へのアクセスを有効化する」というチェックボックスが表示され，「ウィンドウ」メニューから*Qodly Studio* にアクセスすることができます。 このライセンスは，ゴールドメンバーの特典ですが，シルバーメンバーも追加で購入することができます。

### 4D Developer Bundleとは

4D Developer Bundleは，プロジェクトモード向けに組み直された新しい開発ツールセットです。

ゴールドメンバーには，パートナープログラム更新時に下記のライセンスが付与されます。

1. Developer Professional 3本（入会以降すべてのバージョン）
2. Developer Bundle 3本（バージョン19以上）

1番のDeveloper Professionalは，複数の開発者が別々のプロジェクトまたはプラットフォームを担当する一般的なチーム体制に向いています。開発用のPCまたはMac3台に1本ずつライセンスを登録します。

> 以前は，Team Developer Professionalライセンスを選択することもできました。Team Developer Professionalは，複数の開発者がクライアントからサーバーに接続し，それぞれのマシンからリアルタイムで同時にアプリケーションを開発するようなバイナリモードのチーム体制に向いています。クライアント/サーバー環境でコンパイルを実行することができます。開発用のPCまたはMacサーバー1台にライセンスを登録します。このライセンスは2024年の更新を最後に提供を終了しました。

Developer Bundleは，プロジェクトモードを想定した新しいオプションです。プロジェクトモードでは，リアルタイムでサーバー側のストラクチャファイルを同時に改修するのではなく，Gitなどのバージョン管理システムを活用し，チームのメンバーが開発したコードを共有リポジトリに結合する「継続的インテグレーション」方式が推奨されています。サーバー/クライアントの場合，2台のマシンを使用する代わりに，[同じマシン上でサーバーとクライアントの両方](https://developer.4d.com/docs/ja/Desktop/clientServer#4d-と-4d-server-の同じマシン上での使用)を起動し，ローカル接続でデザインモードを使用します（リモートクライアントもデザインモードにアクセスできますが，[開発モード](https://blog.4d.com/ja/developing-concurrently-on-4d-server-in-project-mode/)でない限り，コードを編集することはできません）。Developer Bundleの4D Serverには，2ユーザーまで接続することができます。開発用のサーバー兼クライアントPCまたはMac3台に1本ずつライセンスを登録します。

<i class="fa fa-external-link" aria-hidden="true"></i> [ブローシャー](https://download.4d.com/Documents/Website/PartnerProgram/JP/PartnerProgram_Brochure_jp.pdf)

## まとめ

開発ツールの*Qodly Studio* は，4Dまたは4D Serverで使用することができます。4Dの場合，バージョン20 R2以降，4D Serverの場合，バージョン20 R8以降が対応しています。ただし，プロジェクトモード限定です。

4Dで*Qodly Studio* を使用するためのライセンスは，パートナープログラムのシルバーおよびゴールドメンバーの特典である4D Developer Professional（ライセンスコード:`PNDP`）に含まれています。

4D Serverで*Qodly Studio* を使用するためのライセンスは，パートナープログラムのシルバー追加パックまたはゴールドメンバーの特典である4D Developer Bundle（ライセンスコード:`PNDB`）に含まれています。

パートナープログラムには，テスト用の4D Server（ライセンスコード:`PNSS`）も含まれています。サーバーアプリケーション（*Qodly* を含む）をテストするためのライセンスですが，このライセンスで開発ツールの*Qodly Studio* を使用したり，開発したサーバーアプリケーションを配付・運用したりすることはできません。そのためには，4D Serverの買い切りまたはサブスクリプションライセンスを購入してください。

なお，4D Serverの買い切り（ライセンスコード:`4USE`）またはサブスクリプションライセンス（ライセンスコード:`4RSE`）には，サーバー/クライアント環境の開発ライセンスが含まれているので，バージョン条件が満たされていれば，4D Serverで*Qodly Studio* を使用することができます（20 R8以降でライセンスを更新していれば，メンテナンスが終了した後も*Qodly Studio* を使い続けることができます）。

最後に、パートナーは[14日評価版のサーバーアプリケーションをビルドすることができます](https://blog.4d.com/ja/building-evaluation-applications/)。この設定でビルドしたアプリケーションは、初回の起動時にインターネット経由で評価ライセンス（ライセンスコード:`EVSE`）をダウンロードし、評価期間中は通常版の4D Serverと同じように動作します。

|ライセンス|Qodly Studio for 4D|Qodly Studio for Server|Test Qodly|Deply Qodly|
|:-:|:-:|:-:|:-:|:-:|
|`PNDS`|||||
|`PNDP`|✅| |✅||
|`PNDB`|✅|✅||✅|
|`PNSS`| | |✅||
|`4USE`| |✅|✅|✅|
|`4RSE`| |✅|✅|✅|
|`EVSE`| |✅|✅| |
