---
layout: fix
title: "4D v18r3 修正リスト"
date: 2020-07-09 08:00:00
categories: 修正リスト
tags: 18r3  
build: 253987
version: 18r3

---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0100997 ODBCアドミニストレーターで4Dをデータソースとして登録することができませんでした。ODBCドライバーの名前が変更されているためです。

**注記**: フィーチャーリリース版のODBCドライバーは「4D v18 Rx ODBC Driver 64-bit」のような名称であるのに対し，ロングタイムサポート版（LTS）の名称は「4D v18 ODBC Driver 64-bit」となっています。これは，インストーラーが互いのドライバーを上書きしないようにするための措置でした。問題は，Rバージョンのドライバー本体がこの命名規則を考慮していなかったことが原因でした。つまり，LTS版のドライバーだけをインストールすれば，RバージョンもODBCアドミニストレーターでデータソースとして登録することができます（両者のODBCドライバーには互換性があります）。修正により，RバージョンのドライバーはRバージョンのパスを参照するようになりました。

* ACI0100668 Mac版プロジェクトモードのみ。ツールボックスのメニュータブを開いた状態で，別のアプリケーションを最前面に移動してから4Dに復帰した場合，ツールボックスの右側に表示されるメニューバーの内容がおかしくなりました。

* ACI0100981 Write Proに改行だけを返すメソッドが数式として改行の直前に挿入されている場合，フッターで``This.pageCount``というフォーミュラを評価すると，アプリケーションがクラッシュしました。

* ACI0100970 プロジェクトモードのみ。``On Load``イベントで``OBJECT DUPLICATE``を使用し，非表示のリストボックスで複製した場合，フォームを閉じると同時にアプリケーションがクラッシュしました。

* ACI0100943 サーバーをサービスとして起動し，クライアント側でサーバー管理画面を表示しようとした場合（例：``OPEN ADMINISTRATION WINDOW``），エラーが表示されました。Designerにパスワードが設定されていなければ問題ありません。

* ACI0100989 Windows版のみ。ダウンロードしたインストーラーの開発元が「4D SAS」ではなく「未確認」と表示されました。

* ACI0100715 ORDAでエンティティの１対Ｎリレーションを使用した場合，メモリーリークが発生しました。シングルユーザー版とクライアント/サーバー版の両方で問題がありますが，サーバー側のほうが顕著でした。

* ACI0100707 4D WriteドキュメントをWrite Proに変換した場合，特定の数式が変換されずに失われました。

* ACI0100680 Retina高解像度ディスプレイとそうではないディスプレイの間でウィンドウを移動した場合，フォームの背景が表示されなくなりました。

* ACI0100571 メールサーバーがExchangeまたはdovecotの場合，``POP3 Transporter``がフリーズしました。GMailでは問題ありません。

* ACI0100702 4D WriteプラグインをWrite Proに変換した場合，スタイルシート名のアクセント文字（``Ä`` ``Ö`` ``Ü`` ``ß``）およびアンダースコア記号（``_``）が失われました。

* ACI0100693 ``Get system info``から返されるオブジェクトの``uptime``プロパティは，``MAXLONG/512`` （``4194304``）の倍数に達するたびにリセットされて``0``に戻りました。つまり，``Tickcount/60 ``がそのまま返されています。コンピューターの稼働時間を約``49``日までしか計測することができません。

* ACI0100692 トランザクション中にORDAで保存されたエンティティを削除しようとした場合，「スタンプが変更された」という理由で削除ができませんでした。従来の``START TRANSACTION``とORDAの``ds.startTransaction()``，どちらの方法でトランザクションを開始しても，問題が発生します。

* ACI0100686 Mac版のみ。4D for iOSで公開したテーブルに対し，「データ」セクションでフィルターを記述エリアに``command``+``A``を入力してからフィールドを選択した場合，アプリケーションがクラッシしました。

* ACI0100685 Mac版のみ。プラットフォームにXcodeがインストールされていない場合，4D for iOSを起動すると「{app} をインストールしますか」という不完全なメッセージが表示されました。

* ACI0100684 ``SMTP New transporter``で送信したメールの``Message-ID``ヘッダーフィールドは，``RFC 2822``に準拠していないため，SpamAssassinなどのスパムフィルターにより，迷惑メールと判定されることがありました。RFCによれば，メッセージの識別子は一意でなければならず，そのために``@``をはさんで左側に識別子，右側にドメイン名を含めることが勧められています。4Dは，UUIDを使用しているため，一意の識別子ではありますが，ドメイン名がありませんでした。

* ACI0100683 フォーマットを指定せずに日付を4D View Proドキュメントに挿入した場合，カレントのロケールではなく，米国式（``mm/dd/yyyy``）が採用されました。

* ACI0100679 プロジェクトモードでは，メソッドのプロパティを一括変更することができませんでした。ダイアログは表示されますが，変更した内容が反映されませんでした。

* ACI0100674 リストボックスの列に空の選択リストが設定されている場合，セルの編集中に矢印キーの「下」を入力すると，アプリケーションがクラッシュしました。リストが空ではなければ，ポップアップメニューが表示され，矢印キーで項目を選択することができます。

* ACI0100673 4D Write Proドキュメント内の表組をリサイズした場合，アプリケーションがクラッシュしました。

* ACI0100671 ``VP Export to object``から返されるオブジェクトは，日付の``formatInfo``が正しくありませんでした。

* ACI0100669 Webサーバーに対し，HTTPの``PATCH``メソッドを送信した場合，``On Web Connection``が実行されませんでした。即座にエラー``501``が返されます。

* ACI0100661 4D for iOSアプリのアクションを使用してレコードを追加した場合，アプリケーションがクラッシュしました。

**注記**: リクエストは正しく処理されていますが，クエリをデバイス側のCoreDataに対するSQLに変換するところでクラッシュしていました。

* ACI0100654 プロジェクトモードのみ。リストボックス列のプロパティ「エリプシスで省略」が効きませんでした。「ワードラップ」プロパティがデフォルトで「自動」に設定されているためです。

* ACI0100651 コンパイルモードで``ARRAY LONGINT``を``VARIABLE TO BLOB``でBLOBに変換した後，``BLOB TO VARIABLE``で``ARRAY REAL``に復元した場合，配列が部分的に変換されました。インタープリターモードでは問題ありません。

* ACI0100638 プロジェクトモードのみ。バイナリデータベースをプロジェクトにエクスポートした場合，リストボックス列の「交互に使用する背景カラー」プロパティがデザインモードに反映されませんでした。

* ACI0100637 クライアント/サーバー版のみ。クライアント側でWebサーバーを公開した場合，`` http://host/rest``から始まるURL（たとえば``/restaurant``）がハンドルできませんでした。``/rest/``が予約されたURLであることは理解できますが，URLコンポーネントが前方一致するだけであれば，``403``を返すのではなく，通常のURLとして扱われるべきです。

* ACI0100636 バックアップから復元した後，あるいはアプリケーションを再起動した後，4D for iOSがレコードの同期に使用する管理用テーブル（__DeletedRecords）の管理用フィールド（__GlobalStamp）が正しく更新されませんでした。

* ACI0100633 Mac版のみ。リスト型のサブフォームからダイアログを表示した場合，裏に隠れたサブフォームの行が選択された行以外は表示から消えました。

* ACI0100625 ``ZIP Create archive``のオプションで指定したコールバックフォーミュラが処理中に呼ばれませんでした。

* ACI0100624 4D WriteドキュメントをWrite Proに変換した場合，表組（4D Writeでは，タブで表現される）のレイアウトが崩れることがありました。サイズが``cm``から``pt``に変換される過程で誤差が発生するようです。たとえば，``26.7cm``は``756.8504pt``ですが，変換されたドキュメントではタブの位置が``758pt``になるため，横向きのA4用紙の幅に収まらず，Write Proでは余分な改行が発生します。

* ACI0100616 Write ProドキュメントをMIMEにエクスポートした場合，インライン画像が``Content-Disposition``が``inline``に設定されていませんでした。

* ACI0100614 ORDAのクエリ条件に``NOT IN :1``と記述し，空のコレクションを渡した場合，``0``件のエンティティセレクションが返されました。期待されるのは，すべてのエンティティが返されることです。

* ACI0100612 ``ZIP Create archive``に``ZIP Without enclosing folder``オプションを指定した場合，``success``に``True``が返されますが，アーカイブは作成されませんでした。

* ACI0100611 4D Write Proエリアのコンテキストメニューを無効にした場合，ルーラーのコンテキストメニューも無効になりました。

* ACI0100609 ``WP EXPORT VARIABLE``でMIMEエクスポートしたHTMLをトランスポーターで送信した場合，メールクライアントに本文が正しく表示されないことがありました。Unicodeのバイト・オーダー・マークに続き，HTMLのソースコードがそのまま``ï»¿<html xmlns=...``のように表示されます。受信者がKerioのメールサーバーを使用している場合に問題が発生します。Exchangeサーバーであれば問題ありません。

* ACI0100608 WriteからWrite Proに変換されたドキュメントには，非表示の特殊文字（ドットで存在が確認できる）が挿入されていることがありますが，その行で``return``（``enter``ではない）キーを入力した場合，改行コードではなく，その特殊文字が挿入されました。

* ACI0100606 Windows版のみ。SDIモードでアプリケーションを起動した後，時間を要するインデックスの再構築が開始された場合，表示されるMSCのプログレスバーがパレットウィンドウを使用しているため，デスクトップのタスクバーにアイコンがひとつも表示されません。プログレスバーのウィンドウが背面に移動した場合，再度，アプリを前面に移動することが困難になります。

* ACI0100605 ``Command name``を廃止予定（``_o_``接頭辞）のコマンド番号に対して使用した場合，空の文字列が返されました。

* ACI0100604 ``SMTP Transporter``で送信したメール本文の行が``80``文字を超過する場合，余計な空白文字が挿入されました。

* ACI0100602 Mac版のみ。macOS 10.15.3 Catalinaでは，フォームエディターとユーザーモードでスタティックテキストおよびグループボックスのレンダリングが違っていました。ユーザーモードでは「滑らか」な文字が表示されます。

* ACI0100601 テーブルフォームの実行コンテキストでは，``Form``オブジェクトが使用できませんでした。

**注記**: リストフォームから遷移した詳細フォームでは，``Form.parentForm``プロパティを介してリストフォームの``Form``オブジェクトにアクセスすることができるようになりました。

* ACI0100600 バイナリデータベースをプロジェクトに変換した場合，メソッドのオーナーグループやアクセスグループの設定が属性としてエクスポートされ，Webサーバー経由のコール（``4DACTION/``など）のアクセス制限に使用されました。プロジェクトモードでは，ユーザー＆グループの設定が適用されないはずです。

* ACI0100599 バイナリデータベースをプロジェクトに変換した場合，メソッドのオーナーグループやアクセスグループの設定が属性としてエクスポートされました。

* ACI0100598 Windows版のみ。リストフォームの詳細エリアに配置されたスプリッターが表示されませんでした。ヘッダーエリアには表示されます。ACI098508が修正されたことによる副作用のようです。

* ACI0100597 ダイナミックフォーム（JSONフォーム）で``EXPORT TEXT``を実行することができませんでした。ファイルは作成されますが，データが出力されません。

* ACI0100596 エクスプローラーの「ホーム」タブを選択し，テーブルを選択した場合，プレビューエリアには何も表示されませんでした。期待されるのは，選択したテーブルのフィールド情報が表示されることです。Windows版では，フォーム・フォルダー・メソッドのプレビューも表示されません。17r6以降で問題が発生します。

* ACI0100592 Mac版のみ。``OBJECT SET FONT STYLE``でリストボックスの列をシステムフォントをボールド体に設定した場合，リストボックスの表示が次第に遅くなりました。システムにインストールされているフォントの数に比例して問題が深刻になります。

* ACI0100584 XLIFFを使用した選択リストがリストボックスに正しく表示されませんでした。

**注記**: リストボックスのプロパティリストが少しわかりづらかったかもしれません。ポップアップメニューなど，選択リストをサポートしているフォームオブジェクトには「関連付け」というプロパティがあり，デフォルトの設定は「リスト項目の値」となっています。しかし，このプロパティは，オブジェクトに選択リストを割り当てなければ，表示されません。リストボックスの列にXLIFFリストをポップアップメニューとして表示させたい場合，関連付けを「リスト項目の参照番号」に設定し，「指定リスト」も使用してください。

* ACI0100581 サーバーアプリケーションをビルドする場合，プロジェクトの``ArrayExcludedComponentName``キーが無視されました。特定のコンポーネントを除外するよう指定しても，4D Serverにプリインストールされているコンポーネントは，常にインストールされました。

* ACI0100580 Mac版のみ。リストフォームの詳細エリアに配置されたオブジェクトの「選択時に表示（非表示）」プロパティが正しく動作しませんでした。ACI0098508が修正されたことによる副作用のようです。

* ACI0100578 4D for iOSアプリを12.9インチのiPad Pro（または同等のシミュレーター）で起動した場合，「アドレス」フォーマッターが設定されたフィールドをタップすると，アクションシート（３個のボタンが配置されたダイアログ）が表示されたところでアプリケーションがフリーズしました。

* ACI0100576 Windows版のみ。フォームエディターでリストボックスを作成し，オブジェクトの「選択モード」プロパティをクリックした場合，表示されるポップアップメニューのレンダリングがラベルのものと合っていませんでした。

* ACI0100570 フォントが指定されたスタイルがボールドとイタリックのどちらもサポートしていない場合（例：Elephant），SVGレンダリングエンジンおよび4D Write Proエリアは，デフォルトのフォント（例：Times New Roman）を使用しました。期待されるのは，ブラウザやWebエリアと同じように指定したフォントが表示されることです。

* ACI0100567 クイックレポートで出力したHTMLに問題がありました。余分な``<BR>``タグが大量に出力されます。列やレコードの数に比例するようです。

* ACI0100566 コンパイルモードでは，オブジェクト型フィールドのコレクション型プロパティをORDAで更新した場合，明示的にフィールド自体を更新（自己代入）しない限り，更新した内容が保存されませんでした。

* ACI0100563 プロジェクトモードのみ。SQLコマンドの``DROP SCHEMA``でスキーマをドロップすることができませんでした。エラー``-1838 (SQLS)``が返されました。

* ACI0100562 4D WriteドキュメントをWrite Proに変換した場合，ピクチャを返すメソッド（挿入された数式）が正しく変換されませんでした。変換後のHTMLソースをチェックすると，メソッドが``String``で処理されており，ピクチャではなく文字列が返されていることが確認できます。ソースを修正すれば，ピクチャが表示されるようになります。

* ACI0100561 コレクション型のクエリ条件にフォーミュラ型のプロパティ（つまりメソッド）を使用した場合，アプリケーションがクラッシュしました。

* ACI0100560 フォームのページ``2``にWrite Proエリアが配置されており，エリアの上にウィジェット，その上にフォーカスを最初に受けるオブジェクトが配置されている場合，そのページに移動すると，複数のシンタックスエラー（初回は２個，以降は５個）が返されました。

* ACI0100559 プロジェクトモードのみ。クライアント/サーバー版で``SCAN INDEX``を実行した場合，カレントセレクションが作成されませんでした。

* ACI0100557 ブロックコメント内に単一行コメントや折り返しのコードが含まれている場合，そのメソッドを閉じてから開き直すと，ブロックコメント内の単一行コメント記号（``//``）が増殖しました。

* ACI0100555 特定のメールサーバーに対して使用した場合，``POP3 Transporter``の``getMail()``メソッドから``Null``が返されました。

* ACI0100549 64ビット版のみ。``SET MENU ITEM SHORTCUT``でメニューアイテムのショートカットの値を``0``に設定した場合，ショートカットの設定はクリアされますが，メニューには「Ctrl+」のように無効な情報が表示されました。

* ACI0100548 4D WriteドキュメントをWrite Proに変換した場合，埋め込まれたHTML式が失われてしまいました。

* ACI0100543 SQLステートメントの構文エラーが引き金となって，エラー処理メソッドがコールされた場合，トランザクションレベルがロールバックされました。

* ACI0100542 Windows版のみ。リストボックスのセルが編集されている最中に，リストボックスの列を非表示にするなど，オブジェクトの構造を変更した場合，アプリケーションがクラッシュしました。

* ACI0100540 長期間，サーバーを運用していると，管理画面の「新規接続を許可」が「拒否」に替わり，クライアントの新規接続ができなくなりました。この状態で「新規接続を拒否」ボタンをクリックした場合，アプリケーションがクラッシュします。

* ACI0100539 4D for iOSの「ストラクチャー」セクションにテーブルのリストがデフォルトで表示されませんでした。表示させるためには，何らかの検索を実行する必要がありました。

* ACI0100537 メールオブジェクトの件名または添付ファイル名にアンダースコア記号（``_``）が使用されている場合，``MAIL Convert to MIME``でメールをMIMEに変換すると，記号の代わりに``=5F``という文字列が出力されました。

* ACI0100536 Write ProドキュメントをMIMEエクスポートしてメール送信した場合，フォントサイズ``12``が``11``よりも小さく表示されました。

* ACI0100535 ビルド版のクライアント/サーバーアプリケーションは，コマンドラインパラメーターの``--user-param``で渡した値を``Get database parameter``と``User param value``で受け取ることができませんでした。

* ACI0100534 リレーション属性で参照されているだけで，単体のテーブルとしては4D for iOSにエクスポートされていないデータクラスのエンティティをモバイルアプリで更新することができませんでした。

* ACI0100531 フィールドに登録されているテキストに対して``ST COMPUTE EXPRESSIONS``を実行した場合，``Modified``が``True``を返しました。

* ACI0100529 ストラクチャエディターで文字列フィールドをダブルクリックしてインスペクターを表示した場合，フィールドプロパティの「UUIDフォーマット」が選択されていなくても，「自動UUID」チェックボックスがenable状態のままでした。

* ACI0100527 ``VP EXPORT DOCUMENT``の速度に問題がありました。``39``MB程度のドキュメントをエクスポートするのに``5``分ほどかかりました。

* ACI0100526 プロジェクトモードで``IMPORT TEXT``を実行した場合，何もデータがインポートされませんでした。``IMPORT SYLK`` ``IMPORT DIF``も同じ問題を抱えています。

* ACI0100524 共有コレクションに対して``collection.clear()``を実行した場合，内部的に``Use`` ``End use`` のロック機構が使用されませんでした。そのため，別のプロセスがロックしているコレクションがクリアできてしまいました。

* ACI0100523 日本語版のみ。作成したView Proエリアのオブジェクト名は，デフォルトで"Stepper"でした。

* ACI0100520 Windows版のみ。リストボックスが配置されたプロジェクトフォームをサブフォームとして参照しているフォームを継承している入力フォームにオブジェクトを追加しようとすると，アプリケーションがフリーズしました。

* ACI0100516 Windows版のみ。スプリッターの作用でリストボックスの位置が移動した場合，内部のオブジェクトが正しく再描画されませんでした。``REDRAW``コマンドを実行すれば，問題が解消されます。リストボックスのボーダースタイルが「標準」に設定されていれば，問題は発生しません。

* ACI0100512 Windows 64ビット版のみ。4Dの``POST KEY``コマンドでサードパーティアプリケーションに対してキー入力イベントを送信することができませんでした。

* ACI0100509 ``POP3 Transporter``オブジェクトの``acceptUnsecureConnection``プロパティを``True``に設定しても，ユーザー名とパスワードでサーバーにログインすることができませんでした。

* ACI0100506 複数のラジオボタンがそれぞれオブジェクトのグループに所属しており，それぞれのグループがグループ化されているようなフォームをプロジェクトに変換した場合，グループの帰属関係が失われてしまい，ラジオボタンがグループとして動作しなくなりました。

* ACI0100505 Mac版のみ。4D for iOSの公開テーブルからＮ対１リレーションが設定されており，クエリフィルターが有効にされている場合，モバイルアプリ側には，フィルターで除外されるレコードの代わりに空の行が表示されました。Ｎ対１リレーションが設定されていなければ，問題ありません。

* ACI0100504 SQLの``SELECT``コマンドを``FOR UPDATE``モードで実行した場合，レコードがすでにロックされていると，アプリケーションがクラッシュしました。

* ACI0100501 ``Get license info``から最新の情報を取得するためには，ライセンスのリフレッシュを実行する必要がありました。

* ACI0100500 MSCでバックアップを実行した場合，プログレスバー（サーモメーター）の表示に問題がありました。ファイルサイズがおおきい場合，バックアップが完了する前にサーモメーターの表示が終了しました。4D Serverの管理画面を表示すると，バックアッププロセスが停止しており，MSCを閉じるまで実行されないことが確認できます。

* ACI0100498 クイックレポートエディターの左側あるいは中央ヘッダーまたはフッターにページ番号・作成時刻・作成日など，既定の数式を挿入した場合，エラーが返されました。

* ACI0100491 ``OB SET ARRAY``が「配列からバリアント型にタイプを変更しようとしている」というエラーを返すことがありました。第３引数が変数ではなく，配列であれば，問題ありません。

* ACI0100490 プロジェクトモードのみ。数値フィルター/フォーマットの名称がプロパティリストに正しく表示されませんでした。名称の前にパイプ記号（``|``）が表示されるべきです。

* ACI0100489 Windows版のみ。フォームエディターのプロパティリストに日本語を入力している間，文字列変換のガイドライン（下線）が見えませんでした。フォントの高さに対して行の高さが不十分です。

* ACI0100485 バイナリーモードのみ。リストボックスのもっとも右側にあるヘッダーのスタイルを変更した場合，フッターのスタイルも変更されました。

* ACI0100484 Windows版のみ。管理者権限でサーバーをv18にアップグレードした場合，4D Server v17でインストールされたVSS (Volume Shadow Copy) サービスが自動的にアップグレードされませんでした。サービスは停止されますが，アップデートされません。

* ACI0100482 コンパイルモードで``vPict:=vPict``のように，ピクチャ型の変数に値を自己代入した場合，ピクチャが消滅しました。

* ACI0100481 Mac版のみ。disabled状態のボタンがグレーアウトされませんでした。ボタンの背景色は薄くなりますが，タイトルテキストのフォントカラーがブラックのままです。

* ACI0100732 4D Write ProドキュメントをMicrosoft Word形式でエクスポートした場合，経線で区切られた段落がひとつの段落に結合されました。

* ACI0100678 ``MAIL Transporter``の``htmlBody``よりも前に``textBody``をセットした場合，受診者のメールクライアントがHTMLメールよりも標準テキストメールのほうを優先的に表示しました。逆の順序でプロパティをセットすれば，問題ありません。

* ACI0100631 4D Write Proエリアに数式を挿入した場合，``On Data Change``イベントが発生しませんでした。

* ACI0100740 4D Write ProドキュメントをHTML形式でエクスポートした場合，段落全体に適用された下付き文字や上付き文字，段落中の特定の単語にだけ適用された背景カラーが正しく出力されませんでした。

* ACI0096336  削除されたレコードがカレントセレクションに含まれる場合，``SELECTION TO ARRAY``で作成される配列には``0``が返されました。対応するレコード番号が存在しない場合，期待されるのは，``-1``が返されることです。

* ACI0089985 32ビット版のみ。インポートプロジェクトファイル（``.4SI``）に保存した設定を読み込んだ場合，テーブル作成，テーブル名，エンコーディング，列名をフィールド名にバインドなどのパラメーターが正しくダイアログにセットされませんでした。

* ACI0097759 ポップアップ/ドロップダウンメニューの項目タイトルにXLIFF参照が正しく表示されませんでした。ツールボックスのリストエディターで作成したリストであれば，問題ありません。

**注記**: ドキュメントに，ポップアップドロップダウンメニューのタイトルが自動的にXLIFF処理されるとは述べられていないことに留意してください。ポップアップメニューのアイテムは「値」または「参照」モードで表示することができます。修正されたのは「値」モード（データソースは数値）のほうです。その場合，参照されたリストの項目タイトルが``:xliff:``であれば，自動的に変換されます。「参照」モード（データソースは文字列）の場合，ポップアップメニューの項目タイトルは自動的にXLIFF処理されませんので``Get localized string``で明示的に変換する必要があります。

* ACI0097970 配布のための新アーキテクチャーでビルドされたクライアントアプリケーションから初めてビルドされたサーバーに接続した場合，ログイン画面でユーザーを選択すると，XMLエラーが返されました。最初の接続時は，``lastserver.xml``ファイルが存在しないためです。「続行」ボタンをクリックすれば，そのままサーバーに接続することができます。

* ACI0098508 Mac 64ビット版のみ。出力フォームに大量（``300``個以上）の列が存在する場合，クライアント/サーバー版でレコードを選択するだけで，アプリケーションがビジー状態になりました。

* ACI0099964 ``DatePicker Display Dialog``の``defaultDate``パラメーターで指定した日付がデフォルトでウィジェットに表示されませんでした。

* ACI0099934 リストボックスの列またはヘッダーまたはフッターに設定したスタイルシートをボールド属性に変更した場合，エディターの表示が即座に更新されませんでした。プロパティリストのスタイルシート設定とエディターの表示がうまく同期していないようです。

* ACI0099925 フォームエディター上でWebエリアまたはView Proエリアを別のビューに移動しても，フォームを閉じてからエディターで開き直すと，以前に属していたビューのままでした。Write Proエリアでは問題ありません。

* ACI0099888 クライアント/サーバー版のみ。``dataClass.query()``および``entitySelection.query()``のクエリ条件文字列の末尾に``order by``キーワードを記述した場合，空のエンティティセレクションが返されました。

* ACI0099857 ドキュメントのテキストをボールド体に設定した場合，直後に発生する4D Write Proエリアの``On Data Change``イベントで``WP GET ATTRIBUTES``を使用すると，``wk font``に対して間違った値が返されました。

* ACI0099846 MySQL 8データベースをUnicode版のODBCドライバー経由で更新した場合，文字列の最後の１文字が記録されませんでした。

* ACI0099808 ``SELECTION TO ARRAY``で取得したリレーション１テーブルのレコードがすでに削除されている場合，レコード番号に``-1``ではなく``0``が返されました。

* ACI0099780 コンポーネントで作成したセマフォをクリアせずにプロセスを終了した場合，コンポーネントで作成したセマフォがクリアされませんでした。ホストで作成したセマフォは問題ありません。

* ACI0099771 テキスト入力エリアなどのフォームオブジェクトに関連づけられた選択リストまたは指定りストに項目を追加した場合，新しい値は表示されますが，実際に選択すると「許可されない値です」というエラーが返されました。

* ACI0099768 クイックレポートのマスターテーブルに削除されたフィールドが存在する場合，間違ったフィールドが挿入され，無効なフィールド番号が表示されました。

* ACI0099745 ``On Startup``データベースイベントで``RELATE MANY SELECTION``を実行した後，データベースを再起動した場合，ストラクチャがリードオンリーモードで開かれました。実際にストラクチャファイルがロックされているわけではなく，アプリケーションを再起動すれば問題は解消されます。

* ACI0099724 64ビット版のみ。ラベルの幅が用紙の幅を超過する場合，エディターを表示せずにラベル印刷を開始すると，「ゼロ除算」エラーが返されました。

**注記**: エディターを表示せずにフォームをラベル印刷した場合，32ビット版のラベルエディターが水平タブでラベルの幅を決定するのに対し，64ビット版のラベルエディターは用紙の幅に基づいてラベルの幅を決定します。

* ACI0099587 カレントセレクション型のリストボックスをクリックして行を選択した後，ヘッダーをクリックし，その後，上下矢印キーを使用した場合，間違った行が選択されました。

* ACI0099576 3Dボタンのアイコンの位置を「右揃え」に設定した場合，タイトルが中央よりも``1``ピクセル高い一に表示されました。「左揃え」の場合は問題ありません。

* ACI0099542 Windows 64ビット版のみ。「終了」メニューに標準アクションの「終了」が使用されておらず，代わりにプロジェクトメソッドが設定されている場合，MDIウィンドウを閉じようとしても，そのメソッドが実行されず，アプリケーションを終了することができませんでした。

* ACI0099378 クエリエディターを何度も繰り返し使用しているうちに，エディターからクエリの実行ボタンやクエリ条件の入力エリアが消えてしまうことがありました。

* ACI0099227  値が無限（``INF``）の数値を``OB SET``でオブジェクトのプロパティにセットした場合，値が``Null``に変換されませんでした。``INF``がセットされたオブジェクトを``JSON Parse``で解析すると，ランタイムエラーが返され，処理することができません。

* ACI0099128 Windows版のみ。メンテナンス＆セキュリティセンター画面は，グレーアウトされた「検証」ボタンのアイコンが正しく表示されませんでした。

* ACI0098948 フランス語版のみ。フォームエディターのブレークを``Alt``クリックしてにブレークを追加した場合，正しくないブレーク番号が振られました。常に``0``番ブレークが追加されました。

* ACI0098884 HTTPS経由で4D for iOSアプリケーションからデータベースに接続した場合，ピクチャフィールドが表示されませんでした。

* ACI0098775 Webサーバーの文字セット（エンコーディング）を「Shift_JIS」に設定し，配信したページから受け取ったWebフォーム変数を``WEB GET VARIABLES``で処理した場合，文字化けした値が変数に代入されました。v13以降で問題が発生します。

* ACI0097511 ``ORDER BY FORMULA``にピクチャ型の変数を渡した場合，アプリケーションがクラッシュしました。

* ACI0097188 メソッドの名称変更ダイアログで「すべての参照箇所でメソッド名を変更」を有効にして変換を実行した場合，バックスラッシュ起動で複数行に分割されたコードが単一行に変換されました。「デザインモードを検索」ダイアログの結果ウィンドウから「内容を置換」した場合は問題ありません。また，エディターで編集中のメソッドでは問題ありません。

* ACI0096880 64ビット版のみ。保存したラベル定義ファイル（拡張子``.4LB``）にフィールドの参照が含まれている場合，テーブルやフィールドの名称を変更すると，ラベルティターでファイルが開けなくなりました。フィールドの参照がトークナイズ形式で保存されていないためです。

* ACI0096510 並び替えエディターのウィンドウ幅をドラッグ操作で広げてから狭めた場合，マウスの移動した距離とウィンドウのリサイズ幅にズレが発生しました。

* ACI0096505 ``WP New``で処理したテキストに``&nbsp;``が含まれている場合，ドキュメントを正しくインポートすることができませんでした。

* ACI0096479 Windows版のみ。タスクバーを画面の上部に表示している場合，すべての項目が画面に表示できないポップアップメニューのスクロールボタンを操作することができませんでした。タスクバーが画面の下部に表示されているのであれば，問題ありません。

* ACI0100322 ``buildApp.4DSettings``ファイルに``hardlink``タグが設定されている場合，``lastDataPath.xml``ファイルが作成されませんでした。

* ACI0100321 ``alt``キーを押しながらビルドしたデスクトップ版アプリケーションを起動した場合，スタートアップオプションの画面が表示されますが，「バックアップから復元」を選択すると，MSCが起動される代わりにアプリケーションが閉じられました。

* ACI0100320 リストフォーム上のボタンオブジェクトに「確定」または「キャンセル」の標準アクションが設定されている場合，``OBJECT SET ENABLED``で無効にすることができませんでした。

* ACI0100317 Mac版のみ。``MESSAGE``コマンドで出力したテキストがウィンドウの高さに収まらなくなった場合，文字列の表示が崩れました。オーバーレイのビットマップはウィンドウのスケールファクター（解像度）を計算に入れていますが，（論理座標を使用する）描画APIにその情報が渡されていないようです。

* ACI0100311 Windows版のみ。ボリュームシャドウサービス（VSS）のサービス名には，アプリケーション名が使用されますが，空白文字が含まれる場合，文字列がエスケープされませんでした。パス名にスペースが含まれるサービスは，エスケープされるべきです。

* ACI0100285 高度に発達したストラクチャで4D for iOSでモバイルアプリケーションを作成しようとした場合，ランタイムエラーが表示されることがありました。

* ACI0100274 ``VP PRINT``を実行した場合，印刷ダイアログが表示されませんでした。CEF版Webエリアのバージョンが``77``にアップデートされたことが関係しているようです。

* ACI0100270 4D Write Proのツールバーウィジェットを使用し，セクション・段落・ピクチャのボーダー幅またはボーダーカラーを変更した場合，ボーダースタイルが直線に変更されました。

* ACI0100240 空のコレクションに対して``.lastIndexOf``を実行した場合，アプリケーションがクラッシュしました。

* ACI0100235 Windows 64ビット版のみ。スタイルがイタリック体に設定されたメニュー項目は，キーボードショートカットが効きませんでした。

* ACI0100230 言語と地域の設定が「タイ」に設定されている場合，アプリケーションが起動しませんでした。

* ACI0100214 Mac版のみ。macOS 10.15 Catalinaでは，4D Serverをバックグラウンドに移動してから改めて最前面に移動するまで，アプリケーションメニューを使用することができませんでした。

* ACI0100201 日本語に設定されていない環境で``SMTP_Attachment``または``Transporter``オブジェクトを使用し，日本語のファイル名をメールに添付した場合，エラー``-43``（無効なパス）が返されました。

* ACI0100184 フォームに組み込まれたクロスタブ形式のクイックレポートエディターを右クリックした場合，ランタイムエラーが返されました。

* ACI0100171 Mac版のみ。``OCIEnvCreate``は，環境ハンドルの作成に失敗し，常にエラー``2``を返しました。

* ACI0100103 Comodo社が発行した証明書（cert.pemおよびkey.pem）でHTTPSを使用することができませんでした。

* ACI0100431 24時間を超過する時間型の値をView Proに表示した場合，値が時刻として表示されました。

* ACI0100424 サイズのおおきな4D View Proドキュメント（``30``MB以上）をエクスポートしようとした場合，JavaScriptエラー（「メモリを著しく使用しています」）が返されました。

* ACI0100422 Write Proエリアのコンテキストメニューのように，階層レベルが何重にも定義されているコンテキストメニューを何度も表示していると，アプリケーションがクラッシュすることがありました。

* ACI0100420 プロジェクトモードのみ。インポート＆エクスポートダイアログの「フォーム」タブをクリックすると，アプリケーションがクラッシュしました。コマンドでインポートまたはエクスポートを実行した場合は問題ありません。フォームのプレビュー表示に問題があるようです。

* ACI0100418 v18にストラクチャを変換した場合，非常に古いバージョンで作成され，長年，更新されていなかったメソッドのコメントが解除されることがありました。アップグレード前にv17でメソッドを更新すれば，問題ありません。

* ACI0100417 4D ViewドキュメントをView Proに変換した場合，``00``のようなフォーマットが設定されたセルに値が正しく表示されませんでした。

* ACI0100414 ビルドした4D for iOSアプリケーションで起動後に表示される認証ダイアログの「メールアドレス」フィールド内でカーソルを移動することができませんでした。iPhone 11で問題が再現します。iPhone 7では問題ありません。

* ACI0100412 4D ViewドキュメントをView Proに変換した場合，``###,##0;(###,##0)``のようなフォーマットが設定されたセルに値の``0``が正しく表示されませんでした。

* ACI0100410 プロジェクトモードのみ。データベースをプロジェクトとしてエクスポートした場合，スタイルシートがCSSに変換されますが，フォント名が正しくエスケープされないため，起動時にCSSの解析エラーが返されました。

* ACI0100409 ``PROCESS 4D TAGS``の``#4DEVAL``タグでピクチャが返されるメソッドをコールした場合，アプリケーションがクラッシュしました。

* ACI0100404 クライアント/サーバー版のみ。とても長い（およそ``11930``）``WHERE...IN``ステートメントを``EXECUTE IMMEDIATE``で実行した場合，「スタックオーバーフロー」エラーになりました。

* ACI0100403 Write Proのヘッダーがフォーカスされた状態でドキュメントを印刷した場合，ヘッダーにフォーカスが戻りませんでした。別のアプリケーションに切り替えてから戻れば，再びヘッダーがフォーカスできるようになります。

* ACI0100390 Mac版バイナリモードのみ。MSCの「暗号化」ページで暗号鍵を保存しようとした場合，アプリケーションがフリーズしました。デフォルトの保存場所が書き込み保護されたアプリケーションパッケージ内を指しているためです。

* ACI0100389 ``SVG_ROTATION_CENTERED``コンポーネントメソッドを楕円オブジェクトに対して使用した場合，指定した座標を中心にオブジェクトが回転しませんでした。

* ACI0100388 ``SET DATABASE PARAMETER``を使用し，デバッグログ（``Debug log recording``）をv14フォーマット（例：``2+4``）で開始した場合，SQLステートメントが正しくログファイルに記録されませんでした。

* ACI0100385 CEF版のWebエリアでは，``WA GET LAST URL ERROR``が何も返しませんでした。ライブラリが``77``にアップデートされたことが影響しているようです。ACI0100556と同じ問題です。

* ACI0100384 ``VP set Formula``および``VP set Formulas``の速度に問題がありました。メソッドをコールする数式セルを大量（``600``個程度）に作成した場合，シートの描画に``30``秒異常を要しました。

* ACI0100375 特定のストラクチャでは，デザインモードで表示したウィンドウの位置やサイズが再起動後に復元されませんでした。

**注記**: 問題が発生するのは，かなり古いバージョンで作成されたストラクチャです。そのようなストラクチャは，「デザインモードのウィンドウを復元しない」という設定が有効にされていることがあります。現バージョンの「データベース設定」には，この項目が存在しないため，ユーザーはこれを解除することができませんでした。

* ACI0100371 Mac版のみ。バーコードフォントをテキストに設定して表示した場合，テキストの末尾にスペース文字が追加され，バーコードが無効になりました。macOS 10.15 Catalinaでは問題ありません。

* ACI0100367 Windows版のみ。``OBJECT SET FONT SIZE``の直後に``OBJECT SET FONT STYLE``を実行した場合，アプリケーションがクラッシュしました。

* ACI0100366 スペイン語版のみ。ビルド版デスクトップアプリケーションで``SET ABOUT``を使用した場合，アプリケーションが起動直後にクラッシュしました。

* ACI0100360 統合Webエリアでは，``WA OPEN URL``でページを移動することができませんでした。CEFのバージョンが``77``にアップデートされたことが関係しているようです。

* ACI0100357 複製されたレコードに対して``DISTINCT ATTRIBUTE VALUES``を使用した場合，空の配列が返されました。

* ACI0100344 コンポーネント側のサブフォームのプロパティリストにホスト側のフォーム名が列挙されました。そのようなフォームをコピー＆ペーストして入力すると，アプリケーションがクラッシュしました。

* ACI0100474 プロジェクトモードのみ。リストボックスを配列型からコレクション型に変更した場合，「行の高さ」など，一部のプロパティ値がリセットされました。

* ACI0100473 メソッドエディターの「参照を検索」が正しく動作しないことがありました。パラメーター・メソッド・プロジェクトフォームを検索した場合，コメント文の文字列は結果から除外されるべきです。コマンド・プラグイン・定数では問題ありません。

* ACI0100472 ``METHOD SET CODE``でメソッドを作成した場合，プロジェクトモードではエラーが返され，バイナリモードでは空のメソッドが追加されました。プロジェクトモードの場合，ストラクチャを再起動すると，実際にはメソッドが作成されていることが確認できます。もう一度，コマンドを実行すれば，コードもセットされます。

* ACI0100471 Windows版のみ。ビルド版のクライアントでビルド版のサーバーに接続した場合，リソースが同期されている間，デザインモードのメニューが表示されました。メニュー項目を実行することができませんが，いずれにしても，デザインモードのメニューは表示されるべきではありません。

* ACI0100469 本文がないメールを``MIME Convert from MIME``で処理した場合，エラー``-10718``が返されました。

* ACI0100466 Mac版のみ。グループボックスを印刷した場合，下端のラインが出力されませんでした。

* ACI0100463 コンパイルモードで２次元配列に対して``OB SET``を実行した場合，ランタイムエラーが返されました。v17でコンパイルされたアプリケーションの場合，アップグレード後，再コンパイルすると問題が再現します。

* ACI0100462 バイナリモードのみ。フォームオブジェクトのデフォルトプロパティ設定（テンプレート）がロードされませんでした。たとえば，リストボックスを作成した場合，データソースは「カレントセレクション」ではなく「配列」，行の高さ単位は「行」ではなく「ピクセル」になりました。

* ACI0100461 境界線スタイルが「なし」に設定されているオブジェクトに対して``OBJECT SET RGB COLORS``で前傾色を設定した場合，境界線が表示されるようになりました。そのように表示された境界線は``OBJECT SET BORDER STYLE``で消すこともできません。

* ACI0100455 メソッドエディターに4D View ProコマンドのヘルプTipsが表示されませんでした。また，エディターのステータスバーに表示されるシンタックスが不完全でした。

* ACI0100454 Mac版のみ。リスト型サブフォームを垂直方向にリサイズした場合，再描画が不完全なためにグレーな領域が発生しました。サブフォームをクリックすれば，表示が正しくなります。

* ACI0100453 4D View Proドキュメントを``VP Convert to picture``でSVGに変換した場合，セルの高さと幅が正しくありませんでした。

* ACI0100452 Windows版のみ。サーバー管理画面のウィンドウを最大化した状態で``TRACE``コマンドを実行し，サーバー側でデバッガーを表示させた場合，アプリケーションがクラッシュしました。

* ACI0100451 Windows版のみ。リストボックスの列に対して``OBJECT GET BEST SIZE``を使用した場合に返される幅がv14とv18では違いました。リストボックスヘッダーのセパレーターをダブルクリックすることでも現象を確認することができます。

* ACI0100449 ピクチャファイルのパスが設定されていない3DボタンをJSONフォームに変換した場合，無効な``icon``プロパティ値（``"/RESOURCES/"``）が出力されました。

* ACI0100448 プロジェクトモードのみ。存在しないピクチャを参照しているフォームオブジェクトをドラッグ＆ドロップまたはコピー＆ペーストした場合，ランタイムエラーが返されました。

* ACI0100447 Mac版のみ。空のテーブルに対してSQLの``INSERT``文を実行した場合，``On SQL Authentication``データベースイベントが処理された後に``SQL LOGOUT``を実行すると，アプリケーションがクラッシュしました。

* ACI0100445 トランスポーターで送信したメールをiOSまたはMacのメールアプリで表示した場合，インライン画像が添付ファイルとして表示されました。Outlookでは問題ありません。ACI0100297で修正された問題が再発しているようです。

* ACI0100444 ``ST FREEZE EXPRESSIONS``で表示したテキストにフォーミュラが含まれている場合，アプリケーションがクラッシュしました。フォーミュラは``style``属性の特殊なシンタックス（``<span style="-d4-ref:'1+2'"></span>``）で挿入されています。

* ACI0100440 4D Serverがインストールされたことがないマシン，あるいは``ProgramData/4D Server/VSS``ファイルが削除されたマシンでは，管理者権限で4D Serverを起動しても，VSSサービスが開始されませんでした。``Resources/VSS``フォルダーにある``installService.cmd``スクリプトを実行すれば，問題を解消することができます。

* ACI0100432 18r2で環境設定の「ショートカット」ダイアログでデバッガーのショートカットを設定した場合，v18.xでも項目が表示されました。

* ACI0100078 macOS 10.15 Catalina版のみ。システムと同じディスク上のフォルダーに対して実行した場合，``DOCUMENT LIST'``の速度がv17よりもずっと遅くなりました（およそ``10``倍）。別ボリュームのフォルダーであれば，問題ありません。

**注記**: Mac HD - Data ボリュームの処理が最適化されました。

* ACI0100378 クイックレポートエディターを閉じた後，再び開いた場合，エラーが返されました。

* ACI0100413 無効なシート番号を指定した場合，``VP SET ACTIVE CELL``と``VP Get active cell``では振る舞いが違いました。SETはエラーを返しませんが，Getはエラーを返します。

* ACI0100437 特定のメールサーバーに対して``SMTP Transporter``の``checkConnection()``メソッドを実行した場合，エラー``42`` ``43`` ``49``が返されました。GoogleのSMTPサーバーでは問題ありません。またInternet Commandsでも問題ありません。

**注記**: TLS ``1.1``以上をサポートしていないサーバーに接続した場合，エラーが返されることは不具合ではありません。``success``に``true``が返されていた問題が修正されました。トランスポーター全般（SMTP・POP3・IMAP）に共通の振る舞いですが，TLS ``1.2``以下のサーバーに接続する場合，``SET DATABASE PARAMETER(Min TLS version;TLSv1_0)``でセキュリティの基準を下げる必要があります。

* ACI0093875 XMLドキュメントのルート要素に名前空間が設定されている場合，``DOM Append XML child node``で要素を追加すると，``xmlns``という空の属性が要素に追加されました。

* ACI0096534 デザインモードで未使用のローカル変数を検索した場合，SQLブロック内で使用されているローカル変数がリストに含まれました。

* ACI0096662 クライアント側でデフォルトユーザーから``Designer``に昇格してから``OPEN ADMINISTRATION WINDOW``を実行し，すぐに``CHANGE CURRENT USER``で元に戻した場合，管理画面が表示されませんでした。

**注記**: 管理画面は非同期モードで表示されるダイアログです。画面を開いた後，通常のユーザーに降格した場合，ダイアログは表示されません。これは仕様です。修正により，カレントユーザーを元に戻した場合でも``CHANGE CURRENT USER``が成功すれば，システム変数``OK``に``1``がセットされるようになりました。

* ACI0096904 クライアント/サーバー版のみ。セキュア接続のデータベースから非セキュア接続のデータベースに切り替えた場合，アプリケーションがフリーズしました。

* ACI0097540 64ビット版のみ。データエクスポートダイアログで書き出しファイルパスを指定すると，それまで選択されていたフィールドがリセットされ，すべてのフィールドがエクスポートの対象になりました。

* ACI0097608 ``SVG_SET_OPTIONS``で自動ID設定を有効にした場合，``SVG_New_group``コンポーネントメソッドで指定した``id``属性よりも自動生成された``id``のほうが優先されました。ドキュメントに明記されているように，自動IDは``id``属性が設定されていない要素にだけ追加されるべきです。問題を回避するために``SVG_SET_ID``で``id``を上書きする必要があります。

* ACI0097622 長さ制限いっぱいのインタープロセス変数を一括名称変更しようとした場合，「無効な変数名」エラーが返されました。

* ACI0098586 ドラッグ可および行移動可のリストボックスからの外部に項目をドラッグした場合，マウスポインターが正しく表示されませんでした。ドロップ可のオブジェクト上では「追加」，ドロップ不可オブジェクト上では「禁止」のアイコンに変化するべきです。ACI0098035が修正されたことによる副作用のようです。

* ACI0099020 セレクション型のリストボックスのデータソースがテーブル``2``に設定されている場合，テーブル``1``を削除するとレコードが表示されなくなりました。データソースをコレクションに変更してからセレクションに戻せば，問題が解消されます。

* ACI0100704 4D for iOSの「データ」セクションで「MobileApps」フォルダーの中にない``key.mobileapp``ファイルをプロダクションサーバーのデータファイルとして選択した場合，「プロダクションサーバーが利用できません」というエラーでビルドが中止されました。「MobileApps」フォルダーの中にあるファイルであれば，問題ありません。

* ACI0100517 ORDAの``entitySelection.extract()``メソッドに``targetPath``パラメーターを指定して実行した場合，エンティティセレクション内の``Null``がコレクションに返されませんでした。

* ACI0100503 リストボックスに表示されているのがスカラー値のコレクションだった場合，``LISTBOX SELECT ROWS``を実行したところで何も起きませんでした。

* ACI0100502 ``LIST BOX SELECT ROWS``でリストボックスの選択行をすべて非選択にした場合，「カレント項目」および「カレント項目位置」プロパティの値が更新されませんでした。

* ACI0100476 ``POP3 Transporter``のログファイルには``getMail()``メソッドのクエリ情報しか記録されませんでした。MIME情報が記録されるべきです。

* ACI0100038 4D View Proスプレッドシートから参照を含む行を削除した後，セルをドラッグして参照を再計算させた場合，一部のデータが正しくありませんでした。

**注記**: 修正のため，SpreadJSのバージョンが``13.0.6``にアップデートされました。

* ACI0100546 ``VP SET SHEET OPTIONS``に空のオブジェクトを渡した場合，``protectionOption``がリセットされました。

* ACI0100518 ``LIST BOX SELECT ROWS``のパラメーターにコレクション型ではなく，オブジェクト型を渡しても，エラーが返されませんでした。

* ACI0099511 Mac日本語版のみ。``On Mobile App Action``データベースイベントのパラメーターと戻り値をオブジェクト型で宣言しても，コンパイルエラーが返されました。リソースがアップデートされていないためです。

* ACI0099668 エンティティセレクションの存在しない属性名にORDAでアクセスした場合，先頭エンティティが返されました。

* ACI0099728 4D Write Proのテーブルを``backspace``または``delete``キーで削除するためには，テーブルを単独で選択する必要がありますが，ドキュメントの最後にあるテーブルを選択することはできませんでした。

**注記**: 修正により，Microsoft Wordの振る舞いに準拠する操作になりました。``backspace``キーは，選択中のセル・行・テーブル（完全に選択されている場合）を削除します。``delete``キーは，セル内の文字を削除し，単独で選択されているテーブルは削除しません。選択範囲にテーブルが含まれていれば，そのテーブルも一緒に削除されます。

* ACI0099945 4D for iOSのHTMLフォーマッターを使用した場合，日本語が正しく表示されませんでした。UTF-8エンコーディング文字列がデコードされていないようです。

* ACI0100731 エンティティセレクション型のリストボックスビルダーに表示されるテーブルリストが正しくありませんでした。RESTリソースとして公開されているだけが表示されました。``ds``コマンドでアクセスできるテーブル，つまりORDAの条件に適っているテーブルのリストが表示されるべきです。

ACI0100657 ``WEB Server``オブジェクトをインスタンス化して開始した場合，``Folder(fk web root folder).platformPath``から正しいパスが返されませんでした。 Webルートフォルダーではなく，データベースフォルダーが返されました。

* ACI0100653 メソッドエディターで行の末尾にコメントを入力した後，``enter``キーを入力してトークナイズを確定した場合，コマンドの先頭にある ``//`` が消えました。

* ACI0100642 Webサーバーのリファクタリングに伴い，リソース送信コマンドでメモリーリークが発生するようになりました。``WEB SEND BLOB`` ``WEB SEND FILE`` ``WEB SEND TEXT`` ``WEB SEND RAW DATA`` といったコマンドで問題が発生しています。

* ACI0100591 プロジェクトモードのみ。フォームエディターのプロパティリストをテーマ別のタブに切り替えた場合，適用対象外のプロパティはグレーアウトされますが，一部のプロパティ値はグレーアウトと同時にボールド体で表示されました。対象外のプロパティがデフォルト値かどうかはどうでも良いことなので，ボールド体で表示する必要はないはずです。

* ACI0100663 アクションで追加したレコードが4D for iOSモバイルアプリのリスト画面に表示されませんでした。

* ACI0099140 ASTインタープリターモードでは，``QUERY BY SQL``を実行すると，``>``がないというエラーが返されました。

* ACI0099380 4D for iOSの「データ」セクションでビルドアプリケーションにデータを埋め込まなかった場合，ビルドしたモバイルアプリでデータをロードするためにリストをした方向にドラッグすると，初回はエラーが返されました。

* ACI0100734 ``SET ALLOWED METHODS``で許可したメソッドが4D View Proのツールバーに数式として表示されませんでした。

* ACI0100735 クラスのコンストラタよりもファンクションを記述した場合，そのクラスをインスタンス化してファンクションを実行するとエラーが返されました。

* ACI0100748 ``SET DATABASE PARAMETER``でセレクター``34``を``0``にセットした場合，``Get database parameter``から返される値が更新されませんでした。

* ACI0100747 ``DOM Create XML element``で要素を追加した場合，逆順に要素が作成されました。

* ACI0100620 日本語ではないシステム言語設定で日本語のファイル名を添付して``SMTP_Send``を実行した場合，エラー``-43``が返されました。

* ACI0100716 畳まれた``Case of``ブロックの行の終わりにキャレットを移動し，``return``キーを入力したから「取り消し」操作をした場合，``End case``キーワードが消えました。

* ACI0100695 Windows版のみ，``SMTP_Attachment``で添付ファイルに追加したファイルがロックされたままになりました。アプリケーションを終了するまで，ファイルを削除することができません。

* ACI0100773 ``POP3 Transporter``の``checkConnection()``メソッドを続けてコールした場合，すでに接続が確立されているか確認するために``NOOP``リクエストが送信されませんでした。接続が再確立されました。

* ACI0100775 プロジェクトモードのみ。``Administrator``ユーザーは，他のユーザーを削除することができませんでした。``Designer``が削除したユーザー以外は削除できるべきです。

* ACI0100593 コンポーネントがコンパイルモードで実行されている場合，コンポーネントメソッドのパラメーターがデバッグログ（モード``2``または``6``）に記録されませんでした。

* ACI0100726 新ネットワークレイヤーのみ。新規ユーザープロセスでダイアログを実行しているクライアントのネットワーク接続が不意に切断された場合，およそ``30``秒後にエラーメッセージが表示され，およそ``60``秒後にサーバー側で当該クライアントの「アプリケーションプロセス」が消滅するのが確認できますが，ユーザープロセスは残されたままの状態になります（およそ``2``時間後に処分されます）。このタイミングでネットワーク接続が回復し，クライアントをサーバーに再接続した場合，以前のセッションやプロセスが消えず，クライアント接続ライセンスが余分に消費されました。接続が失われたクライアントのプロセスが「延期」状態になった後に再接続すれば，問題ありません。

* ACI0100788 ``TRANSFORM PICTURE``に``Crop``オプションを指定した場合，特定の画像でアプリケーションがクラッシュしました。内部的な計算で座標が負の値がなる場合に問題が発生します。
	
* ACI0100768 ``DOM Find XML element``で使用できるXPathシンタックスが拡張されましたが，``contains()``関数がサポートされていませんでした。

* ACI0100725 ``SMTP Transporter``でメールを送信した場合，``\r\n``文字列がQuoted-Printableエンコーディングされて``=0D=0D``になりました。大概のメールクライアントでは問題ありませんが，OutlookまたはOutlook Expressではメール本文の表示が崩れました。

* ACI0100188 4D Serverでプロジェクトを開いた場合，ストラクチャファイルは書き込み保護されていますが，ファイルメニュー経由でテーブルやメソッドを追加することができました。当然のことながら，保存はされません。無効なメニュー項目は使用不可にされているべきです。

* ACI0100793 １対Ｎのリレーション属性に対して``AND``と``OR``条件を組み合わせてORDAクエリを実行した場合，結果が正しくありませんでした。

* ACI0100629 トランスポーターで送信したメールの件名に含まれるスペース記号が``_``文字にエンコードされず，そのまま送信されました。

* ACI0100188 4D Serverでプロジェクトを開いた場合，ストラクチャファイルは書き込み保護されていますが，ファイルメニュー経由でテーブルやメソッドを追加することができました。当然のことながら，保存はされません。無効なメニュー項目は使用不可にされているべきです。

* ACI0100799 ``1``行 ``1``列にコマ割り設定されたピクチャボタンをクリックすると，アイコン画像が消えました。再度，クリックすると，ピクチャが再表示されます。

* ACI0100801 Webサーバーのホームページが設定されていない場合，``Get 4D folder(HTML Root folder)``および``Folder(fk web root folder)``は絶対パスではなく，相対パスを返しました。

* ACI0100795 XPathで指定した要素名にハイフン（``-``）記号が含まれている場合，``DOM Find XML element``でその要素ノードをみつけることができませんでした。ハイフン（``-``）記号がマイナス演算子として評価されるためです。

**注記**: 変換されたアプリケーションの場合，データベース設定の「互換性」タブで新しいXPathメカニズムを有効あるいは無効にすることができます。18 R3で作成されたアプリケーションの場合，常に新しいメカニズムが使用されます。新しいメカニズムでは，コンテキストノードがルートノードである場合，``/``記号からXPathを記述する必要があります。

* ACI0100832 ``WEB Server``コンポーネント内では``4DINCLUDE``タグが動作しませんでした。

* ACI0100831 ``WEB SEND FILE``をコンポーネント内で使用し，文字セットが特定できないファイルを送信した場合，アプリケーションがクラッシュしました。

* ACI0100826 Kerioのメールサーバーに対して``POP3 Transporter``の``getMail()``メソッドを使用した場合，``5``分間，アプリケーションがフリーズしたようになりました。``getMailInfoList()``から返されるバイト数と，最終的にダウンロードされるBLOBデータのサイズが一致しないことが関係しているようです。

* ACI0100825 SQLの``IN``句をインデックスフィールドに対して使用した場合，``IN``のリストが降順にソートされていないと，正しい結果が返されませんでした。

* ACI0100845 メールオブジェクトの``messageId``プロパティに空の文字列を設定してトランスポーターでメールを送信した場合，MIMEメッセージの``Message-ID``ヘッダーが中途半端（``<>``）な状態で出力され，メールがスパム扱いになる恐れがありました。``messageId``プロパティが未定義であれば，自動的に値が設定されるので，問題ありません。

* ACI0100803 Write Proの表組に極太のボーダーを設定した場合，ラインに細い隙間が描画されました。

**注記**: 問題は修正されましたが，デフォルトの背景[クリッピングボックス](https://doc.4d.com/4Dv17/4D/17/Using-4D-Write-Pro-standard-actions.200-3726284.ja.html)が「段落」に設定されているため，アンチエイリアス処理により，背景カラーがボーダーにオーバーフローすることがあります。これが問題であれば，クリッピングボックスを「``padding-box``」に変更することができます。

* ACI0100782 リモートデータストアセッションが開かれている状況で``QUIT 4D``を実行した場合，サーバーがハングすることがありました。進行中のセッション数が``2``個であれば問題ありません。``3``個であれば，稀にハングします。進行中のセッション数が``6``個の場合に問題が発生します。

* ACI0100564 ``dataStore.canceTtransaction()``メソッドを実行した場合，トランザクション中に削除されたエンティティのロックが解除されませんでした。

* ACI0100783 プロジェクトモードのみ。OEMライセンスを使用し，``IsOEM``キーを``True``に設定してサーバーアプリケーションをビルドした場合，データファイルを開こうとするとエラーが返されました。バイナリモード，スタンドアロン版，あるいは標準ライセンスであれば，問題ありません。

* ACI0100861 ``4DACTION``で呼び出されたメソッドから``WEB SEND TEXT``を使用した場合，メモリーリークが発生しました。コンポーネントの``WEB Server``で``4DINCLUDE``タグが使用できなかった問題（ACI0100832）が修正されたことによる副作用のようです。

* ACI0100857 クラスのメンバーメソッドでクラスオブジェクト``This``をパラメーターとして``DIALOG``に渡した場合，呼び出し後に別のオブジェクトが返されました。フォームに表示したリストボックスのコードが使用している``This``に影響されているようです。

* ACI0100854 同名のXML要素を``DOM Create XML element``で続けて追加した場合，呼び出しとは逆の順に要素が作成されました。つまり，既存の要素の直前に新しい要素が挿入されました。互換性オプションの「[標準XPathを使用する](https://doc.4d.com/4Dv18R3/4D/18-R3/Compatibility-page.300-4919546.ja.html)」が有効にされていなれば，問題ありません。

* ACI0100853 サーバー管理画面の「ユーザー」あるいは「プロセス」ページを切り替えている最中に``Get process activity``を実行した場合，アプリケーションがクラッシュしました。

* ACI0100756 ``OB Is empty``にフォーミュラオブジェクトを渡した場合，``True``が返されました。

* ACI0100687 Mac版のみ。4D for iOSの「プロダクションサーバーデータファイル」を有効に設定した場合，``Mobileapps``フォルダーに``key.mobileapp``ファイルが作成されませんでした。ACI0100704（修正済み）と関連のある問題です。

* ACI0100877 Mac版のみ。iPadのシステム環境設定で4D for iOSアプリの「Send feedback」を有効にした場合，アプリからフィードバックが送信できるようになりますが，実際にはフィードバックメニューを操作することができませんでした。

<image width="334" src="https://user-images.githubusercontent.com/10509075/84198629-c868e280-aade-11ea-9261-c45cad17ed21.png" />

* ACI0100835 メソッドエディターでプロジェクトメソッド名を選択して「定義に移動」した場合，エディターでそのメソッドが開きませんでした。

* ACI0100822 ``Open form window``コマンドにパラメーターとして渡されているテーブルフォーム名を範囲選択して「定義に移動」した場合，フォームエディターではなく，ストラクチャエディターのテーブルプロパティにジャンプしました。

* ACI0100891 プロジェクトモードのみ。フォームエディターからフォームを実行し，ウィンドウを移動またはリサイズして閉じた場合，次回の実行で配置が再現されませんでした。``geometryStamp``プロパティが更新されていないためです。

* ACI0100890 32ビット版で作成されたラベル定義ファイルをラベルエディターでロードしようとした場合，エラー``-9930``が返されました（``Editor_ON_DATA_CHANGE``コンポーネントメソッドの``286``行目）。ACI0096880が修正されたことによる副作用のようです。

* ACI0100760 4D View Proエリアを表示した直後のタイプ入力に対し，``On After Edit``イベントが発生しませんでした。Macの場合，アプリケーションを再起動した後は問題が発生しません。Windowsの場合，最初に入力したのが数字であれば，問題は発生しません。いずれのプラットフォームでも，最初の文字をフォーミュラバーから入力したのであれば，問題は発生しません。また，セルをダブルクリックsて入力モードに移行したのであれば，問題は発生しません。セルを選択した状態から直接タイプ入力を開始した場合に問題が発生します。

* ACI0100876 カスタムモードと同時にストラクチャエディターを表示し，データベースストラクチャのリレーションを追加・変更・削除してからカスタムユーザープロセスのウィンドウをクリックした場合，アプリケーションがクラッシュしました。

* ACI0100868 Mac版のみ。4D for iOSの「プロダクションサーバーデータファイル」を有効にし，「公開」セクションにサーバーのIPアドレスとポート番号を入力した後，サーバー側の``mobileapps``から``key.mobileapp``をファイルをクライアント側にコピーし，「データ」セクションでローカルのキーファイルを選択しても，「サーバーはオンラインです」のメッセージが表示されませんでした。

* ACI0100790 プロジェクトモード。フォームのプロパティを変更した場合など，特的の条件では，ドキュメントが更新されたことを示すアイコン（Macでは閉じるボタンのスポット，Windowsではアスタリスク記号）が表示されませんでした。プロパティリストを操作した後，フォームエディターをクリックすれば，アイコンが表示されます。

* ACI0100898 ``VP SET FORMULA``でフォーミュラを設定したセルに対して``VP COLUMN AUTOFIT``を使用した場合，``autoFit``が適用されませんでした。

* ACI0100897 非常に長い件名のメールをトランスポーターで送信した場合，空白文字が挿入されました。ヘッダーエンコーディング``mail mode UTF8 in base64``で問題が発生します。

* ACI0100896 プロジェクトモードのみ。マークダウン形式のコメント内に記述したコード（言語は未指定）が4Dコードブロックとして表示されました。

* ACI0100872 ``PICTURE PROPERTIES``の第１パラメーターにオブジェクトのピクチャ型プロパティを渡した場合，コンパイルモードでエラーが返されました。代わりにピクチャ型のローカル変数を使用すれば問題ありません。

**注記**: 問題は修正されましたが，アプリケーションを再コンパイルする必要があります。修正されたのは``PICTURE PROPERTIES``コマンドだけです。

* ACI0100894 エンティティセレクション型リストボックスのデータソースをクエリし，エンティティセレクションのサイズを減らした場合，``LISTBOX SELECT ROWS ``が正しく動作しませんでした。

データソースであるエンティティセレクションを更新した後，そのリストボックスに対して``LISTBOX SELECT ROWS ``を実行した場合，間違ったエンティティセレクションが選択されました。

* ACI0100789 エンティティセレクション型リストボックスの「選択された項目」プロパティの管理が正しくありません。たとえば，すべての行を選択した後，行の選択を解除した場合，「選択された項目」から対応する行が除かれませんでした。

* ACI0100902 コレクション型リストボックスの``On Data Change``イベントでは``This``が使用できませんでした。

* ACI0100836 入力不可・フォーカス可のオブジェクトにフォーカスを移動した場合，テキストをコピーすることができますが，編集メニューの「コピー」はdisabled状態のままでした。

* ACI0100916 ``OBJECT SET SCROLLBAR``でピクチャオブジェクトのスクロールバーを表示した場合，フォームのページを切り替えると，スクロールバーが非表示に戻りました。

* ACI0100915 Mac版のみ。4D for iOSの同期処理中にアプリがクラッシュすることがありました。

* ACI0100708 Windows版のみ。サービス起動中のサーバーの自動アップデートが失敗しました。アップデーターのサービス名が間違っているためです。"4DS "+ストラクチャ名という固定値が使用されていますが，ストラクチャ名とサービス名が一致するとは限りません。

* ACI0100932 プロジェクトモードのみ。オブジェクトの「クラス」プロパティだけを変更した場合，JSONフォームの配置スタンプが更新されませんでした。

* ACI0100928 Mac版のみ。デザインモードのエクスプローラーで「ホーム」タブのフォルダーに収容されているクラスをメソッドエディターで開いた後，``command``+``W``または``command``+``S``を入力した場合，クラスが「ホーム」タブから消えることがありました。アプリケーションを再起動すると，「ホーム」タブのトップレベルにクラスが移動していることが確認できます。

* ACI0100923 新しいXPathシンタックスを有効にした場合，``DOM Create XML element``の速度が以前よりもずっと遅くなりました。

* ACI0100953 Mac版のみ。4D for iOSのクエリフィルターが設定されたデータクラスに対し，１対Ｎリレーションでアクセスした場合，フィルターが適用されず，すべてのレコードが表示されました。

* ACI0100966 Mac版のみ。4D for iOSで設定した「パラメーター無し」アクションのスコープを後から変更することができませんでした。追加アクションのスコープはテーブル，更新アクションのスコープはカレントエンティティであり，他に選択肢はありません。「パラメーター無し」アクションは，どちらでも良いはずです。

* ACI0100961 タブコントロールにアイコンが表示されている場合，タイトル文字列の直下ではクリックイベントが発生しませんでした。
