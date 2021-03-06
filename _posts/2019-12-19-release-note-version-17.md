---
layout: fix
title: "4D v17.3 Hotfix 3 修正リスト"
date: 2019-12-19 08:00:00
categories: 修正リスト
tags: 17.3 hotfix
build: 245877
version: 17.3

---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0100172 サービス登録したサーバーアプリケーションでネットワークボリューム上のデータファイルを開くことができませんでした。

* ACI0100178 Windows版のみ。特定のCSVファイルをインポートしようとすると，エラー``215``が返されました。

* ACI0100219 ``SET PRINT OPTION``で用紙・向き・白黒・両面などを設定した後，``SET CURRENT PRINTER``を実行した場合，印刷設定がリセットされました。

* ACI0100216 Mac版のみ。コード署名付きでビルドしたサーバーアプリケーションが起動できませんでした。スタンドアロン版，あるいはコード署名を付けずにビルドしたサーバーアプリケーションであれば，問題ありません。

* ACI0100149 Mac 64ビット版のみ。``SET PRINT OPTION``でスプーラードキュメント名を設定した後，``PRINT SETTINGS``を実行した場合，設定したキュメント名が印刷ダイアログの左下にある「PDFとして保存」ボタンで表示されるファイル名に反映されませんでした。

* ACI0099835 自動セッション管理が有効にされていない場合，``SET DATABASE PARAMETER``で最多または最少Webプロセス数を変更することができませんでした。

* ACI0097574 64ビット版のみ。リストボックスのヘッダーまたはフッターに設定したヘルプTipsが保存されませんでした。

* ACI0100064 オブジェクトフィールドに対し，ORDAで``Null``をクエリした場合，正しい結果が返されませんでした。

* ACI0100039 リレーションの１フィールドがプライマリーキーではない場合，ORDAによるリレーション属性が正しくありませんでした。１フィールドではなく，プライマリーキーでリレーション属性が決まるため，エンティティのリンクが失われる恐れがありました。

* ACI0099896 プライマリーキーが設定されていないテーブル，あるいは複合プライマリーキーが設定されているテーブルは，標準的なプライマリーキーの設定されたテーブルとリレーションで結ばれている場合，データクラスおよびリレーション属性として``ds``オブジェクトに公開されました。``ds``オブジェクトに追加されるのは，ORDAで公開されたテーブルだけであるべきです。

* ACI0100227 インデックスが設定されたフィールドに対し，ORDAの``IN``条件とワイルドカード文字でクエリを実行した場合，トランザション中に追加したレコードが返されませんでした。

* ACI0100226 インデックスが設定されたオブジェクト型フィールドに対し，ORDAの``IN``条件でクエリを実行した場合，トランザション中に追加したレコードが返されませんでした。

* ACI0100218 インデックスが設定されたオブジェクト型フィールドに対し，ORDAの``IN``クエリを実行した場合，アプリケーションがクラッシュしました。

* ACI0100032 Windows 64ビット版のみ。アプリケーションモードでウインドウ右上の「閉じる」ボタンをクリックしても，アプリケーションが修正しませんでした。終了メニュー，``control``+``Q``ショートカットであれば，終了することができます。

**注記**: ウインドウ右上の「閉じる」ボタンでアプリケーションを終了するためには，標準アクションの「終了」をメニューアイテムに設定する必要があります。

* ACI0099595 ワードラップが有効に設定されている場合，テキストエリア・Write Proエリア・リストボックスの末尾にある空白文字の位置をクリックすると，次の行の冒頭にカーソルが表示されました。

**注記**: キャレットは，文字の挿入位置を示すものであるため，１行に収まりきらないほど長い単語を分解した場合，次の行の冒頭に表示されるのは正常な動作です。修正により，完全な単語の右側にある空白部分をクリックしたのであれば，キャレットはその単語の右側に表示されるようになりました。

* ACI0097614　4D Serverのライセンス更新ダイアログに有効なライセンス番号をタイプ入力した場合，完全な番号を入力した後も警告アイコンが消えませんでした。

* ACI0098704 Mac版のみ。Webサーバーが起動した状態でデザインモードを使用した場合，アプリケーションが突然クラッシュすることがありました。

**注記**: Webのリクエストを処理するたびに，デザインモードのメニューが更新されていたことが原因でした。

* ACI0097822 64ビット版のみ。ビルドしたアプリケーションを起動すると，一瞬，デザインモードのメニューバー（4D・ファイル・編集・実行・レコード・ツール・ウィンドウ・ヘルプ）が表示されました。

**注記**: 32ビット版でも，起動時に一瞬だけメニューバーが表示されますが，項目数が少なく（4D・ヘルプ），目立ちませんでした。いずれにしても，メニューバーが無効化されているので，誤操作のリスクはありません。

* ACI0100199 ビルドしたスタンドアロン版アプリケーションの開始時に``alt``キーを押しても，MSCが起動しませんでした。

* ACI0100060 Windows版のみ。ODBCドライバーとMS Queryを使用し，4DからExcelにデータをインポートしようとした場合，名称にアンダースコアが含まれているテーブルにアクセスすることができませんでした。MS Excel version 14.0.xの32ビット版とODBC Driver v16.6 HF1であれば，問題ありません。MS Excel version 1808 (MS Office 365) の64ビット版とODBC Driver v16.6 HF1で問題が再現します。

* ACI0098279 ODBCドライバーのインストーラーで表示されるライセンス表記が「4D v16」のままでした。

* ACI0100260 Mac 32ビット版のみ。スタートアップ直後にアプリケーションがクラッシュしました。OpenSSLアップデートが原因のようです。

* ACI0099739 Windows版のみ。ビルドしたスタンドアロンアプリケーションのクイックレポートエディターには，デフォルトのHTMLテンプレートがありませんでした。
