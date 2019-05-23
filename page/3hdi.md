---
layout: page
title: 例題
permalink: /hdi/
icon: download
type: page
---
    
* content
{:toc}

## 17r5 # {#v17r5}

* <i class="fa fa-download" aria-hidden="true"></i> [**ユーザーエイリアスの設定**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_SetUserAlias.zip)<br />
新しく追加された[`SET USER ALIAS`](https://doc.4d.com/4Dv17R5/4D/17-R5/SET-USER-ALIAS.301-4276122.ja.html)コマンドを使って、カレントユーザーのエイリアスが設定できるようになりました。これにともない、[`Current user`](https://doc.4d.com/4Dv17R5/4D/17-R5/Current-user.301-4127469.ja.html)コマンドも拡張され、定数パラメーターを受け渡せるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**データファイルの暗号化**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_Encryption.zip)<br />
データファイルの暗号化機能を紹介します。参考: [データの暗号化](https://doc.4d.com/4Dv17R5/4D/17-R5/Encrypting-data.300-4098282.ja.html)<br />
[`Encrypt data file`](https://doc.4d.com/4Dv17R5/4D/17-R5/Encrypt-data-file.301-4032077.ja.html)
[`Data file encryption status`](https://doc.4d.com/4Dv17R5/4D/17-R5/Data-file-encryption-status.301-4031901.ja.html)
[`Register data key`](https://doc.4d.com/4Dv17R5/4D/17-R5/Register-data-key.301-4072179.ja.html)
[`New data key`](https://doc.4d.com/4Dv17R5/4D/17-R5/New-data-key.301-4070478.ja.html)
[`Discover data key`](https://doc.4d.com/4Dv17R5/4D/17-R5/Discover-data-key.301-4097761.ja.html)
[`ds.provideDataKey( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/dsprovideDataKey.305-4069252.ja.html)
[`ds.encryptionStatus( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/dsencryptionStatus.305-4166703.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: 属性パスのプレースホルダーを使ったクエリ**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_PlaceHolders_AttributePaths.zip)<br />
[`dataClass.query( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/dataClassquery.305-4128666.ja.html)および[`entitySelection.query( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/entitySelectionquery.305-4128676.ja.html)のメンバーメソッドを使う際に、属性パスのプレースホルダーが使えるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: 値の命名プレースホルダーを使ったクエリ**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_PlaceHolders_Values.zip)<br />
[`dataClass.query( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/dataClassquery.305-4128666.ja.html)および[`entitySelection.query( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/entitySelectionquery.305-4128676.ja.html)のメンバーメソッドを使う際に、値の命名プレースホルダーが使えるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**ファイルオブジェクト・フォルダーオブジェクト**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_FilesAndFolders.zip)<br />
新しく追加された[`File`](https://doc.4d.com/4Dv17R5/4D/17-R5/File.301-4280282.ja.html)コマンドと[`Folder`](https://doc.4d.com/4Dv17R5/4D/17-R5/Folder.301-4280288.ja.html)コマンド、およびその戻り値であるファイルオブジェクトとフォルダーオブジェクトを使って、ファイルやフォルダーの操作がオブジェクト記法で簡単にできるようになりました。<br />
参考：[ファイルとフォルダー](https://doc.4d.com/4Dv17R5/4D/17-R5/File-and-Folder.201-4282207.ja.html)<br />

## 17r4 # {#v17r4}

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: バーチャルストラクチャー**](https://github.com/4D-JP/HDI/releases/download/17r4/HDI_4DWP_VirtualStructure.zip)<br />
[`SET FIELD TITLES`](https://doc.4d.com/4Dv17R4/4D/17-R4/SET-FIELD-TITLES.301-4054009.ja.html)および[`SET TABLE TITLES`](https://doc.4d.com/4Dv17R4/4D/17-R4/SET-TABLE-TITLES.301-4054019.ja.html)コマンドで定義したバーチャルストラクチャーが 4D Write Pro 内で利用できるようになりました。<br />
参考：[バーチャルストラクチャーのサポート](https://doc.4d.com/4Dv17R4/4D/17-R4/Managing-expressions.300-4077722.ja.html#4087988)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: レンジ座標の取得**](https://github.com/4D-JP/HDI/releases/download/17r4/HDI_4DWP_MoreCoordinates.zip)<br />
[`WP Get position`](https://doc.4d.com/4Dv17R4/4D/17-R4/WP-Get-position.301-4077777.ja.html)コマンドが拡張され、4D Write Pro ドキュメント内の任意のレンジについて、ページ上の座標を取得できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 垂直ルーラー**](https://github.com/4D-JP/HDI/releases/download/17r4/HDI_4DWP_VerticalRulers.zip)<br />
ページモードで表示された 4D Write Pro エリアで、[垂直ルーラー](https://doc.4d.com/4Dv17R4/4D/17-R4/Using-a-4D-Write-Pro-area.200-4077726.ja.html#4101568)が使えるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: セルの値の設定・取得**](https://github.com/4D-JP/HDI/releases/download/17r4/HDI_4DVP_SetGetCells.zip)<br />
[`VP SET VALUE`](https://doc.4d.com/4Dv17R4/4D/17-R4/VP-SET-VALUE.301-4092966.ja.html)および[`VP Get value`](https://doc.4d.com/4Dv17R4/4D/17-R4/VP-Get-value.301-4100214.ja.html)コマンドによって、4D View Pro ドキュメントのセルの値を設定・取得することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**メール送信**](https://github.com/4D-JP/HDI/releases/download/17r4/HDI_SendMail.zip)<br />
[`SMTP New transporter`](https://doc.4d.com/4Dv17R4/4D/17-R4/SMTP-New-transporter.301-4070576.ja.html)コマンドによって生成した SMTP transporter オブジェクトを使ってメールを送信することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: DOCX形式への書き出し**](https://github.com/4D-JP/HDI/releases/download/17r4/HDI_4DWP_ExportDocx.zip)<br />
[`WP EXPORT DOCUMENT`](https://doc.4d.com/4Dv17R4/4D/17-R4/WP-EXPORT-DOCUMENT.301-4077762.ja.html)および[`WP EXPORT VARIABLE`](https://doc.4d.com/4Dv17R4/4D/17-R4/WP-EXPORT-VARIABLE.301-4077758.ja.html)コマンドを使って、4D Write Pro ドキュメントから[.docx形式への書き出し](https://doc.4d.com/4Dv17R4/4D/17-R4/Exporting-in-docx-format.200-4077720.ja.html)をすることができます。

## 17r3 # {#v17r3}

* <i class="fa fa-download" aria-hidden="true"></i> [**bootstrapと4Dタグ**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_Bootstrap_4DTags.zip)<br />
[4D 変換タグ](https://doc.4d.com/4D-Transformation-Tags.300-3907284.ja.html)をbootstrapと組み合わせて使えば、データを差し込んだ見栄えのするページを簡単に作成することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**アプリケーションの起動パラメーター**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_RelaunchAndTest.zip)<br />
[Database Parameters](https://doc.4d.com/Database-Parameters.302-3905958.ja.html)定数テーマに追加された定数 _User param value_ を使って、データベースをコマンドで起動する際にパラメーターを受け渡すことができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**ネットワークアクティビティ情報**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_GetApplicationInfo.zip)<br />
[`Get application info`](https://doc.4d.com/Get-application-info.301-3921185.ja.html)コマンドを使って、アクティブデータベースと、そのネットワーク設定に関する情報を取得することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**テキスト形式でフォームの書き出し**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_ConvertFormToDynamicForm.zip)<br />
[`FORM Convert to dynamic`](https://doc.4d.com/FORM-Convert-to-dynamic.301-3972173.ja.html)コマンドを使って、4DBファイルに保存された従来の 4DフォームをJSONファイルに変換し、ダイナミックフォームとして使用することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: XLSXファイルのインポート・エクスポート**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_4DVP_ExportToExcel.zip)<br />
[`VP IMPORT DOCUMENT`](https://doc.4d.com/VP-IMPORT-DOCUMENT.301-3935955.ja.html)および[`VP EXPORT DOCUMENT`](https://doc.4d.com/VP-EXPORT-DOCUMENT.301-3935956.ja.html)コマンドを使って、XLSXファイルをインポート・エクスポートすることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**メソッドのオブジェクト化**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_NewFormula.zip)<br />
[`New formula`](http://doc.4d.com/New-formula.301-3958154.ja.html)コマンドを使って、メソッドをオブジェクト化することができます。オブジェクト化されたメソッドは引数として受け渡すことができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: セクションとサブセクションの操作**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_4DWP_ManageSections.zip)<br />
セクションやサブセクションをコマンドにより操作することができます:
[`WP Get section`](https://doc.4d.com/WP-Get-section.301-3921330.ja.html)
[`WP Get sections`](https://doc.4d.com/WP-Get-sections.301-3905004.ja.html)
[`WP SET ATTRIBUTES`](https://doc.4d.com/WP-SET-ATTRIBUTES.301-3920802.ja.html)
[`WP Create subsection`](https://doc.4d.com/WP-Create-subsection.301-3931950.ja.html)
[`WP Get subsection`](https://doc.4d.com/WP-Get-subsection.301-3934758.ja.html)

## 17r2 # {#v17r2}

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: アンカー画像にピクチャー式を設定**](https://github.com/4D-JP/HDI/releases/download/17r2/HDI_4DWP_AnchoredPictureExpressions.zip)<br />
アンカー画像も[ピクチャー式](https://doc.4d.com/Handling-pictures.200-3920761.ja.html#3841026)（変数・フィールド・メソッドなど）によって定義することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: フィールドデータやメソッドを使う**](https://github.com/4D-JP/HDI/releases/download/17r2/HDI_4DVP_DB_Method.zip)<br />
セルへの簡単な記述により、[フィールドへの参照](https://doc.4d.com/Field-references.300-3936010.ja.html)や[プロジェクトメソッドへの参照](https://doc.4d.com/Project-method-references.300-3935962.ja.html)を使用することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: テーブルのページネーション**](https://github.com/4D-JP/HDI/releases/download/17r2/HDI_4DWP_TablePagination.zip)<br />
テーブル (表) が[自動ページネーション](https://doc.4d.com/Using-a-4D-Write-Pro-area.200-3920766.ja.html#3892922)に対応し、テーブルの表示がページをまたぐ場合には行と行のあいだで分割されるようになりました。

## 17 # {#v17}

* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: プログラムによってドキュメントを作成**](https://github.com/4D-JP/HDI/releases/download/17/HDI_4DVP_Offscreen_doc.zip)<br />
4D View Pro ドキュメントはプログラムによっても簡単に作成することができます。<br />
参考: [4D View Pro オブジェクト](https://doc.4d.com/Handling-4D-View-Pro-areas.300-3935959.ja.html#3429183)、[`VP IMPORT FROM OBJECT`](https://doc.4d.com/VP-IMPORT-FROM-OBJECT.301-3935958.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: ストラクチャー情報を使った汎用コード**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Dynamic_Sort_v17.zip)<br />
ORDAによって取得できるストラクチャー情報を利用した、汎用的なコードによる並べ替えツールの例です。
* <i class="fa fa-download" aria-hidden="true"></i> [**コレクション型リストボックスと複階層コレクション**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ListBoxCollection_Advanced_v17.zip)<br />
複数のリストボックスを使い、複階層のコレクションを表示します。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: エンティティセレクションの表示**](https://github.com/4D-JP/HDI/releases/download/17/HDI_EntitySelectionInListbox.zip)<br />
エンティティセレクションをコレクション型リストボックスに表示するために必要となる設定を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: エンティティセレクションの統計情報**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Statistics.zip)<br />
エンティティセレクションの統計情報は[エンティティセレクションのメンバーメソッド](https://doc.4d.com/ORDA-EntitySelection.201-3905932.ja.html)を使って簡単に取得することができます: 
[`entitySelection.sum( )`](https://doc.4d.com/entitySelectionsum.305-3907529.ja.html)
[`entitySelection.min( )`](https://doc.4d.com/entitySelectionmin.305-3907531.ja.html)
[`entitySelection.max( )`](https://doc.4d.com/entitySelectionmax.305-3907532.ja.html)
[`entitySelection.count( )`](https://doc.4d.com/entitySelectioncount.305-3907530.ja.html)
[`entitySelection.average( )`](https://doc.4d.com/entitySelectionaverage.305-3907535.ja.html)
[`entitySelection.distinct( )`](https://doc.4d.com/entitySelectiondistinct.305-3907534.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: エンティティセレクションの論理演算**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Logical_Operators.zip)<br />
エンティティに対する論理演算は[エンティティセレクションのメンバーメソッド](https://doc.4d.com/ORDA-EntitySelection.201-3905932.ja.html)を使っておこなうことができます: 
[`entitySelection.and( )`](https://doc.4d.com/entitySelectionand.305-3907525.ja.html)
[`entitySelection.or( )`](https://doc.4d.com/entitySelectionor.305-3907518.ja.html)
[`entitySelection.minus( )`](https://doc.4d.com/entitySelectionminus.305-3907519.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: エンティティとエンティティセレクションの操作**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Handling_Entities.zip)<br />
エンティティやエンティティセレクションのもっとも基本的な操作の紹介です。<br />
[`dataClass.newSelection( )`](https://doc.4d.com/dataClassnewSelection.305-3907509.ja.html)
[`entitySelection.add( )`](https://doc.4d.com/entitySelectionadd.305-3907516.ja.html)
[`entitySelection.first( )`](https://doc.4d.com/entitySelectionfirst.305-3907520.ja.html)
[`entity.first( )`](https://doc.4d.com/entityfirst.305-3907551.ja.html)
[`entitySelection.last( )`](https://doc.4d.com/entitySelectionlast.305-3907522.ja.html)
[`entity.last( )`](https://doc.4d.com/entitylast.305-3907552.ja.html)
[`entity.previous( )`](https://doc.4d.com/entityprevious.305-3907554.ja.html)
[`entity.next( )`](https://doc.4d.com/entitynext.305-3907553.ja.html)
[`entitySelection.contains( )`](https://doc.4d.com/entitySelectioncontains.305-3907524.ja.html)
[`entity.indexOf( )`](https://doc.4d.com/entityindexOf.305-3907555.ja.html)
[`entitySelection.isOrdered( )`](https://doc.4d.com/entitySelectionisOrdered.305-3907517.ja.html)
[`entitySelection.slice( )`](https://doc.4d.com/entitySelectionslice.305-3907533.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: 楽観的(オプティミスティック)ロック**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Optimistic_Lock.zip)<br />
ORDAの基本仕様である、オプティミスティックロックがどのように動作するかについての説明です。
[`entity.save( )`](https://doc.4d.com/entitysave.305-3907540.ja.html)
[`entity.clone( )`](https://doc.4d.com/entityclone.305-3907549.ja.html)
[`entity.reload( )`](https://doc.4d.com/entityreload.305-3907543.ja.html)
[`entity.drop( )`](https://doc.4d.com/entitydrop.305-3907541.ja.html)
[`entity.touchedAttributes( )`](https://doc.4d.com/entitytouchedAttributes.305-3907548.ja.html)
[`entity.touched( )`](https://doc.4d.com/entitytouched.305-3907547.ja.html)
[`entity.diff( )`](https://doc.4d.com/entitydiff.305-3907546.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: 悲観的(ペシミスティック)ロック**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Pessimistic_Lock.zip)<br />
ORDAでペシミスティックロックを使う方法の紹介です。
[`entity.lock( )`](https://doc.4d.com/entitylock.305-3907542.ja.html)
[`entity.unlock( )`](https://doc.4d.com/entityunlock.305-3907544.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**動的なテーブルフォーム**](https://github.com/4D-JP/HDI/releases/download/17/HDI_JSONTableForm_v17.zip)<br />
JSONファイルや、4D オブジェクト (オブジェクト型変数、あるいはオブジェクト型フィールド) によって[ダイナミックフォーム](https://doc.4d.com/Dynamic-Forms.300-3961476.ja.html)を定義することができます。ここでは、テーブルフォームを動的に生成する例を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: エンティティとオブジェクトの相互変換**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Objects_And_Collections.zip)<br />
エンティティやエンティティセレクションをオブジェクトやコレクションに変換したり、その逆をおこなうメンバーメソッドの紹介です: 
[`entity.toObject( )`](https://doc.4d.com/entitytoObject.305-3907556.ja.html)
[`entitySelection.toCollection( )`](https://doc.4d.com/entitySelectiontoCollection.305-3907523.ja.html)
[`entity.fromObject( )`](https://doc.4d.com/entityfromObject.305-3907557.ja.html)
[`dataClass.fromCollection( )`](https://doc.4d.com/dataClassfromCollection.305-3907510.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: エンティティセレクションとカレントセレクションの相互変換**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Current_Selection_Bridge.zip)<br />
カレントセレクションからエンティティセレクションを作成したり、エンティティセレクションをカレントセレクションに反映させることができます。<br />
[`Create entity selection`](https://doc.4d.com/Create-entity-selection.301-3907527.ja.html)
[`USE ENTITY SELECTION`](https://doc.4d.com/USE-ENTITY-SELECTION.301-3907526.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**コレクション型リストボックス**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ListboxCollection.zip)<br />
[コレクション型リストボックス](http://livedoc.4d.com/4Dv17R3/4D/17-R3/Overview.300-3961394.ja.html#3779401)の設定の仕方、使い方の紹介です。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: クエリ**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Query.zip)<br />
ORDAを使ったクエリ方法の紹介です。<br />
[`entitySelection.query( )`](https://doc.4d.com/entitySelectionquery.305-3907515.ja.html)
[`dataClass.query( )`](https://doc.4d.com/dataClassquery.305-3907505.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ドキュメント要素の一括取得**](https://github.com/4D-JP/HDI/releases/download/17/HDI_4DWP_Elements.zip)<br />
[`WP Get elements`](https://doc.4d.com/WP-Get-elements.301-3920772.ja.html)コマンドを使って、ドキュメントの要素をすべて、あるいは種類別に一度に取得することができます。取得要素はコレクションに格納されて返されます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ドキュメント要素の位置情報**](https://github.com/4D-JP/HDI/releases/download/17/HDI_4DWP_GetPosition.zip)<br />
[`WP Get position`](https://doc.4d.com/WP-Get-position.301-3920816.ja.html)コマンドを使って、ドキュメント要素の位置情報を取得することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 段組レイアウト**](https://github.com/4D-JP/HDI/releases/download/17/HDI_4DWP_MultiColumn.zip)<br />
段組(カラム)レイアウトを使用した例です。<br />
参考: [カラムの管理](https://doc.4d.com/Using-a-4D-Write-Pro-area.200-3920766.ja.html#3751928)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: テキストの取得と挿入**](https://github.com/4D-JP/HDI/releases/download/17/HDI_4DWP_SetGetText.zip)<br />
[`WP Get text`](https://doc.4d.com/WP-Get-text.301-3920815.ja.html)および[`WP SET TEXT`](https://doc.4d.com/WP-SET-TEXT.301-3920814.ja.html)コマンドを使って、テキストの取得や挿入をすることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: コンテキストメニューのカスタマイズ**](https://github.com/4D-JP/HDI/releases/download/17/HDI_4DWriteProContextualMenu.zip)<br />
右クリックで表示されるコンテキストメニューをカスタマイズする方法の紹介です。
* <i class="fa fa-download" aria-hidden="true"></i> [**新しい For each...End for each ループ**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ForEach.zip)<br />
新しく実装された[`For each...End for each`](https://doc.4d.com/For-eachEnd-for-each.300-3907126.ja.html)ループの使用例です。コレクション内の各要素、エンティティセレクション内の各エンティティ、オブジェクト内の各プロパティの反復処理が可能です。
* <i class="fa fa-download" aria-hidden="true"></i> [**フォームデータとFormコマンド**](https://github.com/4D-JP/HDI/releases/download/17/HDI_FormData.zip)<br />
[`DIALOG`](https://doc.4d.com/DIALOG.301-3907158.ja.html)コマンドには、フォームデータを引数として渡すことができるようになりました。渡したオブジェクトはフォームにおいて[`Form`](http://doc.4d.com/Form.301-3907390.ja.html)コマンドによって呼び出すことができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**テキスト形式でデータベースストラクチャーを書き出し**](https://github.com/4D-JP/HDI/releases/download/17/HDI_GET_STRUCTURE_INFO.zip)<br />
[`EXPORT STRUCTURE`](http://doc.4d.com/EXPORT-STRUCTURE.301-3906050.ja.html)コマンド使って、データベースストラクチャー定義をXMLフォーマットで書き出します。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: エンティティの新規作成・更新・削除**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_CRUD.zip)<br />
ORDAにおける、メンバーメソッドを使ったエンティティの基本操作を説明します。<br />
[`dataClass.new( )`](https://doc.4d.com/dataClassnew.305-3907506.ja.html)
[`entity.save( )`](https://doc.4d.com/entitysave.305-3907540.ja.html)
[`entity.drop( )`](https://doc.4d.com/entitydrop.305-3907541.ja.html)
[`entitySelection.drop( )`](https://doc.4d.com/entitySelectiondrop.305-3907513.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**コレクションのクエリ**](https://github.com/4D-JP/HDI/releases/download/16r6/HDI_Collection_Query.zip) (v16r6)<br />
[`collection.query( )`](https://doc.4d.com/collectionquery.305-3730931.ja.html)メンバーメソッドを使ったコレクションのクエリ方法を紹介します。プレースホルダーを使った例、使わない例、比較演算子や、文字列をクエリする際の"@"の扱いなど。
* <i class="fa fa-download" aria-hidden="true"></i> [**コレクションの操作**](https://github.com/4D-JP/HDI/releases/download/16r6/HDI_Collection_Members.zip) (v16r6)<br />
コマンドや、コレクションのメンバーメソッドを使った、コレクションに関わるさまざまな操作の紹介です。<br />
[`Split string`](https://doc.4d.com/Split-string.301-3730754.ja.html)文字列をコレクションに分割します<br />
[`collection.join( )`](https://doc.4d.com/collectionjoin.305-3730935.ja.html)コレクション要素を文字列にします<br />
[`COLLECTION TO ARRAY`](https://doc.4d.com/COLLECTION-TO-ARRAY.301-3730912.ja.html)コレクションを配列に変換します<br />
[`ARRAY TO COLLECTION`](https://doc.4d.com/ARRAY-TO-COLLECTION.301-3730916.ja.html)配列をコレクションに変換します<br />
[`collection.unshift( )`](https://doc.4d.com/collectionunshift.305-3730934.ja.html)コレクションの先頭に要素を挿入します<br />
[`collection.shift( )`](https://doc.4d.com/collectionshift.305-3730933.ja.html)先頭要素を取り出します<br />
[`collection.push( )`](https://doc.4d.com/collectionpush.305-3730914.ja.html)コレクションの末尾に要素を追加します<br />
[`collection.pop( )`](https://doc.4d.com/collectionpop.305-3730923.ja.html)コレクションの最終要素を取り出します<br />
[`collection.map( )`](https://doc.4d.com/collectionmap.305-3730943.ja.html)コレクションの各要素にメソッドを適用します<br />
[`collection.average( )`](https://doc.4d.com/collectionaverage.305-3730922.ja.html)[`collection.sum( )`](https://doc.4d.com/collectionsum.305-3730921.ja.html)[`collection.min( )`](https://doc.4d.com/collectionmin.305-3730928.ja.html)[`collection.max( )`](https://doc.4d.com/collectionmax.305-3730929.ja.html)統計用のメンバーメソッドです<br />
[`collection.insert( )`](https://doc.4d.com/collectioninsert.305-3730915.ja.html)コレクションに要素を挿入します<br />
[`collection.extract( )`](https://doc.4d.com/collectionextract.305-3730938.ja.html)コレクションの各要素の特定のプロパティ値を抽出します<br />
[`collection.find( )`](https://doc.4d.com/collectionfind.305-3730925.ja.html)指定メソッドに引数として渡すとtrueを返す最初の要素を返します<br />
[`collection.filter( )`](https://doc.4d.com/collectionfilter.305-3730926.ja.html)指定メソッドに引数として渡すとtrueを返すすべての要素を返します<br />
[`collection.query( )`](https://doc.4d.com/collectionquery.305-3730931.ja.html)クエリ文字列で指定した条件に合致するすべての要素を返します<br />
[`collection.findIndex( )`](https://doc.4d.com/collectionfindIndex.305-3730946.ja.html)指定メソッドに引数として渡すとtrueを返す最初の要素のインデックスを返します<br />
[`collection.indices( )`](https://doc.4d.com/collectionindices.305-3730939.ja.html)クエリ文字列の条件に合致するすべての要素のインデックスを返します<br />
[`collection.indexOf( )`](https://doc.4d.com/collectionindexOf.305-3730924.ja.html)式と一致する最初の要素のインデックスを返します<br />
[`collection.lastIndexOf( )`](https://doc.4d.com/collectionlastIndexOf.305-3730947.ja.html)式と一致する最後の要素のインデックスを返します<br />
[`collection.count( )`](https://doc.4d.com/collectioncount.305-3730927.ja.html)Nullでない要素の数、オブジェクトプロパティを指定した場合はそれを含む要素の数を返します<br />
[`collection.length`](https://doc.4d.com/collectionlength.303-3730911.ja.html)コレクションの要素の数を返します（これはメンバーメソッドではなく、コレクションのプロパティです）<br />
[`collection.countValues( )`](https://doc.4d.com/collectioncountValues.305-3730917.ja.html)指定した値がコレクション内で見つかった回数を返します<br />
[`collection.copy( )`](https://doc.4d.com/collectioncopy.305-3730930.ja.html)コレクションインスタンスのディープ・コピーを返します<br />
[`collection.slice( )`](https://doc.4d.com/collectionslice.305-3730950.ja.html)指定した開始インデックスから、指定した終了インデックスの一つ前までの要素を返します<br />
[`collection.distinct( )`](https://doc.4d.com/collectiondistinct.305-3730951.ja.html)重複しない要素のみを格納したコレクションを返します<br />
[`collection.equal( )`](https://doc.4d.com/collectionequal.305-3730952.ja.html)二つのコレクションを比較し、要素に相違ない場合はtrueを返します<br />
[`collection.concat( )`](https://doc.4d.com/collectionconcat.305-3730940.ja.html)コレクションの末尾に要素を追加します（二つのコレクションを一つにまとめることができます）<br />
[`collection.every( )`](https://doc.4d.com/collectionevery.305-3730944.ja.html)指定メソッドに引数として渡すとtrueを返す要素だけで構成されたコレクションの場合にtrueを返します<br />
[`collection.some( )`](https://doc.4d.com/collectionsome.305-3730945.ja.html)指定メソッドに引数として渡すとtrueを返す要素が一つ以上コレクションに含まれていればtrueを返します<br />
[`collection.reverse( )`](https://doc.4d.com/collectionreverse.305-3730942.ja.html)すべての要素を逆順に並べ替えます<br />
[`collection.orderBy( )`](https://doc.4d.com/collectionorderBy.305-3730936.ja.html)指定した順番でコレクションの要素を並べ替えます<br />
[`collection.orderByMethod( )`](https://doc.4d.com/collectionorderByMethod.305-3730937.ja.html)指定したメソッドが定義する順番でコレクションの要素を並べ替えます<br />
* <i class="fa fa-download" aria-hidden="true"></i> [**動的なフォーム**](https://github.com/4D-JP/HDI/releases/download/16r6/HDI_JSONForm.zip) (v16r6)<br />
フォームをテキストで表し、4Dオブジェクトや.jsonファイルとして保存することができます。[ダイナミックフォーム](https://doc.4d.com/Dynamic-Forms.300-4201272.ja.html)は、ランタイムにおいて動的に生成されます。
* <i class="fa fa-download" aria-hidden="true"></i> [**共有オブジェクトとStorage**](https://github.com/4D-JP/HDI/releases/download/16r6/HDI_useSharedObjects.zip) (v16r6)<br />
[共有オブジェクトおよび共有コレクション](https://doc.4d.com/Shared-objects-and-shared-collections.300-4179447.ja.html)はプロセス間でコンテンツを共有することができる、特殊なオブジェクトとコレクションです。作成された共有オブジェクト等の一覧は[`Storage`](https://doc.4d.com/Storage.301-4179448.ja.html)コマンドより取得することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: アンカー画像**](https://github.com/4D-JP/HDI/releases/download/16r6/HDI_4DWP_ImageInAbsolutePosition.zip) (v16r6)<br />
[`WP Add picture`](https://doc.4d.com/WP-Add-picture.301-3726324.ja.html)コマンドを使って、4D Write Pro ドキュメントのテキストレイヤーの前面および背面に、[アンカー画像](https://doc.4d.com/Handling-pictures.200-3726275.ja.html#3624752)を追加することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**Twitter Search API との連携**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_TwitterSearchAPI.zip) (v16r5)<br />
[`HTTP Request`](https://doc.4d.com/HTTP-Request.301-4178732.ja.html)コマンドを使って Twitter のアカウント認証と文字列検索を行う方法の紹介です。
* <i class="fa fa-download" aria-hidden="true"></i> [**JSON ポインターの解決**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_JSON_Pointer.zip) (v16r5)<br />
新しく追加された[`JSON Resolve pointers`](https://doc.4d.com/JSON-Resolve-pointers.301-4179124.ja.html)コマンドは、引数として渡されたオブジェクトに含まれるすべての JSON ポインターを解決します。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: 行高さの自動設定**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_4DVP_AutoRowHeight.zip) (v16r5)<br />
新しいリストボックスプロパティ「[自動行高](https://doc.4d.com/List-box-specific-properties.300-4201189.ja.html#3510338)」および「最小行高」「最大行高」が追加されました。<br />
<span style="text-decoration: underline">※ この機能には 4D View Pro ライセンスが必要です。</span>
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: フチなし全面の背景画像**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_4DWP_BackImagePaperBox.zip) (v16r5)<br />
4D Write Pro で[背景](https://doc.4d.com/Using-a-4D-Write-Pro-area.200-3726280.ja.html#3514034)画像をフチなし全面指定できるようになりました。[`WP SET ATTRIBUTES`](https://doc.4d.com/WP-SET-ATTRIBUTES.301-3726313.ja.html)コマンドで[背景属性](https://doc.4d.com/4D-Write-Pro-Attributes.300-3726323.ja.html#3690279)の`wk background clip`と`wk background origin`を`wk paper box`に指定します。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ヘッダーとフッター**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_4DWP_HeadersFooters.zip) (v16r5)<br />
追加された新コマンドにより、ヘッダーとフッターがプログラムにより操作できるようになりました。<br />
[`WP Get header`](https://doc.4d.com/WP-Get-header.301-3726285.ja.html)[`WP Get body`](https://doc.4d.com/WP-Get-body.301-3726287.ja.html)[`WP Get footer`](https://doc.4d.com/WP-Get-footer.301-3726286.ja.html)[`WP Get frame`](https://doc.4d.com/WP-Get-frame.301-3726289.ja.html)[`WP SET FRAME`](https://doc.4d.com/WP-SET-FRAME.301-3726288.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ピクチャー式の使用**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_4DWP_InsertPictureExpression.zip) (v16r5)<br />
4D Write Pro ドキュメントに、[ピクチャー式](https://doc.4d.com/4Dv17R3/4D/17-R3/Handling-pictures.200-3920761.ja.html#3841026)を挿入できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**Get Process Activity**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_GetProcessActivity.zip) (v16r5)<br />
[`Get process activity`](https://doc.4d.com/Get-process-activity.301-4179078.ja.html)コマンドを使って、セッションやプロセスの情報をモニタリングする方法を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックスとヘルプTips**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_ListboxHelpTips.zip) (v16r5)<br />
[`OBJECT SET HELP TIP`](https://doc.4d.com/OBJECT-SET-HELP-TIP.301-4179220.ja.html)および[`LISTBOX GET CELL POSITION`](https://doc.4d.com/LISTBOX-GET-CELL-POSITION.301-4178984.ja.html)コマンドが拡張され、リストボックス内に個別のヘルプTipsを追加できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: リンクの挿入**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_4DWP_Links.4dbase.zip) (v16r5)<br />
[`WP SET ATTRIBUTES`](https://doc.4d.com/WP-SET-ATTRIBUTES.301-3726313.ja.html)コマンドで任意のレンジに`wk link url`を設定し、リンクを挿入する方法を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro プレビュー**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_4DViewProNewFormObject.zip) (v16r4)<br />
4D View Pro ドキュメントの基本操作に必要なコマンドが追加されました。<br />
[`VP NEW DOCUMENT`](https://doc.4d.com/VP-NEW-DOCUMENT.301-3778565.ja.html)[`VP EXPORT DOCUMENT`](https://doc.4d.com/VP-EXPORT-DOCUMENT.301-3778567.ja.html)[`VP Export to object`](https://doc.4d.com/VP-Export-to-object.301-3778568.ja.html)[`VP IMPORT DOCUMENT`](https://doc.4d.com/VP-IMPORT-DOCUMENT.301-3778566.ja.html)[`VP IMPORT FROM OBJECT`](https://doc.4d.com/VP-IMPORT-FROM-OBJECT.301-3778569.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: テーブル (表)**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_4DWritePro_Tables.zip) (v16r4)<br />
4D Write Pro にテーブル (表) を挿入し、表示を整える方法を紹介します。<br />
[`WP Insert table`](https://doc.4d.com/WP-Insert-table.301-3726290.ja.html)[`WP Table append row`](https://doc.4d.com/WP-Table-append-row.301-3726291.ja.html)[`WP Table get columns`](https://doc.4d.com/WP-Table-get-columns.301-3726293.ja.html)[`WP Table get rows`](https://doc.4d.com/WP-Table-get-rows.301-3726292.ja.html)[`WP Table get cells`](https://doc.4d.com/WP-Table-get-cells.301-3726294.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**JSONオブジェクトの評価**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_JSONFileValidation.zip) (v16r4)<br />
新コマンド[`JSON Validate`](https://doc.4d.com/JSON-Validate.301-4179123.ja.html)を使って、任意のJSONオブジェクトが、あらかじめ定義したJSONスキーマに適合するかをチェックすることができます。また、適合しなかった場合のデバッグ用に、要素の位置を特定できるよう[`JSON Parse`](https://doc.4d.com/JSON-Parse.301-4179121.ja.html)コマンドが拡張されました。
* <i class="fa fa-download" aria-hidden="true"></i> [**オブジェクト記法**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_ObjectNotationDatasource.zip) (v16r4)<br />
[オブジェクト記法](https://doc.4d.com/Using-object-notation.300-4179432.ja.html)の使い方を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**オブジェクトとピクチャー属性**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_PictureObjectAttribute.zip) (v16r4)<br />
オブジェクトの属性値にピクチャーを設定できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**標準アクションとマルチステートオブジェクト**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_StandardActionMultiStateObject.zip) (v16r4)<br />
チェックボックス・ポップアップメニュ・ドロップダウンリストなどのマルチステートオブジェクトで標準アクションを利用できるようになり、4D Write Pro 用のカスタムメニューバーが簡単に作成できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**プログラムによる入力順の指定**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_TabbableObjectOrder.zip) (v16r4)<br />
新しいコマンド[`FORM GET ENTRY ORDER`](https://doc.4d.com/FORM-GET-ENTRY-ORDER.301-4179552.ja.html)[`FORM SET ENTRY ORDER`](https://doc.4d.com/FORM-SET-ENTRY-ORDER.301-4179553.ja.html)によってフォーム上のタブ移動による入力順を動的に指定できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**ヘルプTips表示のカスタマイズ**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_Tips.zip) (v16r4)<br />
[`SET DATABASE PARAMETER`](https://doc.4d.com/SET-DATABASE-PARAMETER.301-4179137.ja.html)で`Tips enabled`、`Tips delay`、`Tips duration`の新パラメーターが設定できるようになりました。<br />
参考：[`OBJECT SET HELP TIP`](https://doc.4d.com/OBJECT-SET-HELP-TIP.301-4179220.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**コレクション**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_UseCollections.zip) (v16r4)<br />
[コレクション](https://doc.4d.com/Data-Types.300-4179320.ja.html#3687203)という新しいデータタイプが実装されました。<br />
参考：[コレクションについて](https://doc.4d.com/About-collections.300-4179667.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 標準アクション**](https://github.com/4D-JP/HDI/releases/download/16r3/HDI_4DWP_StandardActions.zip) (v16r3)<br />
4D Write Pro で使える標準アクションが多数実装されました。新コマンド[`INVOKE ACTION`](https://doc.4d.com/INVOKE-ACTION.301-4178618.ja.html)の使用含め、標準アクションを利用する方法を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**新しい標準アクション**](https://github.com/4D-JP/HDI/releases/download/16r3/HDI_NewStandardActions.zip) (v16r3)<br />
新しい標準アクションをスタイル付テキストに適用する方法を紹介します。<br />
新しく追加された[`Get action info`](https://doc.4d.com/Get-action-info.301-4178619.ja.html)コマンドを使って、任意の標準アクションについて、特定のコンテキストにおける利用可能性やステータスなどの情報を取得することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**New Object**](https://github.com/4D-JP/HDI/releases/download/16r3/HDI_NewObject.zip) (v16r3)<br />
オブジェクトを初期化するための新コマンド[`New object`](https://doc.4d.com/New-object.301-4179445.ja.html)が追加されました。従来のコードと新コマンドを使ったコードを比較します。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: LISTBOX SET PROPERTY**](https://github.com/4D-JP/HDI/releases/download/16r2/HDI_ListboxProperties.zip) (v16r2)<br />
新コマンド[`LISTBOX SET PROPERTY`](https://doc.4d.com/LISTBOX-SET-PROPERTY.301-4178995.ja.html)を使って、リストボックスのプロパティをプログラミングにより設定するデモンストレーションです。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: 選択行のハイライト**](https://github.com/4D-JP/HDI/releases/download/16r2/HDI_ManageListboxHightlight.zip) (v16r2)<br />
リストボックスにおける選択行のハイライトがカスタマイズできるようになりました。<br />
参考：[選択行の見た目をカスタマイズ](https://doc.4d.com/Managing-List-Box-Objects.300-4178954.ja.html#3971639)
* <i class="fa fa-download" aria-hidden="true"></i> [**オブジェクトフィールドに基づいた並べ替え**](https://github.com/4D-JP/HDI/releases/download/16r2/HDI_ORDER_BY_ATTRIBUTE.zip) (v16r2)<br />
新コマンド[`ORDER BY ATTRIBUTE`](https://doc.4d.com/ORDER-BY-ATTRIBUTE.301-4178917.ja.html)を使って、オブジェクトフィールド内のプロパティに基づいてセレクションを並べ替えることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**オブジェクト配列のクエリ**](https://github.com/4D-JP/HDI/releases/download/16r2/HDI_QueryByAttribute.zip) (v16r2)<br />
[`QUERY BY ATTRIBUTE`](https://doc.4d.com/QUERY-BY-ATTRIBUTE.301-4178904.ja.html)[`QUERY SELECTION BY ATTRIBUTE`](https://doc.4d.com/QUERY-SELECTION-BY-ATTRIBUTE.301-4178916.ja.html)コマンドが拡張され、オブジェクト配列が含まれているオブジェクトフィールドのクエリが便利になりました。<br />
参考：[配列属性のクエリ引数をリンクする](https://doc.4d.com/QUERY-BY-ATTRIBUTE.301-4178904.ja.html#3181657)

## 16 # {#v16}

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ブックマークの操作**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_Bookmarks.zip)<br />
4D Write Proのブックマーク機能を紹介します。参考：[ブックマークコマンド](https://doc.4d.com/Accessing-document-contents-by-programming.300-3726304.ja.html#3507549)<br />
[`WP CREATE BOOKMARK`](https://doc.4d.com/WP-CREATE-BOOKMARK.301-3726301.ja.html)
[`WP GET BOOKMARKS`](https://doc.4d.com/WP-GET-BOOKMARKS.301-3726300.ja.html)
[`WP Get bookmark range`](https://doc.4d.com/WP-Get-bookmark-range.301-3726302.ja.html)
[`WP DELETE BOOKMARK `](https://doc.4d.com/WP-DELETE-BOOKMARK.301-3726299.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ブックマークの活用例**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_InvoicesAndBookmarks.zip)<br />
実際にブックマークを活用したデモンストレーションです。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 4D式とフィルタリング**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_Filter4DExpressions.zip)<br />
4D Write Proのドキュメントには4D式を挿入できますが、これらはあらかじめ[`SET ALLOWED METHODS`](https://doc.4d.com/SET-ALLOWED-METHODS.301-4179548.ja.html)によって許可されている必要があります。<br />
参考：[4D Write Pro ドキュメントに含める式の制限](https://doc.4d.com/Filter-expressions-contained-in-a-4D-Write-Pro-document.300-3726276.ja.html#2993380)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ドキュメントの操作**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_InsertDoc.zip)<br />
次のコマンドを紹介します：<br />
[`WP New`](https://doc.4d.com/WP-New.301-3726295.ja.html) ドキュメントの新規作成<br />
[`WP INSERT DOCUMENT`](https://doc.4d.com/WP-INSERT-DOCUMENT.301-3726298.ja.html) ドキュメントの挿入<br />
[`WP INSERT BREAK`](https://doc.4d.com/WP-INSERT-BREAK.301-3726296.ja.html) ブレークの挿入<br />
[`WP Get page count`](https://doc.4d.com/WP-Get-page-count.301-3726297.ja.html) 総ページ数の取得
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ピクチャーの挿入**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_InsertPicture.zip)<br />
[`WP INSERT PICTURE`](https://doc.4d.com/WP-INSERT-PICTURE.301-3726303.ja.html)コマンドを使って 4D Write Pro ドキュメントにピクチャーを挿入します。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 印刷**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_Print.zip)<br />
[`WP PRINT`](https://doc.4d.com/WP-PRINT.301-3726306.ja.html)[`WP USE PAGE SETUP`](https://doc.4d.com/WP-USE-PAGE-SETUP.301-3726305.ja.html)コマンドを使った、4D Write Proドキュメントの印刷機能の紹介です。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: プリエンプティブ実行**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_Thread_safety.zip)<br />
ユーザーインターフェースに関わらない 4D Write Pro コマンドはプリエンプティブに実行することができます。文書作成処理をコオペラティブおよびプリエンプティブに実行した場合の処理速度を比較します。<br />
参考：[プリエンプティブ4Dプロセス](https://doc.4d.com/Preemptive-4D-processes.300-4226849.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ビューモード**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_ViewProperties.zip)<br />
4D Write Pro ドキュメントの表示は複数の[ビューモードから選択](https://doc.4d.com/Using-a-4D-Write-Pro-area.200-3048088.ja.html#3052041)できます。
* <i class="fa fa-download" aria-hidden="true"></i> [**オブジェクト型フィールドより重複しないパスや値を取得する**](https://github.com/4D-JP/HDI/releases/download/16/HDI_DISTINCT_ATTRIBUTES.zip)<br />
オブジェクト型フィールドに含まれる重複しないパスや値を取得するためのコマンドを紹介します。<br />
[`DISTINCT ATTRIBUTE PATHS`](https://doc.4d.com/DISTINCT-ATTRIBUTE-PATHS.301-4227275.ja.html)[`DISTINCT ATTRIBUTE VALUES`](https://doc.4d.com/DISTINCT-ATTRIBUTE-VALUES.301-4227274.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**GET PICTURE FORMATS**](https://github.com/4D-JP/HDI/releases/download/16/HDI_GetPictureFormats.zip)<br />
新しく追加されたコマンド[`GET PICTURE FORMATS`](https://doc.4d.com/GET-PICTURE-FORMATS.301-4226801.ja.html)でピクチャーのファイル形式を取得することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: カラム自動リサイズ**](https://github.com/4D-JP/HDI/releases/download/16/HDI_ListboxAutoResizeColumns.zip)<br />
リストボックスに追加された新しいプロパティ ”カラム自動リサイズ” の紹介です。<br />
参考：[カラムの自動リサイズの仕組み]()
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: リアルタイムな On Column Resize イベント**](https://github.com/4D-JP/HDI/releases/download/16/HDI_ListboxOnColumnResize.zip)<br />
フォームイベント[`On Column Resize`](https://doc.4d.com/Form-event.301-4227726.ja.html#3048676)がカラムリサイズ中にリアルタイムで発生するようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: 行高さの指定**](https://github.com/4D-JP/HDI/releases/download/16/HDI_ListboxVariableRowHeight.zip)<br />
新しいコマンド[`LISTBOX SET ROW HEIGHT`](https://doc.4d.com/LISTBOX-SET-ROW-HEIGHT.301-4226911.ja.html)および[`LISTBOX Get row height`](https://doc.4d.com/LISTBOX-Get-row-height.301-4226910.ja.html)を使って、あるいは[行高さ配列](https://doc.4d.com/List-box-specific-properties.300-4253551.ja.html#3070590)を関連付けることで、リストボックスの各行の高さを個別に指定することができます。<br />
<span style="text-decoration: underline">※ この機能には 4D View Pro ライセンスが必要です。</span>
* <i class="fa fa-download" aria-hidden="true"></i> [**キャッシュ管理**](https://github.com/4D-JP/HDI/releases/download/16/HDI_ManageCache.zip)<br />
4D v16ではキャッシュの仕組みが刷新され、[キャッシュ管理](https://doc.4d.com/Cache-Management.201-4226165.ja.html)に役立つ次のコマンドが追加されました。これらのコマンドは64-bit版の4Dで提供されている内部アーキテクチャーに依存しているため、64-bit版でのみ正常に動作します。<br />
[`Cache info`](https://doc.4d.com/Cache-info.301-4226247.ja.html)[`Get cache size`](https://doc.4d.com/Get-cache-size.301-4226248.ja.html)[`SET CACHE SIZE`](https://doc.4d.com/SET-CACHE-SIZE.301-4226249.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**On Mouse Up イベント**](https://github.com/4D-JP/HDI/releases/download/16/HDI_Mouse_Up_Event.zip)<br />
ピクチャーエリアに新しく追加された[`On Mouse Up`](https://doc.4d.com/Form-event.301-4227726.ja.html#3047241)イベントの紹介です。
* <i class="fa fa-download" aria-hidden="true"></i> [**印刷設定の保存**](https://github.com/4D-JP/HDI/releases/download/16/HDI_SavePrintSettings.zip)<br />
4D Packプラグインのコマンドが標準コマンドになりました：[`Print settings to BLOB`](https://doc.4d.com/Print-settings-to-BLOB.301-4226252.ja.html)[`BLOB to print settings`](https://doc.4d.com/BLOB-to-print-settings.301-4226253.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**スレッドセーフ XML コマンド**](https://github.com/4D-JP/HDI/releases/download/16/HDI_ThreadSafe_XMLCommands.zip)<br />
DOM、SAX、XML で始まるコマンドはすべてスレッドセーフです。プリエンプティブ・プロセスで実行することによって、処理速度を上げることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**Webプロセスとプリエンプティブ実行**](https://github.com/4D-JP/HDI/releases/download/16/HDI_WebServerPreemptive.zip)<br />
Webサーバーおよび HTTPクライアント関連のコマンドはすべてスレッドセーフです。プリエンプティブ・プロセスで実行するためには ”プリエンプティブプロセスを使用” という新しいデータベース設定を有効にします。

