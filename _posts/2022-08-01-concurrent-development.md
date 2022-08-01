---
layout: post
title: "プロジェクトモードのリモート開発"
date: 2022-08-01 08:00:00
categories: 仕様
tags: 19.x projectmode 
---

19r6では，プロジェクトフォルダーを共有することにより，[リモートクライアントからデザインモードにアクセスできる](https://discuss.4d.com/t/new-feature-developing-concurrently-on-4d-server-in-project-mode/24250)ようになりました。これは18r4でサーバーと同じマシン上で起動した4D Remote（[ローカルクライアント](https://doc4d.github.io/docs/ja/Project/developing.html#同じマシン上での-4d-の使用)）であればデザインモードにアクセスできる[仕組み](https://blog.4d.com/server-code-development-in-project-applications/)を拡張するものです。

プロジェクトモードでは，構造的なバイナリファイルであるストラクチャファイルではなく，標準テキストファイルの集合を扱います。チーム開発においては，Gitのようなバージョン管理システムを併用することが想定されています。Gitワークフローは，4Dに限らず，多くの開発チームで採用されています。バージョン管理システムを活用することにより，[アジャイル開発](https://ja.wikipedia.org/wiki/アジャイルソフトウェア開発)に則ったリリースや継続的なメンテナンス（[CI/CD](https://ja.wikipedia.org/wiki/CI/CD)）を実施することができます。外部コードエディターを利用することもできます。

バイナリモードに慣れたデベロッパーの中には，こうしたことをメリットとは考えず，クライアントで同時開発ができないのであれば，プロジェクトモードに移行することはできない，という意見が挙がりました。今回の新機能はそうしたニーズに応えるものです。

開発部は，Gitのようなバージョン管理システムを推奨しています。プロジェクトモードは，そのような開発スタイルを想定したアーキテクチャだからです。とはいえ，デベロッパーが望むのであれば，さらにプロジェクトモードに切り替えることが容易になるのであれば，ファイル共有を利用した簡易的なシステムがあっても良い，と判断しました。

インタープリター版のプロジェクトに開発モードで"接続"した場合，メソッドエディター・フォームエディター・ツールボックスなどの排他的ロックは，オペレーションシステムではなく，4D Serverと4D Remoteの間で管理されることになります。そのため，外部エディターで同時にソースコードを編集することはできません。この場合，サーバーに接続することは，クライアント側のファイルシステム上で共有フォルダーの場所を指定する行為を指します。例外は，サーバーと同じマシンで起動したローカルクライアントで，その場合，開発モードではなく，従来の要領でサーバーに接続します。

クライアント側でメソッド・フォーム・ストラクチャ・データベース設定・ドキュメンテーション・ユーザー/グループ・メニュー・ヘルプTips・リスト・フィルター・スタイルシートなどを更新すると，サーバーに通知が送信され，プロジェクトがリロードされます。実行中のメソッドやフォームは，閉じられた後に更新されます。フォームやメソッドはファイル単位でロックされます。ツールボックスはページ単位でロックされます。データベース設定は全体がロックされます。コンパイルを実行できるのは１度に１台のマシンだけです。

下記のコマンドはバイナリモードと同じ要領で使用できます。


* [METHOD SET ACCESS MODE](https://doc.4d.com/4Dv19R5/4D/19-R5/METHOD-SET-ACCESS-MODE.301-5831180.ja.html)
* [METHOD SET COMMENTS](https://doc.4d.com/4Dv19R5/4D/19-R5/METHOD-SET-COMMENTS.301-5831172.ja.html)

下記のコマンドは対象メソッドがロックされていなければ成功し，ロックされていればエラーを返します。

* [METHOD SET ATTRIBUTE](https://doc.4d.com/4Dv19R5/4D/19-R5/METHOD-SET-ATTRIBUTE.301-5831186.ja.html)
* [METHOD SET ATTRIBUTES](https://doc.4d.com/4Dv19R5/4D/19-R5/METHOD-SET-ATTRIBUTES.301-5831185.ja.html)
* [METHOD SET CODE](https://doc.4d.com/4Dv19R5/4D/19-R5/METHOD-SET-CODE.301-5831183.ja.html)
 
開発モードで接続したという情報は *.4DLink* ファイルに反映されます。その場合，プロジェクト名にはサーバーの公開名とアドレスに "(development mode)" という文字列が追加されます。

フォルダー共有は，Windows/macOSそれぞれのオペレーションシステムが提供する基本的な仕組み（AFP, SMB/CIFS）を使用することができます。アクセス速度が問題であれば，NAS（Network Attached Storage）の導入を検討すると良いかもしれません。

<i class="fa fa-external-link" aria-hidden="true"></i> [Developing Concurrently on 4D Server in Project Mode](https://blog.4d.com/developing-concurrently-on-4d-server-in-project-mode/)
