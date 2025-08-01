---
layout: fix
title: "4D 20r10 修正リスト"
date: 2025-07-30 08:00:00
categories: 修正リスト
tags: 20r10
build: 100158
version: "20r10"
permalink: /2025/188/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0105815 アンダースコア記号（`_`）を含むMIMEヘッダーが正しくエンコーディングされませんでした。

* ACI0105791 すでにヘッダーが存在するWrite Proセクションに`WP New header`でヘッダーを挿入しようとした場合，未知のエラー`101`が返されました。

**注記**: ヘッダー/フッターがすでに存在するという具体的なエラーメッセージが追加されました。

* ACI0105809 Windows版のみ。ビルドしたアプリケーションのMDIウィンドウタイトルバーにアプリケーション名が「app - app」と二重に表示されました。

* ACI0105789 Windows版のみ。Welcomeウィザードの「ローカルアプリケーションプロジェクトを開く」アイコンが途切れて表示されました。

* ACI0105814 コンポーネントフォルダーに無効なハードリンクが存在する場合，依存関係マネージャーがエラーを返しました。

* ACI0105822 Windows版のみ。ダイアログを表示していないプロセスで印刷ダイアログを呼び出した場合，印刷ダイアログがモーダルではなくなり，別のウィンドウをクリックしただけで閉じられました。

* ACI0105829 クライアント/サーバー版の開発モードでは，オブジェクト型フィールドのクラスを設定することができませんでした。

* ACI0105824 デスクトップ版からWeb管理にアクセスした場合，アプリケーションがクラッシュしました。サーバー版のWeb管理にログインを試みた場合，HTTPエラー`500`が返されました。ホストプロジェクトのタスクで接続ハンドラーが実行されているようです。

* ACI0105823 メソッドエディターを閉じてから再表示した場合，ウィンドウサイズが再現されないことがありました。

**注記**: ウィンドウ幅`964`以下あるいは高さ`399`以下までリサイズした場合，ウィンドウサイズが正しく保存されませんでした。

* ACI0105767 サブフォームオブジェクトのプロパティリストに「フォーカスの四角を隠す」が存在しました。

* ACI0105825 リソースフォルダーに`LoginImage.png`が存在する場合，カスタム版のユーザーログイン画面が表示されるはずですが，デフォルトのアイコンとメッセージが非表示になりませんでした。

* ACI0105806 ASTインタープリターモードでは，呼び出し連鎖の途中で遅延モードのエラーが返された場合，関数の実行が中断されず，続けてエラーが返された場合には`Last errors`が上書きされました。

* ACI0105769 テキスト入力からタブ移動した場合，水平スクロールバーが初期位置に戻りました。

* ACI0105742 クライアント/サーバー版のみ。オブジェクト型の`Null`ではないエンティティ属性にアクセスした場合，`touchedAttributes()`が`True`を返しました。

* ACI0105800 リモートデータストアのエンティティのオブジェクト型属性にアクセスした場合，非共有オブジェクトがリモートキャッシュに置かれ，複数のスレッドからアクセスされてしまう恐れがありました。

* ACI0105751 サーバー管理画面のメンテナンスページのヘルプTipsとボタンタイトルの内容が一致していませんでした。

* ACI0105813 メソッドメニューの「エクスプローラーに表示…」を実行した場合，エクスプローラーのメソッド画面ではなく，ホーム画面に移動しました。

* ACI0105623 [`JSON Validate`](https://developer.4d.com/docs/ja/commands/json-validate)で検証したオブジェクトがJSONスキーマの`array`型プロパティの`items`キーワードのサブスキーマに違反した場合，評価ステータスに`{success:true}`が返されますが，同時にエラーも返されました。

**注記**: `items`キーワードのサブスキーマ評価の不具合が修正されました。`items`に単一のサブスキーマが定義されている場合，コレクションの全要素がそのサブスキーマに対して評価されます。`items`に複数のサブスキーマが定義されている場合，コレクションの各要素が対応する位置のサブスキーマに対して評価されます。`additionalItems`のサポートは部分的であることに留意してください。ブール値はサポートされていますが，サブスキーマはサポートされていません。

* ACI0105768 バイナリモードのみ。テーブルフォームをウィザードで作成することができませんでした。

* ACI0105799 階層リストオブジェクトのプロパティリストにドラッグ＆ドロップの選択肢「自動」が含まれていました。

* ACI0105778 コンボボックスオブジェクトのプロパティリストにドラッグ＆ドロップの選択肢「自動」が含まれていました。

* ACI0105795 ASTインタープリターモードのみ。`SET ASSERT ENABLED(False)`を実行しても，アサーションが常に有効でした。

* ACI0105716 4D NetKitの`OAuth2ProviderObject.getToken()`で取得したトークンが失効した場合，リフレッシュトークンを使用して自動的にトークンが更新されますが，今度はリフレッシュトークンが返されないため，次回，トークンが失効したときには，自動的にトークンが更新されませんでした。

* ACI0105792 Windows版のみ。カレントプリンターのプリンター名が`30`文字を超える場合，印刷コマンドからエラーが返されました。

* ACI0105790 ASTインタープリターモードのみ。文字列の範囲外の位置を指した[文字参照記号](https://developer.4d.com/docs/ja/Concepts/string#文字参照記号)を評価した場合，アプリケーションがクラッシュしました。

* ACI0105787 「デザインモードを検索」画面を展開する`⌄`ボタンを右クリックした場合，画面のレイアウトが崩れました。

* ACI0105785 「Webサービスウィザード」画面を展開する`⌄`ボタンを右クリックした場合，画面のレイアウトが崩れました。

* ACI0105763 Windows版のみ。MSCで開いたプロジェクトのデータファイルがみつからなかった場合，「開く…」ボタンが不自然な位置に表示されました。

* ACI0105749 リストボックスのセル編集中に`OBJECT SET ENTERABLE`を使用した場合，アプリケーションがクラッシュしました。

**注記**: 問題は修正されましたが，セルの入力中にキースストロークイベントで入力可プロパティを変更することは勧められていません。キーストロークイベントではなく，*On After Edit* を使用するべきです。

* ACI0105761 カレントのライセンスではないDeveloper ProfessionalおよびUnlimited Desktopライセンスをビルドに使用した場合，スタンドアロン版アプリケーションのビルドに失敗しました。

* ACI0105726 Windows版のみ。クライアントモードからシングルユーザーモードに切り替えた後に設定またはWeb管理ダイアログを表示した場合，エラーが表示されました。

* ACI0105777 ASTインタープリターモードのみ。`If`条件に未定義の変数が記述されていた場合，エラーが返されました。

* ACI0105651 *roles.json* で設定した`promote`アクションが適用されませんでした。

* ACI0105501 エクスプローラーでフィールドのドキュメンテーションを表示してクリックした場合，カタログファイルが更新されました。

* ACI0105773 ストラクチャエディターのインスペクターのフォントリストが空でした。 

* ACI0105758 `OBJECT SET RGB COLORS`でグループボックスのフォントカラーを設定することができませんでした。

* ACI0105756 Windows版のみ。ピクチャ入力オブジェクトのフォーカス表示が境界線スタイルに影響されました。

* ACI0105555 Write Proエリアの背景色をリセットすることができませんでした。

* ACI0105772 Windows版のみ。サーバー側で*Qodly Studio* を起動した場合，LSPの反応待ちとなり，メソッドやクラスが表示されませんでした。

* ACI0105750 フランス語版のみ。サーバー管理画面にスペルミス（"Supprimmer"）がありました。

* ACI0105698 テーブルフォームに配置した特定のテキスト型フィールドが正しく表示されませんでした。値の代わりにコロン記号（`:`）が表示されます。

* ACI0105770 バイナリモードでフォームをエクスプローラーのタブにドラッグ＆ドロップした場合，アプリケーションがクラッシュしました。

* ACI0105540 クライアント/サーバー版のみ。クライアント側では`DataClass.getInfo().exposed`が常に`True`を返しました。

* ACI0105754 Windows版のみ。フォームオブジェクトの「変数または式」にピリオド記号（`.`）が含まれている場合，MSCのアプリケーション検証でエラーが返されることがありました。

* ACI0105670 オブジェクト型フィールドに保存されたコレクション型のプロパティを`[]`シンタックスと`eval`でクエリした場合，正しい結果が返されませんでした。インデックスが設定されていなければ問題ありません。

* ACI0105725 ビルド版クライアントアプリケーションのみ。接続ダイアログのカスタムページのチェックボックスが正しい位置に表示されませんでした。

* ACI0105776 Windows版のみ。Windows server 2025 24H2で印刷を実行した場合，エラーが返されることがありました。23H2では問題ありません。
