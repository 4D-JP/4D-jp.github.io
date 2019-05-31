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

<i class="fa fa-download" aria-hidden="true"></i> [conf19-genealogy.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/genealogy-1.2)

オブジェクト記法を使用して父母・祖父母のデータにアクセスすることができます。

![図: 父母・祖父母のデータにアクセス](https://user-images.githubusercontent.com/10509075/58682524-d48a7200-83ab-11e9-9728-86d150f86880.png){: .align-center}

＜ 図: 父母・祖父母のデータにアクセス ＞
{: .text-center}

リストボックスのカラムには，属性（フィールド）だけでなく，属性を連結した文字列，[``Choose``](https://doc.4d.com/4Dv17/4D/17.1/Choose.301-4178684.ja.html)，リレートフィールドなど，自由に数式（フォーミュラ）をバインドすることができるので，メソッドをまったく記述しなくても，洗練されたデータマトリクスを表示させることができます。

![図: リストボックス](https://user-images.githubusercontent.com/10509075/58682634-57133180-83ac-11e9-90e8-abf24d4accca.png){: .align-center}

＜ 図: リストボックス ＞
{: .text-center}

N to 1リレーションであれば，そのまま同じリストボックスのカラムに，1 to Nリレーションであれば，隣接するリストボックスに表示させることができます。表示されているのはどれも同じテーブルのエンティティセレクションであり，リストボックスのカラム設定はすべて流用されている点に注目してください。

![図: 1 to Nリレーション](https://user-images.githubusercontent.com/10509075/58682812-03edae80-83ad-11e9-9c69-77ce7f80a095.png){: .align-center}

＜ 図: 1 to Nリレーション ＞
{: .text-center}

ビジュアル中心にデータを視覚化することもできます。

![図: 家系図](https://user-images.githubusercontent.com/10509075/58683019-dfde9d00-83ad-11e9-905d-d6947f69bd8d.png){: .align-center}

＜ 図: 家系図 ＞
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
