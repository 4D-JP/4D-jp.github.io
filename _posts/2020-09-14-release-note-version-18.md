---
layout: fix
title: "4D v18.3 修正リスト"
date: 2020-09-14 08:00:00
categories: 修正リスト
tags: "18.3"
build: 255861
version: 18.3
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0101063 特定の文字（ "方" "油" "乳" など，Shift_JISエンコーディングで２バイト目が``0xFB``の漢字）がデータベースのパス名に含まれる場合，アプリケーションが起動直後にクラッシュしました。

* ACI0101181 ``.dbf``ファイルをインポートすることができませんでした。テキストは最初のワードだけがインポートされ，数値は常に``0``がインポートされました。

* ACI0101159 バイナリデータベースをプロジェクトに変換した場合，リレーションの「自動ワイルドカードサポート」が無効になりました。フィールドにワイルドカードで終わる値を入力してタブアウトした場合，候補値のリストが自動的に表示されませんでした。

* ACI0101139 ストラクチャを``.4DZ``パッケージにエクスポートした場合，ストラクチャ設定を変更することができませんでした。設定ファイルが``.4DZ``の内部に置かれるためです。ユーザー設定を有効していれば問題ありません。

**注記**: 仕様がドキュメントに明記されました。配付アプリケーションを正しくアップデートをするためには，データファイルのユーザーを有効にすることが必須です。アプリケーション配付のための新しいアーキテクチャ，およびデータファイルのユーザーは，特別な理由がない限り，常に使用するべきです。
* ACI0101137 ファイル名にドイツ語のアクセント記号が含まれる添付ファイルを``MAIL Convert from MIME``で送信することができませんでした。

* ACI0101121 プロジェクトモードでは「リレートした１レコードがなければ通知」が機能しませんでした。

**注記**: プロジェクトモードでは，原則的にフォームオブジェクトの「フィールド」と「変数」の区別はなく，両方とも「テキスト入力」となります。修正により，オブジェクトの「変数または式」がフィールドの場合には，フィールド特有の振る舞いが再現されるようになりました。

* ACI0101035 Mac版バイナリモードのみ。``MODIFY SELECTION``で表示したリストフォームにフッターエリアに表示されたボタンがクリックに反応しないことがありました。

* ACI0101131 Write Proドキュメントの冒頭にテーブル（表組み）を挿入した場合，そのテーブルの上に行を挿入することができませんでした。

**注記**: 修正により，本文（あるいはヘッダーまたはフッター）の冒頭に配置されたテーブルの先頭にキャレット位置がある場合，``return``キーでテーブルの直前に段落が挿入されるようになりました。Microsoft Wordのように``shift``+``return``ではない点に留意してください。

* ACI0101117 Write Proでタブを含む段落の左マージンを設定した場合，左マージンの値がドキュメントに保存されませんでした。右マージンであれば問題ありません。

**注記**: 左マージンが正の値でテキストのインデントが負の場合に問題がありました。

* ACI0101059 おおきな4D Writeドキュメント（4で``1000``ページ超・``50000``行程度）をWrite Proに変換した場合，すぐに表示されませんでした。

**注記**: 改良により，``1``分``32``秒から``25``秒にロード時間が短縮されました。変数をフォームオブジェクトに表示せず，オフスクリーンのオブジェクトにロードするだけであれば，およそ``10``秒です。つまり，レイアウトの計算やレンダリング処理に``15``秒かかっていることになります。

Write Proは，数万行または数千ページのドキュメントを素早く開くようには設計されていないことに留意してください。XHTML形式の場合，それぞれの行がHTMLノードになるため，ドキュメントのサイズが膨大なツリーとなります。Microsoft Wordでさえ，同じXHTMLファイルをダイレクトに開いた場合，瞬時に文書が表示されることはなく，およそ``10``を要するので，Write Proのロード速度は妥当であると思われます。

* ACI0098523 ``MODIFY RECORD``で表示した詳細フォームに配置されたオブジェクトからフォーカスが移動しないようにAPI Packプラグインで設定した場合，標準アクションの「次レコード」または「前レコード」をクリックするとフォームが閉じられ，``OK``に`1`が代入されました。

**注記**: フォームが自動的に閉じられてしまう問題が修正されました。入力が確定できなかった場合，「次レコード」および「前レコード」は使用不可になり，「確定」または「キャンセル」アクションだけが使用できるようになります。これは無効なデータの入力を中断させるための措置であり，仕様です。「次レコード」を強行したいのであれば，フォームのデザインを見直さなければなりません。

* ACI0100996 インポートダイアログでレコードの読み込みと同時にテーブルを作成した場合，エラー``9935``が返されました。

* ACI0101093 Mac版のみ。コンボボックスの幅が不足している場合，アイテムが完全に表示されませんでした。

* ACI0101086 Mac版のみ。昔のバージョンで作成したストラクチャから変換されたフォームは，拡大率が``1440%``に設定されていることがありました（Windows版では``100%``と表示されます）。そのようなフォームを印刷した場合，以後，アプリケーションを終了するまで，すべての印刷に異常な拡大率が適用されました。

* ACI0101014 エクスプローラーでメソッドの名称を変更（「すべての参照箇所でメソッド名を変更」モード）した場合，「式」が入力できるフォームオブジェクトのプロパティ内で参照されているメソッドの置換されませんでした。

* ACI0101004 日本語名のフィールドがフォームに配置されており，そのオブジェクトメソッドにエラーが存在する場合，コンパイラーに表示されるエラーメッセージが部分的に文字化けしました。

* ACI0100812 プロジェクトモードのみ。プロジェクトを開くたびに``catalog.4DCatalog``ファイルが更新されました。XMLにCDATAが含まれる場合，``<comment>``要素に余計なタブ記号が追加されるためです。

* ACI0101119 4D WriteからWrite Proに変換したドキュメントのテキストをコピー＆ペーストした場合，段落スタイルシートが複製されました。結果的に，段落とペーストしたテキストに別々のスタイルシートが設定されてしまいました。

**注記**: 変換の過程でHTML変換が実施されますが，エクスポートしたHTMLのテキスト整列が「暗黙的（デフォルト）」と「左寄せ」で違っていたことが原因でした。修正により，HTML出力では明示的にテキスト整列が出力されるようになりました。すでに変換されたWrite Proドキュメントは影響を受けませんが，修正により，以前と違うHTMLが出力される可能性があります。

* ACI0100359 サブフォームに表示されたクイックレポートのカラムを移動しても，表示が更新されませんでした。レポートの内容自体は合っています。

* ACI0100956 クイックレポートエディターのカラムに日付型のフィールドを設定した場合，合計行の最小値（``Min``）が正しく計算されませんでした。

* ACI0100619  プロジェクトモードのみ。データベース設定に「自動コメント」が表示されました。プロジェクトモードにこの設定は存在しないはずです。