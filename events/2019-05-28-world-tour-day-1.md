---
layout: technote
title: "4D World Tour 2019（１日目）"
author: Keisuke Miyako
date: 2019-05-28 00:00:00
permalink: /event/2019-05-28/
standalone: true
---

## ビジネスアプリケーションの革新的な基盤
---

v17は，革新的なプラットフォームです。v2004やv11も印象的なバージョンでしたが，v17は，アプリケーションがすべての点で飛躍的な進歩を遂げています。

- プログラミング言語（ORDA）
- ユーザーエクスペリエンス（SDI リストボックス ダイナミックフォーム）
- パフォーマンス（キャッシュマネージャー プリエンプティブモード）
- セキュリティ
- 統合ソリューション（4D Write Pro・4D View Pro・4D for iOS）

### Ｒリリース

v14以降，アジャイル開発の手法が採用され，品質管理の体制が強化されています。

- 目標を数週間の小さな仕事（プロジェクト）に分割する
- 責任者・デベロッパー・ドキュメントライター・テスターがチームで開発する
- プロジェクト毎に計画から検証までの開発サイクルを繰り返す
- 定期的にソフトウェアをリリースする
- 期日内にサイクルを完了しなかったプロジェクトはリリースから除外する

アジャイル開発は，ビジネスアプリケーションという分野に特有の課題，つまり「先進性と互換性の両立」を達成する上で役立っています。

- リリース前製品の開発とリリース後製品の保守が明確に仕切られている
- リリース前製品の開発プロジェクトはベータテストで重点的に検証する
- 最新版がもっとも安定性している（経験則に基づく従来の認識は通用しない）

## キャッシュマネージャーの管理
---

v11以降のキャッシュマネージャーは，基本的に32ビット版アプリケーションを想定したデザインでした。

- キャッシュサイズは固定
- 無差別にパージ
- キャッシュサイズの25%単位でパージ
- ``4``から``12``GB程度のサイズを想定
- フラグメンテーションの恐れあり

v16以降の64ビット版は，ハードウェアのポテンシャルを引き出す新しいキャッシュマネージャーを使用しています。

- キャッシュサイズは可変 （[``SET CACHE SIZE``](https://doc.4d.com/4Dv17/4D/17.1/SET-CACHE-SIZE.301-4179631.ja.html)）
- オブジェクトの[優先度](https://doc.4d.com/4Dv17/4D/17.1/Managing-priorities-in-database-cache.300-4179634.ja.html)に応じてパージ
- バイト単位でパージ （[``FLUSH CACHE``](https://doc.4d.com/4Dv17/4D/17.1/FLUSH-CACHE.301-4179629.ja.html)）
- ``100``MBから``100``GB以上まで幅広いサイズを想定
- フラグメンテーションの恐れなし

<i class="fa fa-download" aria-hidden="true"></i> [conf19-manage-cache.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/conf19-manage-cache-1.0)

## ハードウェアの力を使用する
---

プリエンプティブプロセスは，複数のCPUコアに分散して処理を実行することができます。コオペラティブプロセスは，単一のCPUコアで順番に処理を実行することしかできません。プリエンプティブモードを活用すれば，アプリケーションのスケーラビリティ（拡張性）を高めることができます。対応を怠ると，せっかくのハードウェアスペックが宝の持ち腐れになるかもしれません。

対応コマンドは，ドキュメントまたは[``Command name``](https://doc.4d.com/4Dv17/4D/17.1/Command-name.301-4178626.ja.html)で確認することができます。プリエンプティブプロセスは，Unicodeモードが有効にされた64ビット版のコンパイルモードで使用することができます。初期メソッド（新規プロセスまたはワーカーを開始するメソッド）の「プリエンプティブモードで実行可」プロパティが有効にされていれば，コンパイラーが呼び出しチェーンのコマンド/メソッドをチェックします。

## Webサーバーにもっとパワーを
---

Webプロセスの場合，メソッド毎の設定はありません。データベース設定でプリエンプティブモードを有効にすることができます。Webサービスの場合，メソッドのプロパティ「プリエンプティブモードで実行可」を有効にすれば，コンパイラーが呼び出しチェーンのコマンド/メソッドをチェックします。

<i class="fa fa-download" aria-hidden="true"></i> [con19-web-server-preemptive.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/web-server-preemptive-1.0)

## プロセス間のデータ交換
---

プリエンプティブモードでは，インタープロセス変数や[``GET PROCESS VARIABLE``](https://doc.4d.com/4Dv17/4D/17.1/GET-PROCESS-VARIABLE.301-4179335.ja.html)といったテクニックは使用できません。しかし，共有オブジェクト・ストレージ・シグナルを使用すれば，プロセス間のデータ交換ができます。

## 4D Remote のプリエンプティブ
---

新ネットワークレイヤーが有効にされていれば，クライアント側でプリエンプティブプロセスを起動し，ユーザーインタフェースをブロックせずに高度な集計をバックグラウンドプロセスで実行することができます。

### ローカルプロセスのサーバーアクセス

ローカルプロセスまたはローカルワーカーからデータベースにアクセスした場合，あるいは[``Current time (*)``](https://doc.4d.com/4Dv17/4D/17.1/Current-time.301-4179461.ja.html)など，サーバー側との通信が必要なコマンドを実行した場合，そのプロセスを起動したコマンドによってアクセスの方法が違います。

- [``CALL WORKER``](https://doc.4d.com/4Dv17/4D/17.1/CALL-WORKER.301-4179333.ja.html): サーバー側に作成されるツインプロセスと通信
- [``New process``](https://doc.4d.com/4Dv17/4D/17.1/New-process.301-4179077.ja.html)アプリケーションプロセスと通信

### Begin SQL/End SQL

カレントセレクションを変更しないクエリは，ORDAで記述することができます。今後，SQL言語を拡張する予定はありません。しかし，既存をコードをサポートするため，[``Begin SQL``](https://doc.4d.com/4Dv17/4D/17.1/Begin-SQL.301-4179382.ja.html) [``End SQL``](https://doc.4d.com/4Dv17/4D/17.1/End-SQL.301-4179383.ja.html)ブロックがプリエンプティブモード対応になりました。

具体的には，SQLで使用されている変数・テーブル・メソッド名をコンパイラーが抽出してチェックします。インタープロセス・トリガ・呼び出し連鎖のチェックにパスすれば，そのメソッドはスレッドセーフです。ローカルスキーマに存在しないテーブルのトリガはチェックされません（トリガをSQLで作成することはできないため）。

[``EXECUTE IMMEDIATE``](https://doc.4d.com/4Dv17/4D/17/EXECUTE-IMMEDIATE.300-3786781.ja.html)の変数/メソッドは，SQL実行前にもう一度ランタイムがチェックします。

#### 用途

- ローカルデータベース
- C/Sアプリケーション
- エクスターナルデータベース（[``USE DATABASE``](https://doc.4d.com/4Dv17/4D/17/USE-DATABASE.300-3786769.ja.html)）

#### 非サポート

- ODBC
- [``SELECT INTO :LISTBOX``](https://doc.4d.com/4Dv17/4D/17.1/Managing-List-Box-Objects.300-4178954.ja.html#429187)
- [``QUERY BY SQL``](https://doc.4d.com/4Dv17/4D/17.1/QUERY-BY-SQL.301-4179375.ja.html)
- [``REPLICATE``](https://doc.4d.com/4Dv17/4D/17/REPLICATE.300-3786790.ja.html) [``SYNCHRONIZE``](https://doc.4d.com/4Dv17/4D/17/SYNCHRONIZE.300-3786772.ja.html)
- [``SQL LOGIN``](https://doc.4d.com/4Dv17/4D/17.1/SQL-LOGIN.301-4179385.ja.html)

## データ視覚化の新しい方法
---

ORDAには，いろいろな側面があります。

- プログラミング言語
- データバインディング（＝視覚化）
- データアクセス（クライアント/サーバー・4D for iOS・コネクター構想）

ORDAは新しいパラダイムです。従来のランゲージでも，データのアクセスと表示はできますが，リレーショナルデータベースとオブジェクト指向データベースの利点を組みあわせたORDAを使用すれば，ほんの数行で複雑なデータを直感的に視覚化することができます。

### 家系図

<i class="fa fa-download" aria-hidden="true"></i> [conf19-genealogy.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/genealogy-1.3)

オブジェクト記法を使用して父母・祖父母のデータにアクセスすることができます。

![図: 父母・祖父母のデータにアクセス](https://user-images.githubusercontent.com/10509075/58682524-d48a7200-83ab-11e9-9728-86d150f86880.png){: .align-center}

＜ 図: 父母・祖父母のデータにアクセス ＞
{: .text-center}

リストボックスのカラムには，属性（フィールド）だけでなく，属性を連結した文字列，[``Choose``](https://doc.4d.com/4Dv17/4D/17.1/Choose.301-4178684.ja.html)，リレートフィールドなど，自由に数式（フォーミュラ）をバインドすることができるので，メソッドをまったく記述しなくても，洗練されたデータマトリクスを表示させることができます。

![図: リストボックス](https://user-images.githubusercontent.com/10509075/58682634-57133180-83ac-11e9-90e8-abf24d4accca.png){: .align-center}

＜ 図: リストボックス ＞
{: .text-center}

N to 1リレーションであれば，そのまま同じリストボックスのカラムに，1 to Nリレーションであれば，隣接するリストボックスに表示させることができます。表示されているのはどれも同じテーブルのエンティティセレクションであり，リストボックスのカラム設定はすべて流用されている点に注目してください。

![図: 1 to Nリレーション](https://user-images.githubusercontent.com/10509075/58747425-2b747200-84a6-11e9-868e-9b196632b878.png){: .align-center}

＜ 図: 1 to Nリレーション ＞
{: .text-center}

ビジュアル中心にデータを視覚化することもできます。

![図: 家系図](https://user-images.githubusercontent.com/10509075/58683019-dfde9d00-83ad-11e9-905d-d6947f69bd8d.png){: .align-center}

＜ 図: 家系図 ＞
{: .text-center}

## ファイルメーカー Data APIとの連携
---

<i class="fa fa-download" aria-hidden="true"></i> [fmdemo.4dbase.zip, 顧客名簿.fmp12.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/file-maker-1.0)

FilerMaker Server 17 Data APIは，JSONリクエストを受信してJSONレスポンスを返すRESTful APIです。``HTTP Request``でデータを受け取り，ORDAでリストボックスに表示することができます。

ファイルメーカー Data APIを有効にするための手順は，下記のとおりです。

- 完全アクセス権のパスワードを設定する
- 「データ入力のみ」のアカウントを作成し，パスワードを設定する
- 「管理 > セキュリティ > 詳細設定 > 拡張アクセス権」で「データ入力のみ」にData APIのアクセス権を付与する

### サーバー管理

FilerMaker Serverは，Webから管理することができます。

```
https://localhost:16000/
```

``http://localhost:16001/``（ポート番号が違う）ではないことに注意してください。

コマンドラインインタフェース（CLI）で制御することもできます。

```
fmsadmin restart adminserver
fmsadmin list files
fmsadmin remove 
fmsadmin close
```

## サーバーに注目 
---

サーバー管理画面の情報やアクションは，どれも標準コマンドで実現できるようになりました。たとえば，Web版のサーバー管理画面をデザインすることができます。

<i class="fa fa-download" aria-hidden="true"></i> [conf19-admin-demo.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/admin-demo-1.0)

![図: サーバー管理画面](https://user-images.githubusercontent.com/10509075/58761549-88445b00-8580-11e9-90c3-f0ebe8a76445.png){: .align-center}

＜ 図: サーバー管理画面 ＞
{: .text-center}

## リストボックス：UIのキー・ツール
---

<i class="fa fa-download" aria-hidden="true"></i> [conf19-tips-meteo.4dbase.zip, conf19-data-driven-row-height.4dbase.zip
](https://github.com/4D-JP/event-world-tour-2019/releases/tag/listbox-1.0)

![図: ヘルプTips](https://user-images.githubusercontent.com/10509075/58761735-677d0500-8582-11e9-8cec-57fc984cd7c4.png){: .align-center}

＜ 図: ヘルプTips ＞
{: .text-center}

![図: 行の高さ自動計算](https://user-images.githubusercontent.com/10509075/58761718-44eaec00-8582-11e9-893f-e8ea1604b43f.png){: .align-center}

＜ 図: 行の高さ自動計算 ＞
{: .text-center}

## ダイナミックフォームのパワーを発掘しましょう
---

フォームの表示・印刷・組み込み（``OBJECT SET SUBFORM``）コマンドは，フォーム名の代わりにファイルパスまたはオブジェクト型が渡せるようになりました。

フォームをJSONファイルで管理すれば，メールでデザインの交換や共有ができるだけでなく，コンパイルモードでも柔軟にカスタマイズすることができます。

## SDIモード：Windows版4Dアプリケーションの新しい時代
---

Windowsプラットフォームでシングル・ドキュメント・インタフェース（SDI）モードのアプリケーションをビルドすることができるようになりました。

<i class="fa fa-download" aria-hidden="true"></i> [conf19-sdi-final-application.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/sdi-final-application-1.0)

![図: SDIモード](https://user-images.githubusercontent.com/10509075/58692735-3659d480-83ca-11e9-9196-9e391e9b6d96.PNG){: .align-center}

＜ 図: SDIモード ＞
{: .text-center}

## これまでのバイナリーフォームも無駄にはなりません
---

``Open form window`` ``DIALOG``のようなコマンドには，フォーム名の代わりにオブジェクト型やJSONファイルパスを渡すことができます。そのようなフォームは，プログラミングで内容をダイナミックに変えることができます。

<i class="fa fa-download" aria-hidden="true"></i> [conf19-dynamic-form.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/dynamic-form-1.0)

- エディターで作成したフォームをダイナミックフォームとして使用する

```
$TEST:=FORM Convert to dynamic("TEST")
$TEST.pages[1].objects.ClickMe.text:="Click Me!"
$w:=Open form window($TEST)
DIALOG($TEST)
CLOSE WINDOW($w)
```

- レコードに保存したフォームをダイナミックフォームとして使用する

```
C_OBJECT($e;$TEST)
$e:=ds.FORM.query("name = :1";"TEST")
If ($e.length#0)
  $TEST:=$e[0].data
  $TEST.pages[1].objects.ClickMe.text:="Click Me!"
  $w:=Open form window($TEST)
  DIALOG($TEST)
  CLOSE WINDOW($w)
End if 
```

- エディターで作成したフォームをJSONフォームとして使用する

```
C_POINTER($NIL)
$path:=exportForm ($NIL;"TEST")
$w:=Open form window($path)
DIALOG($path)
CLOSE WINDOW($w)
```

ピクチャやメソッドもエクスポートされている点に注目してください。

## 文書や請求書を作成
---

4D Write Proで作成したドキュメントは，DOCX PDF HTML形式でエクスポートできるようになりました。インライン画像・背景画像・アンカー画像もエクスポートされるので，広告文書やカタログなどの編集にも活用できます。

<i class="fa fa-download" aria-hidden="true"></i> [conf19-write-pro.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/write-pro-1.0)

![図: 文書や請求書を作成](https://user-images.githubusercontent.com/10509075/58693596-19260580-83cc-11e9-8444-fa08ad5f638b.png){: .align-center}

＜ 図: 文書や請求書を作成 ＞
{: .text-center}

エクスポートしたDOCXは，Word 2010以降で開くことができます。エクスポートされるのは，下記の要素です。

- 本文
- ヘッダー
- フッター
- セクション
- ページ設定
- プリント設定
- インライン画像
- 背景画像
- アンカー画像（ビューモードは画面上のレンダリングに依存するため除外）
- ブックマーク
- 変数・フィールド・メソッド・計算式（確定値）
- ``Current date`` ``Current time`` ``$wp_``数式はWordフィールドに変換

<i class="fa fa-external-link" aria-hidden="true"></i> [ドキュメント](https://doc.4d.com/4Dv17R4/4D/17-R4/Exporting-in-docx-format.200-4077720.ja.html)

## メニューをカスタマイズ
---

Write Proのユーザーインタフェースは，かなりの部分が標準アクションだけで制御できるようになっており，メニューバーやコンテキストメニューを最小限のコーディングで構築することができます。

## Microsoft Excel形式に対応
---

4D View Proは，Viewライセンスでアンロックされる上級フィーチャーの総称です。これには，拡張リストボックスとスプレッドシートの両方が含まれます。スプレッドシート部分であるView Proエリアは，定評あるJavaScriptライブラリをベースにしています。

<i class="fa fa-download" aria-hidden="true"></i> [conf19-view-pro.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/view-pro-1.3)

![図: 4D View Pro](https://user-images.githubusercontent.com/10509075/58761602-3ea84000-8581-11e9-97c9-d9af381c72df.png){: .align-center}

＜ 図: 4D View Pro ＞
{: .text-center}

## プログラミングによって文書と対話する
---

View Proエリアには，4Dへの架け橋となるコンポーネントメソッドが存在するので，JavaScriptを知らなくても，オブジェクト型を主体としたネイティブランゲージでコーディングすることができます。

フィールドやメソッドは，カスタム数式としてスプレッドシートにエクスポートすることができます。バーチャルストラクチャで明示的に公開したフィールド，コマンドで許可したメソッドだけが参照できるので，不正アクセスの心配はありません。

引数はJavaScriptから4Dタイプに変換され，戻り値はJavaScriptで扱える形式に変換されたものがスプレッドシートに返されます。ピクチャ型の戻り値はPNG形式のデータURIに変換されてセルの背景画像になります。

## 4D Viewからの変換
---

4D Viewプラグインで作成した文書は，変換してそのまま使用することができます。Viewドキュメント（4PV）はバイナリ形式のブラックボックスでしたが，View Proドキュメントは純粋なJSONオブジェクトなので，完全にオープンです。

## アプリ開発に経験は不要
---

<i class="fa fa-download" aria-hidden="true"></i> [conf19-ios.zip](https://github.com/4D-JP/event-world-tour-2019/releases/download/ios-1.0/conf19-ios.zip)

リストフォームの検索エリアには，複数のフィールドがドロップできるので，FirstNameまたはLastNameまたはJobまたはCompanyで検索させることができます。

![図: リストフォーム](https://user-images.githubusercontent.com/10509075/58739218-2252b900-8444-11e9-8475-bbf1b2f60c56.png){: .align-center}

＜ 図: リストフォーム ＞
{: .text-center}

4D for iOSは，舞台上でORDAを使用しているので，リスト画面にはサムネイル，詳細画面にはN to 1リレーションで結ばれた写真を表示させることができます。

![図: 詳細フォーム](https://user-images.githubusercontent.com/10509075/58739264-53cb8480-8444-11e9-9429-a6ad03e284ca.png){: .align-center}

＜ 図: 詳細フォーム ＞
{: .text-center}

## 制限付きクエリ
---

<i class="fa fa-download" aria-hidden="true"></i> [conf19-ios-restricting-query.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/ios-restricting-query-1.0)

![図: アカウントマネージャー](https://user-images.githubusercontent.com/10509075/58738718-f46c7500-8441-11e9-9eb0-7cb7f6887ca1.png){: .align-center}

＜ 図: アカウントマネージャー ＞
{: .text-center}

この場合のクエリとは，検索するというよりも，データベースにフィルターをかけることにより，デバイスからアクセスできるレコードを制限（フィルター）することを意味します。たとえば，アカウントマネージャー（営業担当者）に持たせるアプリに下記のような制限付きクエリを設定することができます。

- 交渉が進行中の顧客だけを表示させたい
- 自分が担当している顧客だけを表示させたい

- 公開：ログインを有効にする
- データ：クエリをフィルター（ORDAで記述します）

```
StatusForContract.Name = '処理中' & ManagerForContract.Email= :email
```

![図: 認証](https://user-images.githubusercontent.com/10509075/58738458-cd617380-8440-11e9-8031-4b08fab721ba.png){: .align-center}

＜ 図: 認証 ＞
{: .text-center}

![図: 制限付きクエリ ](https://user-images.githubusercontent.com/10509075/58738791-3e555b00-8442-11e9-8c55-7b1f5232942e.png){: .align-center}

＜ 図: 制限付きクエリ ＞
{: .text-center}

## プルトゥリフレッシュ
---

<i class="fa fa-download" aria-hidden="true"></i> [conf19-ios-pull-to-refresh.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/ios-pull-to-refresh-1.0)

![図: タスク](https://user-images.githubusercontent.com/10509075/58737493-bde02b80-843c-11e9-95fa-31978118fc7e.png){: .align-center}

＜ 図: タスク＞
{: .text-center}

リストフォームを下に引っ張れば，デバイス側のデータベースをアップデートすることができます。ネットワーク通信は最適化されており，追加・更新・削除されたレコードだけがサーバーから送信されるようになっています。

- リストフォーム：/RESOURCES/Mobile/form/list/TasksCollection v1/

![図: プルトゥリフレッシュ](https://user-images.githubusercontent.com/10509075/58738261-f3d2df00-843f-11e9-96b2-39adc2ec5965.png){: .align-center}

＜ 図: プルトゥリフレッシュ ＞
{: .text-center}

### スワイプトゥリフレッシュ

リストフォームを左にスワイプしたときに実行されるアクションを設定すれば，デバイスからレコードを更新することができます。

- リストフォーム：/RESOURCES/Mobile/form/list/TasksList/
- フォーマッター：/RESOURCES/Mobile/formatters/プライオリティー文字列/
- フォーマッター：/RESOURCES/Mobile/formatters/ステータス文字列/
- アイコン：/RESOURCES/Mobile/medias/icons/doneIcon.png
- アクション：setProgress100

![図: スワイプトゥリフレッシュ](https://user-images.githubusercontent.com/10509075/58738040-0e588880-843f-11e9-9ebc-51620bd2e8b2.png){: .align-center}

＜ 図: スワイプトゥリフレッシュ ＞
{: .text-center}

### カスタムフォーマッター

数値ではなく，アイコンで表現すれば，プライオリティーやステータスを表現すれば，情報を直感的に伝えることができます。

- リストフォーム：/RESOURCES/Mobile/form/list/TasksCollection v2/
- フォーマッター：/RESOURCES/Mobile/formatters/プライオリティーアイコン/
- フォーマッター：/RESOURCES/Mobile/formatters/ステータスアイコン/

![図: カスタムフォーマッター](https://user-images.githubusercontent.com/10509075/58737886-490df100-843e-11e9-9960-808800976a6b.png){: .align-center}

＜ 図: カスタムフォーマッター ＞
{: .text-center}

## オフラインと安全性
---

作成したアプリには，エクスポートされたデータがプリインストールされており，オフラインでも使用することができます。画像ファイルは，サイズと通信費を節約するため，プリインストールされていませんが，必要に応じてダウンロードされます。

追加・更新されたレコードだけをシンクロするため，4D for iOSでエクスポートしたテーブルには，``__GlobalStamp``という管理フィールドが自動的に追加されます。また，削除されたレコードを追跡するため，``__DeletedRecords``という管理テーブルもストラクチャに追加されます。

## Xcodeはさらなる可能性を提供
---

4D for iOSは，純粋なXcodeプロジェクトをエクスポートし，自動的にビルドした後，シミュレーターで起動します。デバイスが接続されており，Apple Configurator 2がインストールされていれば，アーカイブ（ipa）の書き出しからインストールも自動的です。

デバイスが接続されていない場合，あるいはApple Configurator 2がインストールされていない場合，Xcode > window > Devices and Simulatorメニューから手動でインストールすることになります。

### ビルドログの場所

詳細なビルドログは下記の場所に出力されます。

```
$HOME/Library/Caches/com.4d.mobile/lastBuild.xlog
```

## ベーシックから脱却
---

4D for iOSには，洗練されたテンプレートが収録されています。テンプレードの仕様は公開されており，必要であれば，自分でカスタマイズすることもできます。

## シンプルなライセンス
---

無料のApple IDとMacとiPhoneさえあれば，iOSアプリの開発・シミュレーターでの検証・デバイスでのテスト（USB経由でインストール）ができます。（13歳以上）

Appleの規約 4.2.6によれば，半自動的なプロセスで開発されたiOSアプリ，あるいはテンプレートから作られたiOSアプリは，個別のアカウントでストアに出品することが求められています。開発から出品まで代行するのであれば，エンドユーザーに開発者アカウントを作成してもらうと良いでしょう。

<i class="fa fa-external-link" aria-hidden="true"></i> [developer.apple.com](https://developer.apple.com/app-store/review/guidelines/)

デベロッパーメンバーシップに加入すれば，ストア経由で配付ができます。（年会費：11,800円）エンタープライズなら，ストアを経由しないで配付ができます。（年会費：37,800円）プログラムは，相互に排他的ではなく，両方に加入するメリットもあります。

