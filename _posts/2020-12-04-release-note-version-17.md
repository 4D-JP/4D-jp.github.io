---
layout: fix
title: "4D v17.5 修正リスト"
date: 2020-12-04 08:00:00
categories: 修正リスト
tags: "17.5"  
build: 258623
version: 17.5
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0101430 セレクション型のリストボックスに``COPY NAMED SELECTION``で作成した命名セレクションを表示し，`shift`キーを押しながらクリックして複数の行を選択した後，上下矢印キーを使用して場合，間違った行がハイライトされました。

* ACI0101362 クライアント/サーバー版のみ。空のピクチャを含むカレントセレクションに対して``SELECTION TO ARRAY``を実行した場合，エラー``-10533``が返されました。ACI0101266が修正されたことにより副作用のようです。

* ACI0101027 クエリエディターで「である」と「または」を組み合わせた検索条件が正しく読み込まれませんでした。

**注記**: 複数の「または」条件で構成されるクエリは，画面に表示される行数を節約するため，「リストの値いずれかに合致する」フォーミュラに変換されるようになったことが原因でした。修正により，内部的には以前と同じように検索が実行されるようになりました。

* ACI0101349 同じフォーミュラが挿入されている4D Write Proドキュメントをインポート・エクスポート・表示・印刷した場合，数式の値が正しくありませんでした。同じフォーミュラは``1``回しか評価されないためです。``ST COMPUTE EXPRESSIONS``で明示的に再計算すれば，問題ありません。

* ACI0101010 サーバー管理画面の「プロセス」ページで複数の行を選択した場合，スクロールバーをクリック＆ドラッグ操作で動かすことができませんでした。

* ACI0101260 旧式ネットワークレイヤーのみ。4D ServerがWebリクエストを処理している間，4D RemoteのCPUアクティビティが高くなりました。ストラクチャファイルがリードオンリーであれば，問題ありません。Webリクエストを処理するたびに``.4DC``ファイルが更新されているようです。

* ACI0101266 クライアント/サーバー版のみ。保存オプションが「データファイルの外」に設定されているピクチャフィールドに対して``SELECTION TO ARRAY``を実行した場合，エラー``-10533``が返されました。

**注記**: サーバーとクライアントの両方が修正されました。両方のビルドをアップデートする必要があります。

* ACI0099364 Mac 64ビット版のみ。プラグインSDKの``PA_GetCarbonPageFormat``および``PA_GetCarbonPrintSettings``が``null``を返しました。

* ACI0100737 Windows版のみ。システム言語が「英語」に設定されている場合，バックアップ設定の項目「n秒後に再試行」が保存されませんでした。``.4DSettings``ファイルには値が書き込まれていますが，設定画面には``0``と表示されました。

* ACI0100567 クイックレポートで出力したHTMLに問題がありました。余分な``<BR>``タグが大量に出力されます。列やレコードの数に比例するようです。

* ACI0101182 巨大なWrite Proドキュメント（A4用紙で1100ページ以上）のテキストをすべて選択した状態でコンテキストメニューを表示するために右クリック操作をした場合，アプリケーションがフリーズしました。

* ACI0101075 64ビット版の``RECEIVE PACKET``でストップ文字を指定した場合，32ビット版よりもずっと低速（およそ``75``倍）でした。バイトサイズを指定した場合，または``RECEIVE BUFFER``であれば問題ありません。シリアル/USB変換アダプター・プラットフォーム・接続デバイスに関係なく，問題が再現します。

* ACI0100901 値に``Null``が含まれるフィールドを``SQL LOAD RECORD``でテキスト配列に受け取った場合，アプリケーションがクラッシュしました。たとえばMySQLデータベースとのODBC接続で問題が再現します。

* ACI0100843 ラベル印刷の設定ファイルで指定した行数が無視されました。

* ACI0100909 ``On Load``イベント中に``LISTBOX SELECT ROW``を使用し，リストボックスの行をあらかじめ選択した場合，上矢印キーを入力すると最終行が選択され，下矢印キーを入力すると``1``行目が選択されました。配列型のリストボックスでは問題ありません。セレクション型およびコレクション型のリストボックスで問題が再現します。ACI0099586が修正されたことによる副作用のようです。

* ACI0101063 特定の文字（ "方" "油" "乳" など，Shift_JISエンコーディングで２バイト目が``0xFB``の漢字）がデータベースのパス名に含まれる場合，アプリケーションが起動直後にクラッシュしました。

* ACI0101059 おおきな4D Writeドキュメント（A4で``1000``ページ超・``50000``行程度）をWrite Proに変換した場合，すぐに表示されませんでした。

* ACI0100973 HTMLタグを含むテキストをスタイルテキストエリアに表示しようとした場合，アプリケーションがクラッシュしました。
