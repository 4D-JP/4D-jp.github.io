---
layout: fix
title: "4D v17.3 Hotfix 2 修正リスト"
date: 2019-11-25 08:00:00
categories: 修正リスト
tags: 17.3 hotfix 
build: 244600
version: 17.3

---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0100067 Mac版のみ。macOS 10.15 Catalinaで``Convert path POSIX to system``を実行し，フォルダー区切り文字（POSIXでは``/``）が重複するパスを変換した場合，返される文字列が正しくありませんでした。POSIXでは，重複するフォルダー区切り文字が統合されて１個になるはずですが，重複するフォルダー区切り文字（システムでは``:``）がそのまま返されました。

* ACI0100017 Windows版のみ。コンピューターがオフラインの状態でブラウザにホスト名``localhost``を指定し，4DのWebサーバーにアクセスした場合，「一部のポート番号がすでに使用されています」というランタイムエラーが返されました。

* ACI0099462 CEF版またはWindows版のWebエリアでGoogleのようなサイトにアクセスした場合，システム言語がイタリア語に設定されていても，ページがイタリア語で表示されませんでした。

* ACI0099254 リストボックスやリストフォームをダブルクリックして詳細フォームに遷移した場合，ナビゲーション用の標準アクションボタンをクリックしてロックされているレコードから別のレコードに移動すると，ロックされていないレコードもロックされているように表示されました。

* ACI0100076 コンポーネントメソッドからWebサービス（SOAP）リクエストを実行することができませんでした。

* ACI0099984 4D WriteドキュメントをWrite Proに変換した場合，表組が正確にコンバートされないことがありました。垂直ライン（タブ）のカラーがブラックからやホワイトになったり，段落テキストと罫線の距離が狭くなったり，水平ラインが消滅したりしました。

**注記**: 4D Writeの表組は，タブと罫線を組み合わせた擬似的なものでした。ラインのカラーがホワイトになってしまう問題は修正されましたが，レイアウトの違いは，仕様となります。垂直ライン（タブ）とテキストの距離についていえば，Write Proに変換した後，左パディングで調整できます。4D Writeは独自の方法でこれを決定していました。行毎に挿入されなくなった水平ラインについていえば，Write Proの罫線が段落に対して描画されるものであり，段落内の各行に対して挿入されるものではないので，単一の数式で複数行のテキストを表組に挿入した場合，水平ラインは行毎ではなく，段落全体に対して描画されます。複雑な表組は，Write Proに変換した後，HTMLテーブルで再作成したほうが良いかもしれません。

* ACI0099899 64ビット版のみ。古いバージョンのラベルエディターで作成したラベル定義ファイル（``.4LB``）が読み込めないことがありました。

**注記**: 古いバージョンのラベルエディターに存在したバグのため，問題のあるファイルが出力される場合がありました。修正により，そのようなファイルもロードできるようになりました。

* ACI0099782 フォームに組み込んだクイックレポートの出力先をコンテキストメニューで選択した場合，エラー``9850``が返されました。

* ACI0100101 クライアント/サーバー版のみ。``entitySelection.add()``で追加したエンティティが``USE ENTITY SELECTION``で作成したカレントセレクションに含まれませんでした。

* ACI0100028 「デザインモード検索」でリストボックスの列を特定した後，フォームエディターにジャンプしてコンテキストメニューから列を削除した場合，指定した列の左隣にある列が削除されました。エクスプローラーからフォームにジャンプした場合は問題ありません。

* ACI0100021 リストボックスの空行に項目をドロップした場合，``Drop position``が``-1``を返しませんでした。行の高さが自動設定でなければ問題ありません。

* ACI0099969 Mac 64ビット版のみ。``SET PRINT OPTION``で``Spooler document name option``を設定した場合，プリントダイアログの「PDFとして保存」または「Postscriptとして保存」のデフォルトファイル名には設定が反映されませんでした。

* ACI0099821 64ビット版のみ。``SMTP_SetPrefs``で改行コードの挿入モードを``1``（デフォルト値）に設定しても，メール本文の改行コードが``CR`` ``LF``に置換されませんでした。

* ACI0099932 Mac 64ビット版のみ。``SET FILE TO PASTEBOARD``で複数のファイルパスをペーストボードにセットすることができませんでした。

* ACI0099884 ``EXPORT DATA``に渡されたプロジェクトがエクスポートに反映されませんでした。

* ACI0100055 Windows版のみ。Default dataのメカニズムを使用している場合，``On Startup``の前にビルド版のサーバーアプリケーションがクラッシュする可能性がありました。

* ACI0100054 角の丸い四角形が含まれるラベル定義ファイル（``.4lbp``）をラベルエディターで開こうとした場合，エラーが返されました。

* ACI0098845 デザインモードの一部が``SET TABLE TITLES``でセットアップしたバーチャルストラクチャの影響を受けました。変数オブジェクトの「変数または式」に入力されたフィールド名がフィールドタイトルに変化しました。コマンドにアスタリスクオプション（``*``）を渡さなければ，問題ありません。バーチャルストラクチャがデザインモードに適用されている状態では，「変数または式」に有効なフィールド名を入力することができません。

**注記**: 修正により，「デザインモードを検索」ブレークポイントプロパティの「次の式が真のときブレーク」およびフォームエディターのプロパティ全般は，実際のストラクチャ名が文字列で表示されるようになりました。

* ACI0100152 Windows版のみ。``HIDE TOOL BAR`` をバックグランドで実行すると，``On application foreground move``データベースイベントが発生しました。最前面アプリケーションが入れ替わったタイミングでツールバーの表示・非表示を切り替えたいのに，ツールバーが点滅するだけで，アプリケーションが最前面から移動できない状態になりました。

* ACI0100118 クライアント/サーバー通信が暗号化されている場合，クライアント/サーバー接続のタイムアウトが経過しても，接続を解除したクライアントがいつまでもサーバー側のユーザーリストに残されました。

* ACI0099937 ``USE ENTITY SELECTION``でエンティティセレクションを作成した後，``DUPLICATE RECORD``と``SAVE RECORD``を実行した場合，カレントレコードではなく，複製したレコードがエンティティセレクションに追加されました。

* ACI0100057 ORDAの``IN``クエリにコレクションで渡された文字列の最後にワイルドカード（``@``）が使用されていた場合，正しい結果が返されませんでした。

* ACI0099933 TLS証明書に（短時間で失効する）タイムアウトポリシーが設定されている場合，HTTPリクエストを連続して実行することができませんでした。

**注記**: 修正により，``SET DATABASE PARAMETER(110;1)``で問題を回避できるようになりました。``1``を渡した場合，SSLコンテキストの``cert_infos``属祭が都度，消去されるようになります。この設定は，Webサーバー・SQLサーバー・アプリケーションサーバー・HTTPクライアントに共通です。サーバーのセキュリティ評価が問題になるようであれば，``0``に設定してください。
