---
layout: fix
title: "4D v18r6 修正リスト"
date: 2021-01-19 08:00:00
categories: 修正リスト
tags: 18r6
build: 260545
version: 18r6

---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0101192 IMAPトランスポーターの``searchMails``メソッドでアクセント文字をサーチすることができませんでした。

* ACI0101186 コンパイルモードでテーブルに対するポインターの逆参照を``PRINT SELECTION``に渡した場合，アプリケーションがクラッシュしました。

* ACI0101175 フォルダー名にウムラウト記号が含まれる場合，`IMAP_SetPrefs`および`POP3_SetPrefs`からエラー`-43`が返されました。

* ACI0101143 プロジェクトモードのみ。大量のオブジェクト（アイコンが設定されたボタン）がフォームに配置されている場合，フォームエディターの動作がとても重くなりました。バイナリモードでは問題ありません。

* ACI0101135 プロジェクトモードのみ。``LISTBOX SET PROPERTY``と``lk named selection``の組み合わせでリストボックスの命名セレクションを設定することができませんでした。

* ACI0101120 ピクチャ型のオブジェクトプロパティを直接``SET PICTURE TO PASTEBOARD``に渡すことができませんでした。

* ACI0101114 Mac版のみ。ポップアップ/ドロップダウンメニューに大文字/小文字の区別またはアクセント記号だけが違っている値が表示されている場合，カレント項目ではない行にチェックマークが表示されました。

* ACI0101106 プロジェクトモードのみ。データソースに命名セレクションが設定されたリストボックスに``CUT NAMED SELECTION``または``COPY NAMED SELECTION``で作成したセレクションが表示されませんでした。

* ACI0101067 ``MAIL Convert from MIME``で変換したメールオブジェクトは，送信日が正しく返されないことがありました。タイムゾーンが正しく計算されていないためです。たとえばMIMEのヘッダー値が``Mon, 3 Aug 2020 09:27:52 +0200``だった場合，``2020-08-03T09:27:52.000Z``のような日付に変換されました。

* ACI0101065 アプリケーションビルド画面のオプションでコンポーネントビルドだけを選択した場合，「ビルド」ボタンがクリックできませんでした。

* ACI0101061 プロジェクトモードのみ。新規作成したリストボックスには「行の移動可」プロパティがありませんでした。バイナリモードから変換されたリストボックスは問題ありません。プロパティが設定されていない場合，行のドラッグ＆ドロップができません。

* ACI0101051 Windows版のみ。フォームエディターのテキストエリアに``Alt``キーと数字のコンビネーションでアクセント文字を入力することができませんでした。メソッドエディターでは問題ありません。

* ACI0101041 プロジェクトモードのみ。``folders.json``を外部エディターで編集し，メソッドまたはフォームを下位のフォルダーに移動（カット＆ペースト）した場合，メソッドまたはフォームがトップレベルに複製されました。

* ACI0101037 メソッドエディターの自動コード補完で定数が正しく入力できませんでした。

**注記**: 前付き引数がサポートされるようになったことによる副作用でした。修正により，候補ウィンドウは表示されるようになりましたが，定数は低い優先順位でリストアップされます。

* ACI0101035 Mac版バイナリモードのみ。``MODIFY SELECTION``で表示したリストフォームにフッターエリアに表示されたボタンがクリックに反応しないことがありました。

* ACI0101027 クエリエディターで「である」と「または」を組み合わせた検索条件が正しく読み込まれませんでした。

* ACI0101026 Mac版のみ。オブジェクトに``.SF NS Text``フォントが設定されている場合，システムフォントではないフォントが表示されました。

* ACI0101013 Mac版のみ。View ProエリアのツールバーからPDF形式でエクスポート使用とした場合，テンポラリフォルダーがデフォルトの書き出しフォルダーとして表示されました。

* ACI0101010 サーバー管理画面の「プロセス」ページで複数の行を選択した場合，スクロールバーをクリック＆ドラッグ操作で動かすことができませんでした。

* ACI0101001 クライアント/サーバー版のみ。ORDAの``IN``条件でクエリを実行した場合，正しい結果が返されないことがありました。フィールドにインデックスが設定されていれば問題ありません。データベース言語が「日本語」で文字列比較用のテキスト比較が「有効」に設定されている場合に問題が再現します。

* ACI0100980 hMailServerから``POP3 Transporter``の``getMail()``メソッドでメールを受信しようとした場合，``Null``が返されることがありました。

* ACI0100977 プロジェクトモードのみ。図形オブジェクトの「角の丸み」プロパティが``0``以外の値に設定されていない場合，``OBJECT SET CORNER RADIUS``が使用できませんでした。

* ACI0100974 ``MAIL Convert from MIME``でメールの本文が取り出せないことがありました。特定の標準テキストメールで問題が再現します。マルチパートメールでは問題ありません。

* ACI0100969 4D for iOSのカスタムデータフォーマッターがＮ対１リレーションフィールドに適用されませんでした。

* ACI0100945 ``OB SET``または``OB SET ARRAY``でオブジェクト型フィールドを更新してかた``SAVE RECORD ``で保存した場合，``Modified record``が``True``を返しました。フィールド自体にフィールドを代入すれば，``False``が返されるようになります。

* ACI0100926 Windows版のみ。進行中のプログレスバーのキャンセルボタンをクリックした場合，コールバックメソッドの呼び出しでエラーが返されました。ローカルプロセスのスタックサイズが不足しているようです。

* ACI0100922 アプリケーションが最前面ではなくなった初回のタイミングでは``On Application background move``システムイベントが発生しませんでした。

* ACI0100884 クライアント/サーバー版のみ。ORDAでピクチャ型の属性アクセスした場合，正しいサイズが返されませんでした。

* ACI0100870 ``ENCRYPT BLOB``の第３パラメーターに未定義の変数を渡した場合，アプリケーションがクラッシュしました。

* ACI0100737 Windows版のみ。システム言語が「英語」に設定されている場合，バックアップ設定の項目「n秒後に再試行」が保存されませんでした。``.4DSettings``ファイルには値が書き込まれていますが，設定画面には``0``と表示されました。

* ACI0100734 ``SET ALLOWED METHODS``で許可したメソッドが4D View Proのツールバーに数式として表示されませんでした。

* ACI0100639 フォーカス不可でタブ不可のオブジェクトをJSONフォームあるいはプロジェクトモードに変換した場合，フォーカス可になりました。

**注記**: 同時にルーラーのJSON変換も修正されました。ルーラーもフォーカス可プロパティがエクスポートされるようになり，「上」「左」以外のラベル位置もサポートされるようになりました。

* ACI0100620 日本語ではないシステム言語設定で日本語のファイル名を添付して``SMTP_Send``を実行した場合，エラー``-43``が返されました。

* ACI0100555 特定のメールサーバーに対して使用した場合，``POP3 Transporter``の``getMail()``メソッドから``Null``が返されました。

* ACI0100439 Mac版のみ。box.comからインストールしたBoxアプリが作成したフォルダーに対して``FOLDER LIST``または``DOCUMENT LIST``を実行した場合，空の配列が返されました。

* ACI0100004 ノルウェー語とフランス語のスペルチェック辞書に同一のID番号が振られました。

**注記**: Mac版のシステムスペルチェックだけが修正され，番号ではなく``fr-FR``や``en-US``のような識別子が使用されるようになりました。Hunspell版のスペルチェックは，ライブラリが発行するIDをそのまま使用しています。

* ACI0099364 Mac 64ビット版のみ。プラグインSDKの``PA_GetCarbonPageFormat``および``PA_GetCarbonPrintSettings``が``null``を返しました。

* ACI0099000 `4DLOOP`ブロックの中に`4DIF` `4DELSE` `4DELSEIF` `4DENDIF`ブロックが`3`回記述されている場合，２巡目のループで`PROCESS 4D TAGS`がエラー（`4DENDIF`がありません）を返しました。`3`回の`4DIF` `4DELSE` `4DELSEIF` `4DENDIF`ブロック全体を`4DIF True` `4DELSEIF`で囲えば問題ありません。

* ACI0098630 エクスプローラー画面を最小化されている場合，ツールバーのエクスプローラーボタンをクリックしても，ウィンドウが再表示されませんでした。

* ACI0098362 `.eml`ファイルの添付ファイルが`MSG_HasAttach`に認識されないことがありました。

* ACI0101262 フィールドの重複不可プロパティを解除してから別のデータファイルに切り替えた場合，インデックスの自動再作成が実行されないため，レコードの追加でキーの重複エラーが発生する恐れがありました。インデックスファイルを削除すれば，問題ありません。

* ACI0101261 バイナリデータベースをプロジェクトに変換した場合，階層リストの「透過」プロパティがエクスポートされませんでした。

* ACI0101260 旧式ネットワークレイヤーのみ。4D ServerがWebリクエストを処理している間，4D RemoteのCPUアクティビティが高くなりました。ストラクチャファイルがリードオンリーであれば，問題ありません。Webリクエストを処理するたびに``.4DC``ファイルが更新されているようです。

* ACI0101259 ``MAIL New attachment``で作成したメール添付オブジェクトを別プロセスに渡すことができませんでした。

* ACI0101254 バイナリモードのみ。オブジェクトメソッドが設定されているオブジェクトを含むフォームを削除してごみ箱に空にした場合，MSCのアプリケーション検査を実行すると，どこにも使用されていない``CC4D``リソース（オーファンメソッド）が検出されました。

* ACI0101249 Mac版のみ。SVGをPDFに出力した場合，``@media``属性で印刷用のスタイル設定が出力に反映されませんでした。スクリーン用と同じイメージが出力されました。

* ACI0101246 Mac版のみ。別のアプリケーションを最前面に移動してから4Dを最前面に移動した場合，呼び出し元の検索やシンタックスチェックの速度が大幅に低下しました。おおきなアプリケーションの場合，処理が完了するまでにバイナリモードでは``10``秒，プロジェクトモードでは``10``分以上待たされることがありました。

* ACI0101244 シリアル通信ポートを開いた状態でデバイスをコンピューターから抜き取ると，アプリケーションがクラッシュしました。

* ACI0101242 Mac版のみ。コード署名せずにクライアントアプリーケーションをビルドした場合，起動直後にアプリケーションがクラッシュしました。シングル版およびサーバーアプリケーションでは問題ありません。

* ACI0101240 ラベルエディターで連結したフィールドが正しく出力されませんでした。最初のオペランドだけが出力されました。

* ACI0101237 Write Proドキュメントにフォーミュラを挿入した場合，行の高さが増加しました。

* ACI0101234 ``FORM SCREENSHOT``から返される出力フォームの画像は最終レコードが含まれていませんでした。

* ACI0101228 ``WP SET LINK``で設定したプロジェクトメソッドのハイパーリンクがアプリケーションモードではクリックに反応しませんでした。別のウィンドウをアクティブにした後，4D Writeエリアが表示されているウィンドウをアクティブにすれば，使用できるようになります。

* ACI0101226 IMAPトランスポーターでサーバーに接続し，`30`分（Exchangeサーバーのタイムアウト設定）メソッドの実行を停止してから処理を再開した場合，「SSL read failed」というエラーが返されました。期待されるのは，どれだけ間隔が空いたとしても，エラーを返さずに処理が継続できることです。

* ACI0101220 リストボックス全体にCSSクラスが設定されている場合，フッターに設定されたCSSフォントがフォームの実行時に反映されませんでした。デザインモードでは問題ありません。

* ACI0101218 特定のテーブルに対し，読み込みダイアログを使用してデータをインポートした場合，インポート対象に指定したフィールドがスキップされることがありました。すべてのテーブルで問題が発生するわけではありません。

* ACI0101217 インポートダイアログでフィールド数が``1``個のテーブルを選択した場合，エラー``215``が返されました。

* ACI0101213 コンパイルモードのみ。フォームに表示されたタブコントロールの変数が数値型ではなかった場合，フォームを閉じるとアプリケーションがクラッシュしました。

* ACI0101212 ``MAIL Convert from MIME``でメールオブジェクトを作成した場合，エンコードに問題があるために画像が表示されないことがありました。

* ACI0101211 PDFファイルが添付された``.eml``ファイルを``MIME Convert to mail``でメールオブジェクトに変換して送信した場合，受信クライアントに添付ファイルが表示されないことがありました。

* ACI0101209 エンティティセレクション型のリストボックスをサブフォーム内で使用した場合，「カレントの項目の位置」や「選択された項目」がデバッガに表示されませんでした。「カレントの項目」だけが表示されました。