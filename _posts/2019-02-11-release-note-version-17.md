---
layout: fix
title: "4D v17.1 修正リスト"
date: 2019-02-11 00:00:00
categories: 修正リスト
tags: "17.1" 
build: 232790
version: 17.1

---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0099144 `` OBJECT DUPLICATE``でラジオボタンを既存のグループに所属させることができませんでした。

* ACI0099114 定数``TIFF JBIGB&W``は，無効な文字（アンパーサンド）が含まれているため，コンパイルエラーになりました。

**注記**: 定数名は``TIFF JBIG Black and White``に変更されました。

* ACI0099004 Mac 64ビット版のみ。``On Display Detail``イベントで``OBJECT SET ENTERABLE``を使用し，リストフォーム上のテキスト入力オブジェクト（フィールドまたは変数）を入力不可に設定するようなコードが存在する場合，リスト上でレコードの更新イベント（``On Load Record``）が発生すると，入力不可に設定されたテキスト入力オブジェクトが表示されませんでした。

* ACI0098168 行の高さが``0``に設定されているリストボックスを印刷しようとした場合，アプリケーションがクラッシュしました。

* ACI0097987 ``WA OPEN URL``で``file:///``から始まるローカルファイルURLを開いた場合，スラッシュ記号（``/``）が``%5C``に置換されました。32ビット版のWebエリアであれば，URLの文字列が置換されていても，ページは表示されます。64ビット版のWebエリア（Blink）では，ページが表示されません。

* ACI0097745 Mac 64ビット版のみ。スラッシュ記号 (``/``) が含まれるファイルパスを処理することができませんでした。

* ACI0097687 サーバー管理ウィンドウのプロセスリストに表示されている「プリエンプティブワーカー」の表示がローカライズされていませんでした。`` :xliff:MONI_PROCESS_Type39``と表示されました。

* ACI0099135 テキスト型の変数を使用してBOM（バイトオーダーマーク）付きのUTF-8を``HTTP Get``で受信した場合，冒頭BOM（``0xFEFF``）がそのままテキストに代入されました。BLOBで受信してから``Convert to text``でテキストに変換した場合は問題ありません。

* ACI0099133 Write Proドキュメントに対して``WP Get page count``を使用した場合，結構な時間がかかりました。たとえば，292ページのドキュメントをMojaveで処理した場合は32秒，Windowsで処理した場合でも10秒ほどの処理時間を要しました。

**注記**: 修正により，``WP Get position``のパフォーマンスも向上しました。オフスクリーンドキュメントの場合，ページモードと同じデフォルト設定（背景・ヘッダー・フッターを表示，式を計算）でレイアウトを計算する必要があります。ドキュメントがWYSIWYGモード（フォームオブジェクトのデフォルト）ではなく，ページモードでフォームに表示されている場合，``WP Get page count``, ``WP Get position``, ``WP PRINT``はレイアウトを改めて計算しないようになりました。

* ACI0099126 32ビット版のみ。Welcomeウィザードにアプリケーションのバージョン情報（下段中央）や「ログイン/ログアウト」ボタン，「こんにちは」の文字列などが表示されませんでした。

* ACI0099105 ``QUERY``など，値を返さない式が4D Write Proドキュメントに埋め込まれている場合，からの文字列ではなく，エラー文字列がドキュメントに挿入されました。

* ACI0099095 Mac版のみ。``LDAP LOGIN``にDigestモードで無効な認証情報を渡した場合，アプリケーションがクラッシュしました。

* ACI0099090 17R3で追加された``On Mobile App Authentication``データベースメソッドにコードを記述した後，下記の17.xで開いたストラクチャをコンパイルしようとすると，アプリケーションがクラッシュしました。トラクチャを修復すれば問題は解消されますが，その後，17R3で``On Mobile App Authentication``データベースメソッドを開こうとすると，エラー``-5``が返されました。

* ACI0099069 クライアント/サーバー版のみ。クラシックランゲージの``SAVE RECORD``でレコードを更新した直後にORDAの``get()``メソッドで同じレコードをエンティティとしてロードした場合，最新の値がリロードされないことがありました。ORDAの``query()``メソッドでは問題ありません。数秒の間を置けば，最新の値がリロードされます。

* ACI0099009 Windows クライアント/サーバー版のみ。4D Writeドキュメント（``.4W7``）を``WP PRINT``を使用してサービスとして実行中のサーバー側でPDF出力した場合，空のPDFが作成されることがありました。

**注記**: デフォルトでプリントはDirect2Dモードで実行されますが，サーバーがサービスとして実行されている場合，``SET PRINT OPTION``で``Legacy printing layer option``を``1``に指定したかどうかに関わらず，GDIモードで実行されます。修正により，4D WriteドキュメントのGDIモード　印刷が改良されました。GDIモードは互換性のために残されているだけであり，Direct2DとGDIでは，レンダリングが違うことに留意してください。推奨されているのは，Direct2Dモードです。

* ACI0098964 クライアント/サーバー版のみ。オブジェクト型エンティティのプロパティをORDAの``save()``メソッドで更新することができませんでした。

* ACI0098926 入力フィルターが設定されたフィールドにテキストをペーストした場合に表示されるカーソルの位置が正しくありませんでした。文字列の後ではなく，手前にカーソルが表示されました。

* ACI0098862 クライアント/サーバー版のみ。ソートされたカレントセレクション（レコード数は「1件」）が表示されているリスト型のサブフォームに対して新規レコードを追加した場合，クリック操作でその新規レコードを選択することができませんでした。サブフォーム自体はフォーカスされますが，選択したレコードは消えてしまい，フィールドがフォーカスされません。続けてもう一度レコードを追加すると，うまくゆきます。カレントセレクションがソートされていない場合，あるいはカレントセレクションが2件以上のレコードで構成される場合は問題ありません。

* ACI0098813 64ビット版のみ。クリックレポートのカラムにフィールドを追加した後，右上にあるメニューで「フィールド」を選択した場合，選択したフィールドが正しく表示されませんでした。

* ACI0098791 macOS 10.14 Mojave 64ビット版のみ。デザインモードに切り替えてランタイムエククスプローラーを表示し，ユーザーモードのウィンドウに触れず，ランタイムエクスプローラーのウィンドウをリサイズすると，画面が黒くちらつきました。ツールボックス・フォームエディター・メソッドエディターでも同じ現象が起きます。ユーザーモードのウィンドウに触れた後であれば，問題ありません。
 
* ACI0098575 Mac 64ビット版のみ。メインモニターと外部モニターの間に``Open form window``でウィンドウを表示しようとした場合，ウィンドウが表示されないことがありました。


* ACI0098493 クエリ・統計・ソート・変換等のORDAオペレーションに時間に要している場合（３秒以上），プログレスバーが表示されませんでした。

**注記**: プログレスバーが表示されるのは，下記のメソッドです。

   * ``dataClass.query()``
   * ``entitySelection.query()``
   * ``entitySelection.sum()``
   * ``entitySelection.count()``
   * ``entitySelection.min()``
   * ``entitySelection.max()``
   * ``entitySelection.distinct()``
   * ``entitySelection.avarage()``
   * ``entitySelection.orderBy()``
   * ``entitySelection.toCollection()``
   * ``entitySelection.fromCollection()``
   * ``entitySelection.drop()``

下記のメソッドおよびコマンドは高速なので非対応となっています。

   * ``entitySelection.and()``
   * ``entitySelection.or()``
   * ``entitySelection.minus()``
   * ``entitySelection.slice()`` 
   * ``Create entity selection``
   * ``USE ENTITY SELECTION`` 

リレーションまたはストレージ属性のプロジェクション（``entitySelection.[attribute]``）は直ちに巨大なコレクションを作成するわけではないので，プログレスバーは表示されません。

* ACI0099030 4D Writeドキュメントを4D Write Proに変換した場合，挿入されたフォーミュラー式の日付フォーマットが変わってしまうことがありました。

* ACI0097617 データベース設定の「クライアント/サーバー」ページの「サービスプリンシパル名」の入力エリアを指定したときに表示されるヘルプTipsの内容が設定されていませんでした。``:xliff:csTipsServicePrincipalName``というXLIFFラベルがそのまま表示されました。

* ACI0099077 4D Write Proドキュメントに下揃えのアンカー画像を挿入し，埋め込みモードで表示し，ドキュメントの高さが増減するようにその画像の上にテキストを追加した場合，画像をクリックしたときに表示されるハンドルの位置が移動しませんでした。

* ACI0099056 Windows版のみ。SDIモードで``Movable form dialog box``タイプのウィンドウを``Open form window``および``DIALOG``で表示した場合，タイトルバーをクリックした場合にしかウィンドウが最前面に移動しませんでした。期待されるのは，コンテンツエリアをクリックした場合にもウィンドウが最前面に移動することです。``Plain form window``では問題ありません。

* ACI0098548 データベース設定の『テキスト比較』で日本語の『テキスト検索用の文字列比較を使用する』が有効にされている場合，ORDAの``IN``比較演算子でコレクションを使用したクエリの検索結果が正しくありませんでした。たとえば，

```
$custmers:=ds.Customer.query("name in :1";New collection("太郎";"花子"))
```

のようなクエリを実行した場合，インデックスが設定されていないときはエンティティが返されず，インデックスが設定されているときは「花子」だけが返されます。``IN``演算子を使用せずに同等のクエリを実行した場合，あるいは日本語の『テキスト検索用の文字列比較を使用する』が有効にされていない場合は問題ありません。

* ACI0098770 日本語が入力できないようにフィルターが設定されたリストボックスのセルを編集しているときに，他のアプリケーションやデスクトップにフォーカスを移動し，4Dに復帰した場合，日本語入力モードが有効になりました。Windows版の場合，この状態でテキストを入力すると，独立したIMEウィンドウ上で文字列が編集されました。期待されるのは，日本語入力がオフになることです。

* ACI0098445 メソッドエディター上で半角カタカナが正しく表示されませんでした。たとえば，濁点付きの文字列が含まれる場合，カーソルが文字の真ん中に表示されたりしました。あるいは，行全体を選択した場合，文字列の前半だけがハイライト表示されました。

**注記**: メソッドエディター特有の固定幅表示（カーニングを使用しない）に問題がありました。

---

* ACI0098982 64ビット版のみ。``INVOKE ACTION``の``ak paste``アクションでペースト操作を実行することができませんでした。

* ACI0098967 Mac 64ビット版のみ。ウィンドウを表示しない状態で4D Serverを運用した場合，システムのAppNapによってパフォーマンスが大幅に低下しました。4D ServerにAppNapが適用されていることは，アクティビティモニターで確認することができます。

* ACI0098915 64ビット版のみ。コマンドで追加されたメニュー項目に対して``GET MENU ITEM``を使用した場合，空の文字列が返されました。メニューエディターで追加されたメニュー項目であれば問題ありません。

* ACI0098896 ``LISTBOX SELECT ROW``で選択中の行を削除した場合，リストボックスの『カレント項目位置』プロパティに正しい値が返されませんでした。``0``ではなく，エンティティセレクションのサイズが返されました。

* ACI0098812 ダウンロードパスに``ó``文字が含まれている場合，``Pop3_Download``からエラー``-120``が返されました。

* ACI0098707 64ビット版のみ。統合Webエリアにキーコンビネーションでアクセント文字を入力した場合，文字が結合されませんでした。たとえば``é``ではなく，``´´e``が入力されました。

* ACI0098683 64ビット版のみ。メニューに２本の区切り線を設定した場合，続くメニューアイテムに関連付けられたメソッドが実行されませんでした。区切り線を続けて設定した場合，システムはそれを１個の項目として扱いますが，4Dはそれを２個の項目として扱っているようです。

* ACI0098666 スクロールバーの途中をクリックしてマウスボタンを押したままにした場合，クリックした位置にスクロールが到達しても止まらず，最後（または最初）までスクロールが続きました。リストボックス・テキスト入力エリア・階層リストで問題が発生します。

* ACI0098330 64ビット版のみ。``PICT``形式の画像を``.png``などのフォーマットに変換することができませんでした。

**注記**: ドキュメントが修正されました。64ビット版の制限は，[CONVERT PICTURE](http://doc.4d.com/4Dv17/4D/17/CONVERT-PICTURE.301-3730374.ja.html)に掲載されています。``PICT``画像の変換は，『32ビット版で実行する』必要があることに留意してください。

* ACI0097739 Mac 32ビット版のみ。添付ファイル名が32文字を超える場合，``SMTP_Attachment``からエラー``-43``が返され，添付ファイル無しのメールが送信されました。

**注記**: ドキュメントが修正されました。Mac 32ビット版のファイルパスに関する制限は，[ファイル転送 - 概要](http://livedoc.4d.com/4D-Internet-Commands-15/IC/-.300-2397871.ja.html)に掲載されています。32ビット版のInternet Commandsは，Appleが2011年に``deprecated``とした``FSSpec`` APIを使用しています。現在の上限は63バイトですが，将来のバージョンでは『より厳しい制限が課せられる可能性がある』ことに留意してください。

* ACI0098969 64ビット版のみ。ユーザー認証ダイアログに表示される画像を``LoginImage.png``でカスタマイズした場合，右にある「ユーザー認証」の文字が画像によって隠されませんでした。期待されるのは，32ビット版と同じように，このテキストが表示されないことです。

* ACI0098958 Write Proドキュメントに式が挿入されている場合，``WP Get selection``から正しいレンジが返されませんでした。式から返される値の文字数が勘定されていないようです。

* ACI0098924 ``READ PICTURE FILE``コマンドでPDFファイルを読み込んで``CONVERT PICTURE``で変換した場合，メモリーリークが発生しました。

**注記**: Mac版のメモリーリークはCocoaフレームワークの``autoreleasepool``によるものでした。Windows版の場合，PDFをピクチャとして処理することはできないので，PDFからPNGをコマンドに要求した場合，元の画像がそのまま返されるべきでした。

* ACI0098902 ``WP New``コマンドに未定義のオブジェクト型を引数として渡した場合，アプリケーションがクラッシュしました。

* ACI0098872 Windows版でOEM版のサーバーアプリケーションをビルドした場合，ヘルプメニューが一番左側に表示されました。

*  ACI0098713 『サブレコード追加』標準アクションが設定されたボタンのあるダイアログから新規ウィンドウを表示した場合，そのウィンドウを閉じた後，『サブレコード追加』ボタンの``disabled``状態が解除されませんでした。

* ACI0098636 Windows版のみ。SDIモードのアプリケーションをメインディスプレイで起動し，メインディスプレイの右側に接続された別ディスプレイにもウィンドウを表示して，それぞれの画面にドロップダウンメニューを表示すると，メインディスプレイに表示されるはずのドロップダウンメニューが表示されない，メニューの再描画が非常に遅い，PC全体が遅い，ヘルプ以外のメニューが表示されない，ウィンドウの枠だけが描画される，といった深刻な不具合が発生します。PCを再起動するまで元に戻りません。

* ACI0098537 Mac 64ビット版のみ。システム環境設定でSpotlightのショートカット（``command``+``space``）を無効にした状態で，``ON EVENT CALL``を使用した場合，``command``+``space``や``command``+``à``（フランス語配列キーボード）のような操作をしたときに，ハンドラーメソッド内でシステム変数``KEYCODE``が``0``を返しました。

* ACI0098123 Windows 64ビット版のみ。サーバーの運用中にサマータイム期間が終了した場合，サーバーを再起動するまで，``Current time(*)``から返される時間がサマータイムで返されました。


* ACI0099013 ``$``が含まれるフォーミュラ式（例：``C1/$D1``）が使用されている4D Viewドキュメントを4D View Proにコンバートした場合，フォーミュラ式が正しく変換されませんでした。

* ACI0099012 特定のフォーミュラ式（例：``C1/D1``）が使用されている4D Viewドキュメントを4D View Proにコンバートした場合，フォーミュラ式が正しく変換されませんでした。

* ACI0099010 Mac 64ビット版のみ。エクスプローラーからアイテムをドラッグした場合，アプリケーションがクラッシュしました。

**注記**: macOS SDK 10.14でペーストボードの仕様が変更されたことが関係していました。

* ACI0098913 ``MODIFY SELECTION``を実行したプロセスのメニューバー再描画に問題がありました。``MODIFY SELECTION``のウィンドウを閉じた後，プロセスのメニューとウィンドウのメニューバーが合成された状態になりました。最前面アプリケーションを切り替えれば，問題が解消されます。新規プロセスで``MODIFY SELECTION``を実行すれば問題ありません。

* ACI0098641 インデックスの設定されたオブジェクト型フィールドに対してORDAでクエリを実行した場合，``IN``比較演算子でシーケンシャルクエリが実行されました。

* ACI0098981 クライアント/サーバー版のみ。すでにロックされたエンティティを同一プロセスから再度ロックしてから削除した場合，プロセス終了時にエラーが返されました。スタンドアロン版では問題ありません。

* ACI0099014 64ビット版のみ。CEF版Webエリア内では，矢印キーでカーソルの位置を移動することができませんでした。また，``F9``や``F12``といったファンクションキーも使用できませんでした。

* ACI0099041 4D Viewドキュメントのセルに``=-If(9999<B2;5;0)``のような条件式が含まれている場合，``VP Convert from 4D View``でアプリケーションがクラッシュしました。

* ACI0098745 ヘッダーまたはフッターの高さが``0``に設定された4D Writeドキュメントを4D Write Proに変換した場合，ヘッダーまたはフッターの高さが``0``ではなく，既定の最小値になりました。

* ACI0098739 4D Viewドキュメントを4D View Proに変換しようとした場合，``convert_font_ObjectToText``メソッドのランタイムエラー（ポインターを使用した変数タイプの再定義）が返されることがありました。テキストに設定されたフォントが``PV REMOVE FONT``で削除された場合に問題が発生します。``PV Add font``で足りないフォントを追加すれば問題ありません。

**注記**: 4D Viewと4D View Proの両方が修正されました。

* ACI0098141 macOS 10.13 High Sierraのみ。フォームエディターで階層リストまたはリストボックスオブジェクトを選択した場合，プロパティリストの『アピアランス』ページにあるスクロールバー設定のポップアップメニューの内容が間違っていました。「自動・あり・なし」ではなく，「自動・自動シーケンス番号・インデックス」が表示されました。ただし，使用しているうちに内容が正しくなることもあります。

* ACI0099038 Mac版のみ。``GET PASTEBOARD DATA``コマンドで``dyn.*``タイプのダイナミックデータタイプの内容を取得することができませんでした。たとえば，Finder上のファイルをドラッグ＆ドロップした場合，そのようなネイティブペーストボードタイプが使用されます。

* ACI0099037 Mac版のみ。``GET PASTEBOARD DATA``コマンドで``dyn.*``タイプのダイナミックデータタイプの内容を取得することができませんでした。たとえば，Finder上でファイルをコピーした場合，そのようなネイティブペーストボードタイプが使用されます。

* ACI0099010 Mac 64ビット版のみ。エクスプローラーからアイテムをドラッグした場合，アプリケーションがクラッシュしました。

**注記**: macOS SDK 10.14でペーストボードの仕様が変更されたことが関係していました。

* ACI0098684 シングルクリック編集が有効にされたリストボックスで，一部の列が入力不可に設定されている場合，そのような列を起点にドラッグ＆ドロップ操作を開始することができませんでした。シングルクリック編集が有効にされていなければ問題ありません。

* ACI0099033 数値型のフィールドまたは変数をクリックした場合，値の右側ではなく，左側にキャレットが挿入されました。

* ACI0098781 ``TimePicker``ウィジェットが配置されたフォームを表示すると，``bound variable changed``というメッセージが表示されました。

* ACI0098731 日付フィールドに対するクエリをSQLで実行した場合，正しいレコードが返されないことがありました。

**注記**: SQLエンジンではなく，v17で書き換えられたデータベースエンジンのインデックス評価方式に問題がありました。修正により，v16の方式に戻されました。
