---
layout: fix
title: "4D v18.2 Hotfix 2 修正リスト"
date: 2020-08-18 08:00:00
categories: 修正リスト
tags: 18.2 hotfix
build: 254885
version: 18.2 Hotfix 2
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0101074 フォーミュラエディターで入力した``Char(13)``のようなフォーミュラをWrite Proドキュメントに挿入した後，表示を値から参照に切り替えて値に戻した場合，アプリケーションがクラッシュしました。``Current date``のようなフォーミュラであれば問題ありません。

* ACI0100981 Write Proに改行だけを返すメソッドが数式として改行の直前に挿入されている場合，フッターで``This.pageCount``というフォーミュラを評価すると，アプリケーションがクラッシュしました。

* ACI0101066 ``MAIL Convert from MIME``に渡されたMIMEデータに``CRLF``コードが含まれていない場合，アプリケーションがハングしました。ただし，空の文字列であれば問題ありません。

* ACI0100725 ``SMTP Transporter``でメールを送信した場合，``\r\n``文字列がQuoted-Printableエンコーディングされて``=0D=0D``になりました。大概のメールクライアントでは問題ありませんが，OutlookまたはOutlook Expressではメール本文の表示が崩れました。

* ACI0101034 Windows版のみ。サーバー側で「4D Serverについて…」画面を表示してから閉じようとした場合，アプリケーションがフリーズしました。

* ACI0101024 4D ViewドキュメントをView Proに変換した場合，１番列の下および右の罫線が表示されませんでした。

* ACI0101012 Mac版のみ。``WP EXPORT DOCUMENT``でエクスポートしたMIMEをGoogle Chromeブラウザに表示することができませんでした。また，その内容をメールで送信した場合，受信者のメールクライアントにHTMLのソースコードがそのまま表示されました。

* ACI0100964 4D ViewからView Proに変換されたドキュメントを``.xlsx``形式でエクスポートした場合，そのスプレドシートをMicrosoft Excelで開くとエラーが表示されました。

* ACI0100921 エンティティセレクション型のリストボックスの列に設定された選択リストで値を入力した場合，カレント項目のプロパティに値が代入されませんでした。コレクション型のリストボックスであれば，問題ありません。

* ACI0101050 プロジェクトモードのみ。進捗バーのタイトルフォントカラーを設定することができませんでした。

* ACI0101045 Mac版のみ。Write Proエリアに表示されたテキストのフォントを"Times New Roman"から"Times"に変更した場合，テキストがボールド体になりました。

* ACI0100955 ブール型フィールドをチェックボックスとして表示するようなフォームをプロジェクトに変換した場合，そのフォームを使用してブール型フィールドにデータをインポートすることができなくなりました。オブジェクトのタイプをチェックボックスから「入力」オブジェクトに変更する必要があります。

* ACI0100869 クライアント/サーバー版のみ。属性パスを指定して``entity.toObject()``を実行した場合，返されるオブジェクトにリレーション属性が含まれないことがありました。

* ACI0099483 一部のコマンドは，パラメーターを必要としないのにも関わらず，メソッドエディターの補完機能（``tab``キー）でコマンド名を入力した場合，自動的にカッコが追加されました。例：

    * BEEP
    * Application Version
    * Current method name
    * START TRANSACTION

* ACI0100782 リモートデータストアセッションが開かれている状況で``QUIT 4D``を実行した場合，サーバーがハングすることがありました。進行中のセッション数が``2``個であれば問題ありません。``3``個であれば，稀にハングします。進行中のセッション数が``6``個の場合に問題が発生します。

* ACI0101039 画面に表示されていないWrite Proドキュメントを繰り返し``WP PRINT``で印刷した場合，ヘッダーまたはフッターに挿入されたページ番号（``$wp_pageNumber`` ``$wp_pageCount``）が正しく再計算されませんでした。

* ACI0100942 ボタンタイトルのフォントカラーを「自動」以外に設定した場合，ボタンをdisabled状態にしてもタイトルがグレーアウトされませんでした。

* ACI0100675 Mac版のみ。バックアップの対象フォルダーに無効なシンボリックリンクが含まれていた場合，バックアップが中止され，エラー``1409``が返されました。たとえオリジナルが存在しなかったとしても，シンボリックリンクファイルがそのままバックアップされるべきです。

* ACI0101020 Write Proエリアとサイドバーを両方ともサブフォームに配置した場合，ブックマークまたはURLを設定しようとするとエラーが返されました。

* ACI0100951 Write Proエリアに挿入されたフォーミュラの後にキャレットを移動して``backspace``キーを使用した場合，フォーミュラ全体が削除されませんでした。フォーミュラが選択されていれば，問題ありません。

* ACI0100306 Write Proウィジェットのツールでページのマージンを変更することができませんでした。

* ACI0100907 ``VP Convert from 4D View``コマンドがスレッドセーフではありませんでした。

* ACI0100924 Write Proウィジェットのツールでテキストのスタイルをコピーした場合，フォントのファミリーがコピーされませんでした。たとえば「Optima Extra Black」をコピーした場合，スタイルをペーストすると，「Optima Bold」が適用されました。

* ACI0100991 Mac版のみ。DOCXまたはPDF形式でWrite Proドキュメントをエクスポートした場合，ペーストしたピクチャが画像のプレースホルダーとして表示されました。

* ACI0100963 プロジェクトモードのみ。``BUILD APPLICATION``データベースフォルダー内にでOEM版のクライアント/サーバーアプリケーションをビルドすることができませんでした。ACI0100783の修正により，ビルド中，データベースフォルダー内の``.4DCatalog``ファイルがロックされるようになったためです。

**注記**: 問題は修正されましたが，システムの制約により，アプリ内部にビルドする場合，Macでは``sudo``モードで4Dを起動する必要があります。通常，この場所にアプリをビルドすることは想定されていません。