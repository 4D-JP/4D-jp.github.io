---
layout: technote
original_title: Github on 4D
title: Githubと4D
author: Ayoub Khali
position: Technical Services Engineer
date: 2020-03-19 00:00:00
categories: テックノート
tags: development 
version: v18
---

Githubと4D 原題: [4D on GitHub](https://kb.4d.com/assetid=78277)

# Githubと4D
原文: [Ayoub Khali](https://kb.4d.com/assetid=78277)

<i class="fa fa-download" aria-hidden="true"></i> [my_4D_project.4dbase.zip](https://github.com/4D-JP/HDI/releases/download/TN-19-11/my_4D_project.4dbase.zip)

<!--more-->

## はじめに
---

初心者の開発者あるいは熟練のシニア・デベロッパーであっても、複数の人員がいわゆる生産チェーン連携に加わるために共同作業する傾向があるので、バージョン管理はあらゆる作業環境で必須となっています。シナリオがどのようなものであっても、動作の言語/フレームワークが何であっても、『プログラムやWebページに10行以上のコードが含まれるようになると、GITは必要不可欠なもの、あるいは一部では必要悪と呼ばれるものになる」という１つのアドバイスがずっと存在しています。GITを理解することは、最初は骨の折れる複雑な作業のように思えるかもしれませんが、一旦バージョニングが提供するパワーと安全性を理解すれば、コーディングとコンフリクト管理はもはや面倒ではなくなります。

このテクニカル・ノートでは、GIT = GitHubを使ったリビジョン管理システムを、ホスティング・サービスとして紹介し、インストールから設定手順、GIT bashを使ったGITレポジトリとの相互通信の異なる方法を詳細に説明します。


## 概要
---

GITは昔からある同等のもの（CVS、SVN…)と同じように、主にLinux向けに開発されたリビジョン管理システムですが、MacとWindowsシステムでも動作します。GITは急進的なアプローチを取ったので、これまでの遺産的な類似品とは大きく異なります。GITは、中央集中型ではなく分散型であるため、レポジトリの完全なコピーとバックアップを全てのユーザーが持つという点で、従来のGITとは大きく異なる抜本的なアプローチを採用しました。データがローカルに保存されるため、ファイル履歴へのアクセスが非常に効率的になります。

全ての開発者の作業ディレクトリ自体がブランチであるため、GITはチームワークを単純化し、プロジェクトでのコラボレーションをはるかに管理しやすくします。全てのブランチに対するあらゆる変更はマスター・ブランチ内にマージすることができますが、同時に発生する可能性のあるコンフリクトにも対処することができます。

これにより、複数の共同作業者が同じファイルで同時に作業することが可能になり、最終的なファイルをマージするのはそれほど面倒ではないことが分かります。


## 4Dプロジェクト・モード
---

4Dは以前のバージョンからチームの開発とテストをサポートしており、4Dサーバー経由でチームメンバーが一緒に作業できるバイナリ・システムを使用していました。v17R5から4Dには、分散したチームが同じソース（プロジェクト・モード）で作業できる新しい方法が導入されました。つまり、バイナリ・ソース（.4DBファイル）をプロジェクト・フォルダに保存し、データベースの全ての要素（フォーム、メソッド…）をテキスト・ファイルとして作成できます。

プロジェクト・モードに変換しても.4DBファイルには影響しませんが、代わりにその隣に新しい「Project」フォルダが生成されます。これには２つの意味があります：

1. これによりバイナリー・データベースの変換を何度も行うことができ、テストに役立つ可能性があります。
　
2. 変換は一方通行の方法だけしかありません。つまり、一度変換すると現在の変更を.4DBに再統合することはできません。

さらに、既存のデータベースを変換することは、プロジェクト・モードにアクセスするための唯一の実行可能な方法ではありません。新しいデータベース・プロジェクトを最初から作成することは、引き続き利用可能なオプションです。

### データベースをプロジェクトに変換する

変換のプロセスはシンプルです。デザイン・モードからメニュー・アイテムで、ファイル > 書き出し > ストラクチャからプロジェクト…を選択します。

![図１：メニューからストラクチャtoプロジェクト](/images/TechNote/Github-on-4D/git-hub-on-4d1.png){: .align-center}

一度プロジェクトが作成されると以下のプロンプト・メッセージが表示されます。

![図２：プロンプトメッセージ](/images/TechNote/Github-on-4D/git-hub-on-4d2.png){: .align-center}

- Reveal Log /ログを表示する：変換中に生成されたログファイル (JSON)を含むフォルダを表示します。
- Open project /プロジェクトを開く：データベースをプロジェクト・モードで開きます。
- Cancel /キャンセル：変換せずに.4DBモードで残します。このモードにした場合、２度目にこのストラクチャを書き出そうとすると、プロジェクト・フォルダがすでに存在するという警告が表示されます。ユーザーは「置換する」オプションを選択します。

### 新しいプロジェクトを作成する

新しいプロジェクトの作成はシンプルで、ファイル > 新規 > データベース・プロジェクト…を選択します。

![図３：新規toデータベース・プロジェクト](/images/TechNote/Github-on-4D/git-hub-on-4d3.png){: .align-center}

### Projectフォルダの中のコンテンツ

一度プロジェクトが生成されると、Projectフォルダはデータベースから（フォーム、メソッド、メニュー、ストラクチャなど）エレメント１つずつがフォルダによって管理されるテキスト・ファイル（.json、.4dm、.4DCatalog、など）で含まれます。

![図４：フォルダ内のエレメント](/images/TechNote/Github-on-4D/git-hub-on-4d4.png){: .align-center}

- BuidSettingsフォルダにはBuildapp.xmlが含まれます。
- DerivedDataフォルダにはメソッドとフォームに関するメタデータ（timestamp、destinationなど）が含まれます。
- Sourcesフォルダには、各フォーム、メソッド、トリガー、データベース設定に加えてメニュー、そしてストラクチャのファイルが含まれます。
- Trashフォルダは、Trash Binkから消去されたフォームとメソッドが含まれます。
- Test.4DProject


## GITアーキテクチャ
---

![図５：GITワークフロー](/images/TechNote/Github-on-4D/git-hub-on-4d5.png){: .align-center}

まずはGITのアークテクチャを見て、その背後にあるストラクチャ全体を把握しましょう。

ダイヤグラムは２つの主要なセクションに分かれます：ローカルとリモートです。

### ローカル

ワーキング・ディレクトリー：これはデータベースが存在し、.gitフォルダーが生成される場所です。この場所は「トラックされない」エリアとしても知られています。これらのファイルの変更は、ワーキング・ツリーにマークされます。このエリアに変更を加えて、明らかにGITを使ってそれらを保存しなかった場合、データは失われる結果になります。この変更の喪失は、ワーキング・ディレクトリで変更されたことにGITが気づいていないために発生します。要するにGITはワーキング・ディレクトリ上にあるファイルに変更を加えたことに気づいても、正確なコマンドが入力されないとそれらの変更を保存しません。

スターティング・エリア：あるいはインデックス・エリアは、GITがワーキング・ディレクトリ内の各ファイルに発生する変更をステージングする場所です。トラッキングしないファイルとステージングしないファイルの違いはシンプルです。トラッキングしないファイルとは、基本的に以前のレポジトリのスナップショットに存在しなかった全てのファイル（例えば新しいファイル）です。一方、ステージングしない状態は変更に関連しているため、ファイルに変更が加えられる度に、このファイルの内容がワーキング・ツリーからステージング領域まで異なるため、このファイルはステージングしない状態になります。

GITレポジトリ（あるいはローカル・レポジトリ）：これは、コミットが実行される度に全てのファイルが保存される場所です。コミットすると、ステージング・エリア内の全ての変更がローカル・マシンで使用可能なローカル・レポジトリに送信されます。コミットが終了すると、ステージング領域は空のままになります。分散バージョン管理システムの重要な機能の１つは、完全なレポジトリ履歴にローカルでアクセスできることです。

### リモート

リモートGITレポジトリ：GITのリモートは基本的に、全てのチーム・メンバーがファイルを送受信できる共通のレポジトリです。リモート・レポジトリは通常ローカルマシンにはなく、例えばGITHUBのようなコードホスティングサービスに保存されますが、内部サーバーで動作するように設定することもできます。チームメンバーは、チームと共有する準備ができたらコミットをプッシュできます。チームが単一の開発者（バックアップとして使用しない限り）で構成されている場合、リモート・レポジトリの使用はオプションであることに注意してください。


## GITブランチング
---

ブランチングは、多くの最新のバージョン管理システムで重要な機能であり、GITでも同様です。ブランチの主な目的は、全てのコミットがプッシュされるマスター・シングル・ブランチの代わりにこのプロセスに別のサイド・ブランチを含めることができる、というユーティリティーにあります。複数のブランチを持つワークフローを実装することで、大きなプロジェクトの可視性が高まり、コンフリクトが少なくなります。マスター・ブランチは正式なリリース履歴を保存し、他のブランチは機能ブランチとして機能し、開発が完了すれば最終的にマスター・ブランチに統合/マージされます。

下記のダイヤグラムをご覧ください：

![図６：GITブランチング](/images/TechNote/Github-on-4D/git-hub-on-4d6.png){: .align-center}

青のブランチはマスター・ブランチを表し、緑のブランチはフィーチャー・ブランチを表します。プロジェクトの開始時には、両方とも共通のベース（つまりまだ何も機能がないところ）にあり、機能開発が開始されると青のブランチから緑のブランチが分岐し、完了するとマスターにマージされます。


## GITインストール
---

最初のステップはGitHubアカウントを作成することです：

https://github.com/join?source=header

３つのステップがあります。各ステップに従ってアカウント作成を完了してください。

**ステップ１：** 新しいアカウントの作成

![図７：新しいアカウントの作成](/images/TechNote/Github-on-4D/git-hub-on-4d7.png){: .align-center}

**ステップ２：** ”The basics of GitHub for every developer”を選択

![図８：サブスクリプションの選択](/images/TechNote/Github-on-4D/git-hub-on-4d8.png){: .align-center}

**ステップ３：** GitHubを使用するユーザー・エクスペリエンスとプランを指定

![図９：UIとプランを指定](/images/TechNote/Github-on-4D/git-hub-on-4d9.png){: .align-center}

WindowsとmacOS上では
1. 最新のGITインストーラーをダウンロード
- Windowsインストーラー：https://gitforwindows.org/
- macOSインストーラー：https://sourceforge.net/projects/git-osx-installer/files

2. インストーラーを開始し、ウィザードの「next」ボタンに従い、今は初期設定のまま進めます。
3. ターミナルを開いて、インストールに成功していることを確認するために以下のコマンドを入力します：　GIT —version
4. ターミナルで以下のコマンドのXXXを実際の名称とGitHubアカウントからのメールに置き換えて実行します：

git config ―global user.name “XXXX XXXX”
git config ―global user.email XXXX@XXXX.com

特記：オプションですが、強くお勧めします：git credential helper（資格認定ヘルパー）をインストールしましょう：リモートのレポジトリを伴う各指示には、その都度ユーザー名とパスワードの組み合わせの入力が必要で、とても面倒です。GIT credential helper（macではgit-credential-osxkeychain helper for mac）を使って保存するのはシンプルですので、以下をご覧ください：

**Windowsでは**

GCMを使うには、最新のインストーラーをダウンロードし、GCMW-{version}.exeをダブルクリックして、表示される指示に従います。GIT Bashに対するターミナル・エミュレータを選択する場合には、Windowsの初期設定のコンソール・ウィンドウを選ぶのが正しい選択です。

インストーラーへのリンク：https://github.com/Microsoft/Git-Credential-Manager-for-Windows/releases/tag/1.18.5

**macOSでは**

ターミナル・ウィンドウを開いて下記のコマンドを入力します：
1. ツールのダウンロード
-　curl
　	http://github-media-downloads.s3.amazonaws.com/osx/git-credential-osxkeychain - o git-credential-osxkeychain

2. フォルダの作成
-　sudo mkdir /usr/local
-　sudo mkdir /user/local/bin

3. ファイルを正しいディレクトリに移動
-　sudo mv git-credential-osxkeychain /usr/local/bin/

4. ファイルを実行可能にする
-　sudo chmod u+x /usr/local/bin/git-credential-osxkeychain

5. Gitをosxkeychainを使う設定にする
-　git config -global credential.helper osxkeychain

**最初のリモート・レポジトリを作成する**

-　https://github.com に接続してログインします
-　上部右隅のアイコンをクリックして”Your repositories”を選択します

![図10：Your repositories ](/images/TechNote/Github-on-4D/git-hub-on-4d10.png){: .align-center}
 
- 以下はGitHubアカウント内に作成されたリモート・レポジトリのリストを表示しています。

![図11：リモートレポジトリのリスト](/images/TechNote/Github-on-4D/git-hub-on-4d11.png){: .align-center}

“New”をクリックします。

![図12：Newを指定](/images/TechNote/Github-on-4D/git-hub-on-4d12.png){: .align-center}

**Repository name：** 作成された時にユーザーが入力したリモート・レポジトリの名前

**Description：** レポジトリのコンテンツを記述するのに使うオプションのフィールド

**Public / Private：** レポジトリを視覚化する設定

**Initialize this repository with a README：** プロジェクトの詳細を記述したREADMEを使ってレポジトリを初期化

**Add .gitignore：** トラックされるべきではない全てのファイルを示すファイル

**Add a license：** プロジェクトにライセンスを追加 (GNU、OpenBSD…）


## 4DプロジェクトにGITを実装する
---

これでGITがインストールされてリモート・レポジトリが作成されたので、ローカル・レポジトリの作成へと進み、4Dデータベースから生成されたプロジェクト、あるいは新しく作成された4Dプロジェクトを実装することが次のステップとなります。この場合、ローカル・レポジトリは4Dプロジェクト・フォルダ内で起動されます。

新しく生成されたプロジェクト・フォルダへ誘導して、右クリックで”Git bash here”を選択します。

![図13：Git bash here](/images/TechNote/Github-on-4D/git-hub-on-4d13.png){: .align-center}

これでGIT bashターミナルを開き、GIT操作を実行するコマンドの入力が可能になります。

次のステップはローカルのレポジトリを初期化することです：

![図14：ローカルレポジトリの初期化](/images/TechNote/Github-on-4D/git-hub-on-4d14.png){: .align-center}

**git init** は空のローカル・レポジトリを作成します。シンプルにテンプレートファイルとサブディレクトリを含む.gitディレクトリを作成しているだけです。

**git.init** は4Dプロジェクト・フォルダを実行したので、GITはすでにトラックされないファイルのリストを持っています。

**git status** コマンドを実行すると、ローカル・レポジトリに追加できる修正されたファイル（あるいは新しいファイル）が全て表示されます。結果は、３つの要素がまだインデックスに含まれていないことを示しています。これは、これらの要素を使った変更が現時点でまだコミットできないことを意味します。そのためには、まずこれらのフォルダとファイルをステージング（インデックスへの追加）します。

![図15：git statusコマンドを実行](/images/TechNote/Github-on-4D/git-hub-on-4d15.png){: .align-center}

**git add**コマンドは、次のコミットに対してワーキング・ツリー内で使用可能なファイルをステージング領域へ導入することによって準備します。

![図16：git add コマンド](/images/TechNote/Github-on-4D/git-hub-on-4d16.png){: .align-center}

### git addパラメータ：
<strong>git add ＜directory＞：</strong> 特定のディレクトリの全ファイルをインデックスに追加します。

<strong>git add ＜file＞：</strong> 特定のファイルをインデックスに追加します。

<strong>git add .：</strong> 新しいファイル、削除されたファイル、あるいは変更されたファイルを探してワーキング・ディレクトリ全体を捜査し、それらのファイルをインデックスに追加します。

![図17：ファイルをインデックスに追加](/images/TechNote/Github-on-4D/git-hub-on-4d17.png){: .align-center}

**git status** をもう一度実行して、ファイルがコミットされる準備ができたことを表示します。

![図18：ファイルのコミットの準備完了](/images/TechNote/Github-on-4D/git-hub-on-4d18.png){: .align-center}

**Git commit**は、ステージング・エリアで利用可能な全てのファイルをローカル・レポジトリに送信し、インデックスを解放します。Commitは、作業ディレクトリ内の要素のスナップショットです。しかし、GITはCommitが行われる度に全てのファイルをコピーするのではなく、あるレポジトリ・バージョンから別のレポジトリ・バージョンへの一連の変更として含めます。

**Git commit -m “message”：** -aパラメータは、有効期間内に一度追加されたファイルからレポジトリに変更をコミットする場合に便利です。

ワーキング・ディレクトリ内のファイルがローカル・レポジトリへのコミットに成功したので、次のステップはこれらの変更をリモート・レポジトリへプッシュしてチームの他の人と共有することです。１つ重要なことは、リモート・レポジトリに変更をプッシュする前に、チームメンバーが最近実行した変更があるかどうかを事前にチェックすることが不可欠であると考えられます。しかし、これを行う前に、リモート・レポジトリをローカル・レポジトリにリンクすることが優先事項です。

![図19：レポジトリのリンク](/images/TechNote/Github-on-4D/git-hub-on-4d19.png){: .align-center}

**Git remote add origin “link_to_repo”：** ”origin”という名称のリモート・レポジトリを追加します（初期設定では、originはリモート・レポジトリの定義に使われていましたが、それ以外の名前は問題になりません）。レポジトリのリンクのコピーは下記のようにできます：

![図20：レポジトリのリンクのコピー](/images/TechNote/Github-on-4D/git-hub-on-4d20.png){: .align-center}

GitHubアカウント / 上部右アイコン / repositories / created_repo.からリンクできます。

**Git status**は、ローカル・ブランチをリモートの対応部分（リモート・トラッキング・ブランチ）と比較しますが、これは常にリモート・トラッキング・ブランチが最新であるということではありません。それを確認するには、**git fetch**を実行して、実際にリモート・トラッキング・ブランチをアップデートすることで、ブランチがリモート・レポジトリ（リモート・ブランチ）とともに最新にすることが可能です。

![図21：リモート・トラッキング・ブランチの更新](/images/TechNote/Github-on-4D/git-hub-on-4d21.png){: .align-center}

実行すると、ワーキング・ツリーはコミットもなく、可能な変化もなく、クリーンであることが表示されますが、このケースでは、ローカル・レポジトリに存在しないreadmeファイルを使って、新しく作成されたレポジトリが初期化されました。git pushを実行すると、まさに読んで字の通りのエラー・メッセージが生成されます：

![図22：エラーメッセージ](/images/TechNote/Github-on-4D/git-hub-on-4d22.png){: .align-center}

自動生成されたREADMEは、リモート・レポジトリに存在しますが、ローカルには存在しないので、これは特別なケースです。次のステップでは、リモートからの変更でローカル・レポジトリを更新します。これは基本的に次のコマンドを使って行います。

**Git pull origin remote branchname：** ローカル・レポジトリを使ってリモート・レポジトリから変更をダウンロードしてマージします。

あるいはより洗練された方法として：

**Git fetch remote branchname：** リモート・レポジトリからコンテンツをダウンロードしますが、ローカル・レポジトリにはそれらを統合しません。

＋

**Git merge origin/remote branchname：** git fetchによって取ってきた変更をローカル・レポジトリにマージします。

新しく作成されたレポジトリがREADMEファイルで初期化された場合、シンプルな**git pull**あるいは**git fetch + git merge**は、リモートと同じファイルを使っているローカル・レポジトリを更新できません。関連性のない履歴を持っているからです。

![図23：git ftech+git merge](/images/TechNote/Github-on-4D/git-hub-on-4d23.png){: .align-center}

これを修正するには、**git pull**コマンドを使ったパラメータ（フラッグ）が必要です。

![図24：git pullコマンド](/images/TechNote/Github-on-4D/git-hub-on-4d24.png){: .align-center}

**Git pull origin remote _branchname -allow-unrelated-histories：** これは、レポジトリ間の関連性のない履歴を無視してリモート・レポジトリから引き出されます。これは回避策としてのみ使われるべきです。

最初のプルは完了しましたので、README.mdファイルがプロジェクト・フォルダに追加されたことが分かります。プロジェクトをリモート・レポジトリにプッシュすることが可能になりました。

![図25：README.md](/images/TechNote/Github-on-4D/git-hub-on-4d25.png){: .align-center}

![図26：プロジェクトをプッシュ](/images/TechNote/Github-on-4D/git-hub-on-4d26.png){: .align-center}

全てのファイルの送信に成功していることを確認するためにリモート・レポジトリを見てみましょう。

![図27：リモートレポジトリ](/images/TechNote/Github-on-4D/git-hub-on-4d27.png){: .align-center}

重要：以下のGITコマンドはローカル・ブランチとリモート・ブランチをリンク（逆流）するために必要となりました。このケースでは、ローカル・マスター・ブランチをリモート・マスター・ブランチにこのようにリンクします：

![図28：ローカルとリモートをリンク](/images/TechNote/Github-on-4D/git-hub-on-4d28.png){: .align-center}

一度実行されると、マスター（リモート・メイン・ブランチ）からプッシュやプルがとても簡単になり、シンプルに**git push**あるいは**git pull**をタイプするだけで追加パラメータが無くてもうまくいくはずです。

GItでは、ブランチはシンプルに特定のコミットへのポインターとして定義することができます。機能がまだ開発フェーズにあるときはいつでも、マスターとは別のブランチに変更をプッシュすることは、マスターが常にテスト済みの製品対応バージョンしか保持していないことを考えれば、とても賢明な方法と言えるでしょう。ブランチには２つのタイプがあります：

- ローカル・ブランチ： ワーキング・ツリー内でローカルに可能なブランチ
- リモート・ブランチ： セントラル・レポジトリ上のリモートの対応箇所にローカル・ワークするブランチ

新しいブランチを作成して変換するには、下記のコマンドを使います：

- **Git branch branch name**
- **Git checkout branch name**

**Git checkout -b branch name** も２つのコマンドと同じ効果を持っています。

機能が運用準備されれば、この方法でフィーチャー・ブランチをマスター・ブランチとマージすることができます：

**Git merge source branch**

![図29：フィーチャー・ブランチをマージ](/images/TechNote/Github-on-4D/git-hub-on-4d29.png){: .align-center}

フィーチャー・ブランチとマージする前に、必ず（その中にいる状態の）マスター・ブランチをチェックアウトしてください。この場合、フィーチャー・ブランチは変更されません（したがって「すでに最新の状態」）。


## サンプル・データベース
---

このテクニカル・ノートでは、サンプル・データベースも提供しています。動作環境によって異なる状況や複雑さの詳細を説明しています。

<font color="red">特記１：デモはv17R5で設計しています。プロジェクト・モードが使えるリリースだからです。古いバージョンでは使用できません。</font>

<font color="red">特記２：4Dデータベースを使ったGITのワークフローを完全に把握するために以下のデモ手順にしたがって操作されることをお勧めします。</font>

### Demo 1: リモート・レポジトリとの相互通信

１. プロジェクト・フォルダに移り、git bashを起動（右クリック）
２. **Git ini**を使ってgitレポジトリを初期化
３. <strong>Git remote add origin "link_to_repo"</strong>を使ってリモート・レポジトリを追加
４. **Git branch -set -upstream-to = origin/master master**を使って、リモート・ブランチ・マスターへアップストーム（逆流）のリンクを追加
５. 以下を使用して、プロジェクト・ファイルからローカルでリモートのレポジトリに対してファイルを追加、コミットそしてプッシュします：

- <strong>git add</strong>
- <strong>git commit -m "committing our project folder"</strong>
- <strong>git push</strong>

<strong>git status</strong>コマンドを実行し、ブランチの状態（全てがコミットに成功していること）を確認します。

![図30：git statusコマンドを実行](/images/TechNote/Github-on-4D/git-hub-on-4d30.png){: .align-center}

もしも全てのオペレーションが実行に成功している場合は、このような結果になるはずです。

６. サンプル・データベース、my_4D_project (my_4D_project.4DProject)をv17R5で開きます。
７. メソッド “meth_alert_1”にコメントを加えて修正しましょう。

![図31：meth_alert_1](/images/TechNote/Github-on-4D/git-hub-on-4d31.png){: .align-center}

**git status**を実行して、ワーキング・ツリーに生じた変更を捜査します。

![図32：git statusを実行　ワーキング・ツリー](/images/TechNote/Github-on-4D/git-hub-on-4d32.png){: .align-center}

８. では、ステップ5と同じコマンドを実行して修正を保存しましょう。（コミット・メッセージの変更を試してみます。）一度実行すれば、git statusはトラックされない、あるいはステージされないファイルを返します。

９. 例えば最後のコミットが不完全な場合、それを元に戻すには以下のコマンドが必要です：

<strong>git reset -hard parameter, パラメータは下記のようになります：</strong>

<strong>Git reset -hard HEAD~1：</strong>これは、HEADが現在のブランチを参照することによって、最後のコミットをリセットします。

<strong>Git reset -hard commit_number：</strong>これは、パラメータとして渡された数のコミットまでの全てのコミットをリセットします。最初にやることは、以下のコマンドを使って全てのコミットのリストを得ることです：<strong>git log</strong>

![図33：git log](/images/TechNote/Github-on-4D/git-hub-on-4d33.png){: .align-center}

結果には、ローカル・レポジトリで実行された全てのコミットが重要な詳細（著者、日付、コミット番号…）とともに表示されます。以下を実行するとワーキング・ディレクトリを以前の状態にリセットします：

**Git reset -hard 66148936b9a91903ca2ce2d188a6dddcd3980f5d**

![図34：git reset](/images/TechNote/Github-on-4D/git-hub-on-4d34.png){: .align-center}

リセットされるとコメントが消去されることが分かります。

現在の状況にあるメソッドを使ってリモート・レポジトリをアップデートするのには、最後のプッシュが必要です。シンプルな**git push**を実行しても動作しません。なぜならローカル・ブランチがリモート・ブランチの背後にあるからです（コミットがリセットされたためです）。

![図35：リモート・レポジトリをアップデート](/images/TechNote/Github-on-4D/git-hub-on-4d35.png){: .align-center}

メッセージは、**git pull**の実行を提案していますが、ローカルで実行されたリセットの効果を無効にしてしまいます。これを解決するにはシンプルに下記を実行します：

![図36：git pullの実行](/images/TechNote/Github-on-4D/git-hub-on-4d36.png){: .align-center}

<strong>Git push -force：</strong> tipの設置を無視しながら、ローカル・レポジトリからリモート・レポジトリに変更をプッシュします。

### Demo 2: コンフリクトのマネジメント

複数の開発者が共同作業を行うような環境でバージョン管理システムを使用する場合、最終的なコンフリクトの管理は日常的なジレンマとなります。4Dメソッド/フォームとGITを使用したコンフリクトの例をみてみましょう。これを実行するには、データ・フォルダ　(my_4D_project.4dbase)を複製してセカンダリ・ユーザー/ローカルgitレポジトリをシミュレートする必要があります。

一度重複したら、複製のデータベースをv17R5のセカンド・インスタンスとして開きます（v17R5フォルダを複製する必要はありません。exeファイルをもう一度実行すれば新しいインスタンスを開きます）。

１. 新しいプロジェクト・フォルダに行き、（右クリックで）git bashを実行します。
２. コンフリクトのシミュレーションのために、新しいデータベースのmeth_alert_2を開き、以下のように修正します：

![図37：meth_alert_2](/images/TechNote/Github-on-4D/git-hub-on-4d37.png){: .align-center}

**Git status**を実行すると、修正されたメソッドを探します。これらの新しい変更をコミットしてプッシュしましょう。

![図38：新しい変更をコミット](/images/TechNote/Github-on-4D/git-hub-on-4d38.png){: .align-center}

３. 同時に、ユーザー１が同じメソッドを修正すると決めたので、最初のデータベースの同じメソッドの修正が下記の通りになります：

![図39：同じメソッドの修正](/images/TechNote/Github-on-4D/git-hub-on-4d29.png){: .align-center}

４. 新しい変更をコミットしてプッシュします。

![図40：新しい変更をコミット](/images/TechNote/Github-on-4D/git-hub-on-4d40.png){: .align-center}

リモート・レポジトリが新しいコミットを持っているかどうかを確認するためにgit fetchを実行するのを忘れたことが重要です。この場合、そうせずにプッシュしようとするとエラーが発生します（更新が拒否されました…）。

５. 提案されたように git pullを実行するとコンフリクトが発生します。下記をご覧ください：

![図41：コンフリクトが発生](/images/TechNote/Github-on-4D/git-hub-on-4d41.png){: .align-center}

ユーザー２によって行われた変更をローカルの変更にマージすることは、自動的には解決できませんでした。また、masterという単語がmaster|Mergingに変更されたことにも注意してください。
コンフリクトの解決方法には、次の３つの方法があります：

- Gitのマージツール：GITインストールで実装されるツール。他の多くのマージツールが使用可能で、ダウンロードしてGITに統合することができます。

- マニュアルのマージ：4Dデータベースから全ての要素がテキスト・ファイルとして生成されるので、シンプルなテキスト・エディタ (Notepad…)でコンフリクトのマージは可能です。

- 4Dエディター：これはメソッドにのみ有効です。そのjsonファイルはエディターに正確に表示されるからです。サンプルのフォームは表示されません。そのjsonファイルが4Dによってインタプリタにされてレンダリングされなければならないからです。

６. 三番目のメソッド（4Dエディター）を見ると、このケースではメソッドのコンフリクトを扱っています：

![図42：メソッドのコンフリクト](/images/TechNote/Github-on-4D/git-hub-on-4d42.png){: .align-center}
 
メソッド・エディター内では両方のバージョンが有効であり、HEADがローカルの変更を参照していることと<font color="red">59880bc7363992f3b8b7c9381ccb8521d0a81cd</font>がユーザー2のコミット番号を表していることに気づきます。このコンフリクトを解決するには、シンプルにコードの正確なパートを保つことです。

![図43：コードの正確なパートを保つ](/images/TechNote/Github-on-4D/git-hub-on-4d29.png){: .align-center}

結果的にコンフリクトはシンプルで、コードの正確なパートを拾い、下記のコマンドを実行してコンフリクトの変更とマージを保存します：

![図44：マージの保存](/images/TechNote/Github-on-4D/git-hub-on-4d44.png){: .align-center}

一度実行すれば、ユーザー２は**git pull**を実行するだけで、ユーザー１による新しい変更を得ることができ、両方のユーザーがmeth_alert_2の中に同じコードを持つことができました。

![図45：同じコードを持つ](/images/TechNote/Github-on-4D/git-hub-on-4d29.png){: .align-center}

次は、git mergetoolを使ったメソッドのマージの最初のコンフリクトを素早く見てみましょう。フォームのコンフリクトが発生してしまい解決が必要であると仮定します。（同様にメソッドのコンフリクトも発生します。ステップ2, 3, 4, 5をご覧ください。）ユーザー１とユーザー２の両方が、4Dフォームの”frm_ok_1”で１つのokボタンを含めて修正しました。以下をご覧ください：

ユーザー１
![図46：ユーザー１](/images/TechNote/Github-on-4D/git-hub-on-4d46.png){: .align-center}

ユーザー２
![図47：ユーザー２](/images/TechNote/Github-on-4D/git-hub-on-4d47.png){: .align-center}

ステップ２から５に続けて、下記のステップがgit mergetoolを使ってコンフリクトを解決します。

![図48：フィーチャー・ブランチをマージ](/images/TechNote/Github-on-4D/git-hub-on-4d29.png){: .align-center}

エンターキーを押します：

![図49：スクリーン四分割](/images/TechNote/Github-on-4D/git-hub-on-4d49.png){: .align-center}

スクリーンが４つのゾーンに分割されます：

- 上段左：ローカル・フォームの変更を示すjsonファイル
- 上段右：リモート・フォームの変更を示すjsonファイル
- 上段中央：オリジナル・フォームを示すjsonファイル
- 下段：コンフリクトが解決した後のローカルで保存される最終的なjsonファイル

コンフリクトを解決するために、下段を見てみましょう（修正はここで行われます）：

![図50：下段の表示](/images/TechNote/Github-on-4D/git-hub-on-4d50.png){: .align-center}

以前のサンプル（メソッド）と同様に、jsonはタグで区切られています (<<<<HEAD and >>>>>> commit_number)。Headタグから”======“までがローカルの変更を表し、リモートの変更は”======“で始まりコミット番号のタグまでになります。

ファイルからタグを削除しながら、テキストの希望するパートを保存するだけです。最終的な結果は下記のようになります：

![図51：テキストを保存](/images/TechNote/Github-on-4D/git-hub-on-4d51.png){: .align-center}

修正された点：
- タグを削除
- On versionを保持

### Demo 3：ブランチとスタッシュ（隠す）を使う

ブランチは明らかにGITの主要な機能で、このデモでは基本的なブランチ機能と操作について説明します。

１. プロジェクト・フォルダへ移動して、git bashを実行（右クリック）<br />
２. 新しいブランチを作成してfeature1と名付けます

![図52：feature1を作成](/images/TechNote/Github-on-4D/git-hub-on-4d52.png){: .align-center}

現在のブランチの名称がチェックアウト時に変更されることに注意してください。

- <strong>git branch branch name：</strong>新しいブランチを作成してfeature1と名付ける
- <strong>git checkout branch name：</strong>git ブランチ間のナビゲーションを可能にするように設計されたgitコマンド。特定のブランチをチェックアウトすると、その特定のブランチに保存されているバージョンに適合するようにワーキング・ディレクトリをアップデートします。
- <strong>git checkout -b branch_name：</strong>新しいブランチを作成し操作する（チェックアウト）

３. 新しいメソッドを作成して”new_feature_1”と名付け、あるコードを入力します。

![図53：new feature1を作成](/images/TechNote/Github-on-4D/git-hub-on-4d53.png){: .align-center}

４. ローカルとリモートの両方の変更を保存するには、下記を参照してください：

![図54：ローカルを変更](/images/TechNote/Github-on-4D/git-hub-on-4d54.png){: .align-center}

![図55：リモートを変更](/images/TechNote/Github-on-4D/git-hub-on-4d55.png){: .align-center}

次にリモート・レポジトリに変更をプッシュします。しかし、まだfeature1という名前のリモート・ブランチはありませんので、以下のように行います：

Git push -set-upstream origin feature1：ローカルの変更をリモート・レポジトリにプッシュし、新しくfeature1という名のブランチを作成し、それをそのローカルのレポジトリにリンクします。

新しいブランチはリモート・レポジトリには作成されています。Feature1にはマスター・ブランチと同じファイル+新しく作成されたメソッド (new_feature_1)が含まれます。

![図56：Feature1を作成](/images/TechNote/Github-on-4D/git-hub-on-4d56.png){: .align-center}

また、マスター・ブランチへ切り替えると、新しく作成されたメソッドは存在しないことに注意してください。

![図57：マスター・ブランチに切り替え](/images/TechNote/Github-on-4D/git-hub-on-4d57.png){: .align-center}

new_feature_1メソッドはマスター・ブランチにはまだ存在しません。マスターを変更して、それらを保存しても、feature1ブランチには反映されません。一方から他方へこれらの変更を行う唯一の方法は、マージです。この方法では、各ブランチは想定されるコンテンツのみ含まれ、他には何も含まれません。

![図58：new feature1ブランチをマージ](/images/TechNote/Github-on-4D/git-hub-on-4d29.png){: .align-center}

５. マスター・ブランチを使って、feature1に変更をマージします：

![図59：feature1に変更をマージ](/images/TechNote/Github-on-4D/git-hub-on-4d59.png){: .align-center}

<strong>Git merge feature1：</strong>feature1からマスターへ変更をマージします。new_feature_1メソッドは4Dメソッドへ追加されます。

![図60：4Dメソッドへ追加](/images/TechNote/Github-on-4D/git-hub-on-4d60.png){: .align-center}

<font color="red">重要な特記事項</font>：開発者が最後の２ステップ（４と５）をスキップしてしまったと想像してください。様々な理由で起こり得ることです（コミットの準備ができていない、featureコードが不完全…）。その後、問題点などを修正するためにマスター・ブランチに切り替えます。最初は大丈夫に見えますが、featureブランチから全てのメソッドやファイルを理解しようとすると、マスター・ブランチからは接続できても間違ったブランチにコミットして、プロダクションの失敗やコンフリクトを起こして終了することがあります。</font>

６. featureブランチをチェックアウトして、4Dの中に新しいメソッド、new_feature_2を作成します。マスター・ブランチへ戻り、ブランチのコンセプト全体に対する反対するメソッドがまだ存在することに留意してください。

![図61：feature1ブランチをチェックアウト](/images/TechNote/Github-on-4D/git-hub-on-4d61.png){: .align-center}

![図62：feature2を作成](/images/TechNote/Github-on-4D/git-hub-on-4d62.png){: .align-center}

これは、ブランチ間で切り替えることが必要となるならいつでもgit stashを使って、簡単に保護できます。一方でまだ変更が保留されているのは保存されません。git stashはワーキング・ディレクトリ+インデックスの現状を記録し、ローカルの修正を保存します。

７. <strong>git stash</strong>はGITでトラックされるファイルを保存するだけです。事前に<strong>git add</strong>を実行する必要があります。

![図63：git stashで保存](/images/TechNote/Github-on-4D/git-hub-on-4d63.png){: .align-center}

![図64：git addを実行](/images/TechNote/Github-on-4D/git-hub-on-4d64.png){: .align-center}

８. もう一度マスター・ブランチに切り替えると、メソッドは隠されたため、もう存在しません。

![図65：マスター・ブランチに切り替え](/images/TechNote/Github-on-4D/git-hub-on-4d65.png){: .align-center}

![図66：メソッドなし](/images/TechNote/Github-on-4D/git-hub-on-4d66.png){: .align-center}

９. 保留している機能を戻す準備をするには、フィーチャー・ブランチに切り替えて<strong>git stash apply</strong>を実行して4Dメソッドのnew_fearure_2を得るようにします。

![図67：フィーチャー・ブランチに切り替え](/images/TechNote/Github-on-4D/git-hub-on-4d67.png){: .align-center}

１０. フィーチャー・ブランチは簡単に削除できます：<strong>Git branchi d feature1</strong>。削除される前に異なるブランチ上にある必要があります。

![図68：フィーチャー・ブランチを削除](/images/TechNote/Github-on-4D/git-hub-on-4d68.png){: .align-center}


## 終わりに
---

このテクニカル・ノートでは、GITアークテクチャとその機能について全般的な情報を提供しています。加えて、開発者が経験したことの内容な本物そっくりの状況やコンフリクトが、特定の4Dのコンテキストや使い方に合わせて、段階的に詳細に説明されています。

基本となるGITコマンドの多くは、4D開発者が作業環境で直面するであろうことを描写するたくさんのシナリオで使われていますが、さらに高度なコマンドと技術を駆使して、あらゆるディテールを満たし、技術に精通したあらゆるシニア開発者の渇望を満たすことができます。

新しい4Dファイル・システムでバージョン管理を実装することができ、新たに提供された柔軟性が最大限に活用され、コラボレーションの新しい時代の基礎となります。


## 資料
---

Convert an existing database into a Project. (2019, April 24).  Retrieved May 22, 2019, from https://blog.4d.com/convert-an-existing-database-into-a-project/

4D PROJECT : EMBRACE A NEW ERA OF COLLABORATION. (2019, April 24)  Retrieved May 23, 2019, from https://blog.4d.com/4d-projects-embrace-th-era-of-collaboration/

Git commands. (n.d.). Retrieved May 24, 2019, from http://git-scm.com/doc

Git workflow. (n.d.). Retrieved May 24, 2019, from https://stackoverflow.com

Git Credential Caching on Mac OS X. (2013, August 5).  Retrieved May 22, 2019, from http://tech.lds.org/wiki/Git_Credential_Cachnig_on_Mac_OS_X










