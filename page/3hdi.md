---
layout: page
title: 例題
permalink: /hdi/
icon: download
type: page
---
    
* content
{:toc}

## 20r6 # {#v20r6}

* <i class="fa fa-download" aria-hidden="true"></i> [**RESTとQodlyによるシングルトンのサポート**](https://github.com/4D-JP/HDI/releases/download/20r6/HDI_Singletons.zip)<span id="20-6-7"></span><br />
4D 20 R5 では、[シングルトン](http://developer.4d.com/docs/ja/Concepts/classes#シングルトンクラス) が導入されました。4D 20 R6 では、REST で共有シングルトンの公開関数を直接呼び出すことができます。<br />
※ Qodly Studio の例題も含まれています。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [シングルトンのRESTとQodlyサポート](https://blog.4d.com/ja/rest-and-qodly-support-of-singletons/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D NetKit: OAuth2.0接続インターフェースのカスタマイズ**](https://github.com/4D-JP/HDI/releases/download/20r6/HDI_Netkit_BrowserAutoOpen_false.zip)<span id="20-6-6"></span><br />
4D 20 R6 以降、authenticateURI を使うことで、接続インターフェースを好きな場所に表示できるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Netkit：OAuth 2.0接続インターフェースのカスタマイズ](https://blog.4d.com/ja/4d-netkit-customizing-oauth-2-0-connection-interface/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 空のデータソースの表組みを管理**](https://github.com/4D-JP/HDI/releases/download/20r6/HDI_4DWP_TablesWithEmptyDataSources.zip)<span id="20-6-5"></span><br />
新しい属性 ([`wk empty datasource`](https://doc.4d.com/4Dv20R6/4D/20-R6/4D-Write-Pro-Attributes.300-6993958.ja.html#7005206)) の追加により、リンクされたデータソースが空の場合、その表組みをどのように描画するかを定義できるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro: 空のデータソースを管理する！](https://blog.4d.com/ja/4d-write-pro-manage-empty-datasources/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**HTTPエージェントによる HTTPリクエストの管理**](https://github.com/4D-JP/HDI/releases/download/20r6/HDI_HTTP_Classes_with_agent.zip)<span id="20-6-4"></span><br />
新しく追加された [`HTTPAgent`](http://developer.4d.com/docs/ja/API/HTTPAgentClass) クラスを使って、HTTPRequest クラス を使ったサーバー接続の持続性と再利用を管理することができます。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [HTTPエージェントによる HTTPリクエストの管理](https://blog.4d.com/ja/managing-http-requests-with-http-agents/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**エンティティセレクションから未定義エンティティを取り除く**](https://github.com/4D-JP/HDI/releases/download/20r6/HDI_CleanEntitySelection.zip)<span id="20-6-3"></span><br />
エンティティセレクションからエンティティを削除すると、削除された要素は未定義のままエンティティセレクション内に存在し続けます。これを取り除くため、新しい [`EntitySelection.clean()`](http://developer.4d.com/docs/ja/API/EntitySelectionClass#clean) 関数が使用できるようになりました。REST API では [`$entityset`](http://developer.4d.com/docs/ja/REST/entityset) に $clean パラメーターを渡すことで同様のことをおこなえます。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [ORDA - 歯抜けのエンティティセレクションにさよならを](https://blog.4d.com/ja/orda-say-goodbye-to-empty-spaces-in-your-entity-selections/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**セッションストレージの取得**](https://github.com/4D-JP/HDI/releases/download/20r6/HDI_SessionStorageByID.zip)<span id="20-6-2"></span><br />
セッションを識別する一意のIDから、そのセッションのストレージを取得する新しいコマンド [`Session storage by ID`](https://livedoc.4d.com/4dv20R/help/command/ja/page1839.html) が追加されました。共有オブジェクトをセッションストレージに保存して、セッション間で情報を共有する例題も含まれています。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [セッションストレージへのアクセスを強化](https://blog.4d.com/ja/enhanced-session-storage-access/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**セッションの権限確認**](https://github.com/4D-JP/HDI/releases/download/20r6/HDI_GetPrivileges.zip)<span id="20-6-1"></span><br />
セッションが持つ権限を確認するための [`session.getPrivileges()`](http://developer.4d.com/docs/ja/API/SessionClass#getprivileges) 関数が追加されました。また、REST API [`$info/privileges`](http://developer.4d.com/docs/ja/REST/info) も利用可能です。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [セッション権限を検査してデバッグを容易に](https://blog.4d.com/ja/permissions-inspect-session-privileges-for-easy-debugging)<br />

## 20r5 # {#v20r5}

* <i class="fa fa-download" aria-hidden="true"></i> [**コンポーネントマネージャー**](https://github.com/4D-JP/HDI/releases/download/20r5/HDI_Component_Management.zip)<span id="20-5-9"></span><br />
4D 20 R5 では、プロジェクトの依存関係を確認するための新しいインターフェース、コンポーネントマネージャーが追加されました。また、`dependencies.json` ファイル、および `environment4d.json` ファイルを使用した、プロジェクトの依存関係を定義するための柔軟で新しい方法が導入されました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4Dにおけるコンポーネント管理の簡素化](https://blog.4d.com/ja/simplifying-component-management-in-4d/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Qodly Studio for 4D: 認証とセッション終了**](https://github.com/4D-JP/HDI/releases/download/20r5/PIQS_QuitSession.zip)<span id="20-5-8"></span><br />
強制ログインモードの導入により、認証ステップでクライアントライセンスが消費されるのを避けられるようになりました。また、セッションを終了することで、4Dクライアントライセンスを即座に解放できます。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [Qodly Studio for 4D による 4Dクライアントライセンス消費方法の改善](https://blog.4d.com/ja/improved-4d-client-licenses-usage-with-qodly-studio-for-4d/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: カスタムファンクションとコレクション/オブジェクト引数**](https://github.com/4D-JP/HDI/releases/download/20r5/HDI_4DVP_Object_and_Collection_in_Custom_Functions.zip)<span id="20-5-7"></span><br />
4D View Pro のカスタムファンクションに、セルレンジに基づいたコレクション/オブジェクト引数を渡せるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D View Pro: カスタムファンクションの強化](https://blog.4d.com/ja/4d-view-pro-enhancement-of-custom-functions/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 表組みの行数が無制限に**](https://github.com/4D-JP/HDI/releases/download/20r5/HDI_4DWP_LargeTables.zip)<span id="20-5-6"></span><br />
4D Write Pro の表組みの最大行数 (1000件) の制限が廃止されました。これに伴い、膨大なデータを扱う場合に起こりうる問題を避けるため、HDI で紹介しているベストプラクティスに沿って作業することが推奨されます。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro: 制限のない表組み！](https://blog.4d.com/ja/4d-write-pro-tables-without-limit/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: テキストの回り込み**](https://github.com/4D-JP/HDI/releases/download/20r5/HDI_4DWP_ManageAnchoredPictures.zip)<span id="20-5-5"></span><br />
新しいアンカーモード [wk anchor layout](https://doc.4d.com/4Dv20R5/4D/20-R5/Handling-pictures.200-6851783.ja.html#6854646) が追加され、アンカーされた画像とテキストボックスにテキストを回り込ませることができるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro: アンカー画像とテキストボックスの表示オプションが増えました！](https://blog.4d.com/ja/4d-write-pro-more-display-options-for-anchored-pictures-and-text-boxes/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 用紙サイズの設定**](https://github.com/4D-JP/HDI/releases/download/20r5/HDI_4DWP_PageSize.zip)<span id="20-5-4"></span><br />
4D Write Pro にドキュメントの用紙サイズを設定するための新しい [`wk page size`](https://doc.4d.com/4Dv20R5/4D/20-R5/4D-Write-Pro-Attributes.300-6851817.ja.html#6934351) 属性が追加されました。これに伴い、新しい標準アクション `pageSize` も追加されています。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [便利な新しい 4D Write Pro属性: wk page size！](https://blog.4d.com/ja/a-handy-new-4d-write-pro-attribute-wk-page-size/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**リモートセッションオブジェクト**](https://github.com/4D-JP/HDI/releases/download/20r5/HDI_4DRemoteSession.zip)<span id="20-5-3"></span><br />
[Session](https://developer.4d.com/docs/ja/API/SessionClass)コマンドの対象がクライアント/サーバー接続とストアドプロシージャーに拡張されました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [クライアント/サーバー接続とストアドプロシージャーに対応した新しい 4Dリモートセッションオブジェクト](https://blog.4d.com/ja/new-4d-remote-session-object-with-client-server-connection-and-stored-procedure/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: データの制限**](https://github.com/4D-JP/HDI/releases/download/20r5/HDI_RestrictData.zip)<span id="20-5-2"></span><br />
ORDAによって取得されるデータを制限できるようになりました。この制限は Session オブジェクトを使用します。クライアントサーバーと Webサーバー (リモートデータストア、Qodly Studio含む) のコンテキストで利用可能です。<br />
※ Qodly Studio の例題も含まれています。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [ORDA - 取得データを制限する方法](https://blog.4d.com/ja/orda-restrict-data-to-relevant-criteria/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**新しいウィンドウタイプで外観をカスタマイズ**](https://github.com/4D-JP/HDI/releases/download/20r5/HDI_WindowTypeWithoutTitleBar.zip)<span id="20-5-1"></span><br />
新しいウィンドウタイプの追加により、ウィンドウの外観が完全にカスタマイズできるようになりました。また、次の新しいコマンドが追加されました:
   * [`MAXIMIZE WINDOW`](https://doc.4d.com/4Dv20R5/4D/20-R5/MAXIMIZE-WINDOW.301-6818209.ja.html)
   * [`MINIMIZE WINDOW`](https://doc.4d.com/4Dv20R5/4D/20-R5/MINIMIZE-WINDOW.301-6818206.ja.html)
   * [`REDUCE RESTORE WINDOW`](https://doc.4d.com/4Dv20R5/4D/20-R5/REDUCE-RESTORE-WINDOW.301-6848964.ja.html)
   * [`Is window maximized`](https://doc.4d.com/4Dv20R5/4D/20-R5/Is-window-maximized.301-6850247.ja.html)
   * [`Is window reduced`](https://doc.4d.com/4Dv20R5/4D/20-R5/Is-window-reduced.301-6850210.ja.html)
<br />
<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [新しいウィンドウタイプでアプリの外観をカスタマイズ](https://blog.4d.com/ja/customize-app-appearance-with-new-windows-types/)<br />

## 20r4 # {#v20r4}

* <i class="fa fa-download" aria-hidden="true"></i> [**日付と時間のフォーマット**](https://github.com/4D-JP/HDI/releases/download/20r4/HDI_NewDateTimeFormats.zip)<span id="20-4-4"></span><br />
日付と時間のフォーマットを細かにカスタマイズできるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [日付と時間のカスタマイズ](https://blog.4d.com/ja/tailored-customization-for-dates-and-times/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 電子インボイスの作成**](https://github.com/4D-JP/HDI/releases/download/20r4/HDI_4DWP_GenerateFacturX.zip)<span id="20-4-3"></span><br />
4D Write Pro を使って、XMLファイルが埋め込まれた PDF/A3形式の PDFファイルを出力できるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro：電子インボイスの作成](https://blog.4d.com/ja/4d-write-pro-electronic-invoice-generation/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Gmail API: ラベルの管理**](https://github.com/4D-JP/HDI/releases/download/20r4/HDI_Google_manage_labels.zip)<span id="20-4-2"></span><br />
Google API を使って Gmailアカウントのラベルを作成・編集・削除できるようになりました。<br />
※ SVGを使って簡単なアイコンを作る例題も含まれています。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Netkit：Gmailラベルの作成・削除・更新](https://blog.4d.com/ja/4d-netkit-create-delete-and-update-gmail-labels/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Gmail API: メールの管理**](https://github.com/4D-JP/HDI/releases/download/20r4/HDI_Google_manage_mails.zip)<span id="20-4-1"></span><br />
Google API を使って Gmailアカウントのメールのラベルを変更できるようになったほか、複数のメールを一括取得できるようになりました。<br />
※ SVGを使って、簡単なアイコンを作る例題も含まれています。このアイコンを階層リストやリストボックス内に表示できます。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Netkit：Gmail API によるラベル割り当て＆複数メールの取得](https://blog.4d.com/ja/4d-netkit-assign-labels-get-multiple-emails-with-gmail-api/)<br />

## 20r3 # {#v20r3}

* <i class="fa fa-download" aria-hidden="true"></i> [**ピクチャー/Blob属性にファイル参照を代入する**](https://github.com/4D-JP/HDI/releases/download/20r3/HDI_Path_For_Picture.zip)<span id="20-3-6"></span><br />
ピクチャーまたは Blob属性に 4D.File オブジェクトまたはパスを渡すことで、ファイルへの参照を代入できるようになりました。<br />
参照: [ピクチャーまたは Blob属性にファイルを代入する](http://developer.4d.com/docs/ja/20-R3/ORDA/entities#%E3%83%94%E3%82%AF%E3%83%81%E3%83%A3%E3%83%BC%E3%81%BE%E3%81%9F%E3%81%AF-blob%E5%B1%9E%E6%80%A7%E3%81%AB%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92%E4%BB%A3%E5%85%A5%E3%81%99%E3%82%8B)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [ORDA: Blob/ピクチャー属性へのパスの割り当て](https://blog.4d.com/ja/orda-assigning-a-path-to-a-blob-or-picture-attribute/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**データ変更の追跡**](https://github.com/4D-JP/HDI/releases/download/20r3/HDI_Data_Change_Tracking.zip)<span id="20-3-5"></span><br />
データベースにおけるデータ変更を追跡するための [グローバルスタンプ](http://developer.4d.com/docs/ja/ORDA/global-stamp) が導入されました。また、これを管理するための新しい関数  [`ds.getGlobalStamp()`](http://developer.4d.com/docs/ja/API/DataStoreClass#getglobalstamp)、 [`ds.setGlobalStamp()`](http://developer.4d.com/docs/ja/API/DataStoreClass#setglobalstamp) が追加されました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [データベースのデータ変更を追跡](https://blog.4d.com/ja/track-data-changes-in-your-database/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Gmail API: メールの受信**](https://github.com/4D-JP/HDI/releases/download/20r3/HDI_Google_get_mails.zip)<span id="20-3-4"></span><br />
Google API を使って Gmailアカウントからメールを受信できるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Netkit: Gmail からラベルや Eメールを取得](https://blog.4d.com/ja/4d-netkit-get-labels-and-emails-from-gmail/)<br />


* <i class="fa fa-download" aria-hidden="true"></i> [**複数コレクションの同期ソート**](https://github.com/4D-JP/HDI/releases/download/20r3/HDI_Collection_multiSort.zip)<span id="20-3-3"></span><br />
複数のコレクションを同期的にソートするための新しい  [`Collection.multiSort()`](http://developer.4d.com/docs/ja/API/CollectionClass#multisort) 関数が追加されました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [複数コレクションの同期ソート](https://blog.4d.com/ja/sync-several-collections-with-this-new-function/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: フォーミュラに名前を付ける**](https://github.com/4D-JP/HDI/releases/download/20r3/HDI_4DWP_GiveNameToFormulas.zip)<span id="20-3-2"></span><br />
4D Write Pro ドキュメントのフォーミュラに名前が付けられるようになりました。これにより、複雑なフォーミュラを役割名などで表せるようになり、エンドユーザーにとってドキュメントの可読性が向上します。  <br />
これにともない、次の 2つのコマンドが拡張されました: [`WP Get formulas`](https://doc.4d.com/4Dv20R3/4D/20-R3/WP-Get-formulas.301-6475197.ja.html)、 [`WP INSERT FORMULA`](https://doc.4d.com/4Dv20R3/4D/20-R3/WP-INSERT-FORMULA.301-6475193.ja.html) <br />
参考: [フォーミュラの管理＞参照を名前で表示](https://doc.4d.com/4Dv20R3/4D/20-R3/Managing-formulas.300-6475178.ja.html#6476648)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro: フォーミュラに名前を付ける](https://blog.4d.com/ja/4d-write-pro-assign-names-to-formulas/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: PDF/A への書き出し**](https://github.com/4D-JP/HDI/releases/download/20r3/HDI_4DWP_ExportAsPDFA.zip)<span id="20-3-1"></span><br />
4D Write Pro ドキュメントを PDF/Aに書き出せるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro : PDF/A形式での書き出しが可能になりました！](https://blog.4d.com/ja/4d-write-pro-pdf-a-format-now-available-for-export/)<br />

## 20r2 # {#v20r2}

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 表ウィザード**](https://github.com/4D-JP/HDI/releases/download/20r2/HDI_WPTableWizard.zip)<span id="20-2-6"></span><br />
データソース付きの表組みを作成し、4D Write Pro ドキュメントに挿入するのを助ける表ウィザードが実装されました。このウィザードはエンドユーザーも利用できるもので、デベロッパーによるテンプレートや表示名などの設定が可能です。<br />
参考: [4D WritePro Interface](https://doc4d.github.io/docs/ja/WritePro/writeprointerface/)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro – データソース付き表組みの作成ウィザード](https://blog.4d.com/ja/4d-write-pro-a-wizard-to-create-tables-with-data/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**エラーのスロー**](https://github.com/4D-JP/HDI/releases/download/20r2/HDI_THROW.zip)<span id="20-2-5"></span><br />
v20R2 では、新しい [`throw`](https://livedoc.4d.com/--20-R2/-/throw.301-6429523.ja.html) コマンドを使って、エラーをスローできるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4Dコードのエラー管理を強化](https://blog.4d.com/ja/enhanced-error-management-in-4d-code/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D NetKit: OAuth2.0サーバーへの接続**](https://github.com/4D-JP/HDI/releases/download/20r2/HDI_ConnectGithubWithOauth2.zip)<span id="20-2-4"></span><br />
[4D NetKit](https://github.com/4d/4D-NetKit/tree/20R2) を使って、Microsoft や Google 以外の OAuth2.0 サーバーにも接続することができます。ここでは、GitHubへの接続を紹介します。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D NetKit: OAuth2認証の強化](https://blog.4d.com/ja/4d-netkit-enhancement-of-oauth2-authorization__trashed/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Gmail API: メール送信**](https://github.com/4D-JP/HDI/releases/download/20r2/HDI_google_SendMail.zip)<span id="20-2-3"></span><br />
Google API を使って Gmailアカウントからメール送信ができるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [Gmail API を使ったメール送信](https://blog.4d.com/ja/send-email-with-the-gmail-api/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 表組みのセル結合**](https://github.com/4D-JP/HDI/releases/download/20r2/HDI_4DWP_CellsMerge.zip)<span id="20-2-2"></span><br />
4D Write Pro の表組みのセルを結合できるようになりました。これに伴い、[`WP TABLE MERGE CELLS`](https://doc.4d.com/4Dv20R2/4D/20-R2/WP-TABLE-MERGE-CELLS.301-6392816.ja.html) および [`WP TABLE SPLIT CELLS`](https://doc.4d.com/4Dv20R2/4D/20-R2/WP-TABLE-SPLIT-CELLS.301-6397459.ja.html) コマンドも追加されています。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro: 表組みのセル結合](https://blog.4d.com/ja/4d-write-pro-tables-introducing-cells-merge/)<br />
  
* <i class="fa fa-download" aria-hidden="true"></i> [**WebSocketクライアント**](https://github.com/4D-JP/HDI/releases/download/20r2/HDI_WebSocket.zip)<span id="20-2-1"></span><br />
4D v20 R2 では、4D で WebSocketクライアント接続するための [WebSocket クラス](http://developer.4d.com/docs/ja/API/WebSocketClass) が追加されました。簡単なチャットを例に使い方を紹介します。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [WebSocketクライアント](https://blog.4d.com/ja/websocket-client/)<br />

## 20 # {#v20}

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 表組みのブレーク行**](https://github.com/4D-JP/HDI/releases/download/20/HDI_4DWP_ORDA_Breaks.zip)<span id="20-0-6"></span><br />
4D Write Pro の表組みに [ブレーク行](https://doc.4d.com/4Dv20/4D/20/Handling-tables.200-6229469.ja.html#6233076) (小計行) を設定できるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro: 表組みにブレーク行を追加！](https://blog.4d.com/ja/break-rows-a-new-addition-to-4d-write-pro-tables/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**WebSocketサーバー**](https://github.com/4D-JP/HDI/releases/download/20/HDI_WebSocket_Server.zip)<span id="20-0-5"></span><br />
4D v20 より、4D は WebSocketサーバーを作成するためのコマンドを提供します。この HDI では、簡単なチャットを例に WebSocketサーバーの使い方を紹介します。<br />
参照： [WebSocketServer クラス](http://developer.4d.com/docs/ja/API/WebSocketServerClass)、 [WebSocketConnection クラス](http://developer.4d.com/docs/ja/API/WebSocketConnectionClass)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [新しいビルトイン WebSocketサーバー](https://blog.4d.com/ja/new-built-in-websocket-server/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Office365: フォルダーの作成・削除・名前の変更**](https://github.com/4D-JP/HDI/releases/download/20/HDI_Office365_manage_folders.zip)<span id="20-0-4"></span><br />
Microsoft の Graph API を使用してメールフォルダーを作成・削除・名前変更する方法を紹介します。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [Microsoft 365: Microsoft Graph APIによるメールフォルダーの作成・削除・名前の変更](https://blog.4d.com/ja/microsoft-365-create-delete-and-rename-mail-folders-with-the-microsoft-graph-api/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: テキストボックスの docx読み込み/書き出し**](https://github.com/4D-JP/HDI/releases/download/20/HDI_4DWP_UseTextBoxes_V2.zip)<span id="20-0-3"></span><br />
4D v19 R8 で追加されたテキストボックスが、docx の読み込み/書き出しにも対応するようになりました。これに伴い、読み込み/書き出しのオプションも新たに追加されています。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro: テキストボックスの docx 読み込み/書き出し](https://blog.4d.com/ja/4d-write-pro-text-boxes-docx-import-export-options/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**コレクションの操作 v2**](https://github.com/4D-JP/HDI/releases/download/20/HDI_Collection_Functions.zip)<span id="20-0-2"></span><br />
Collectionクラスに追加された新しい関数の紹介です:<br />
 [`first()`](http://developer.4d.com/docs/ja/API/CollectionClass/#first) コレクションの先頭要素を返します<br />
 [`last()`](http://developer.4d.com/docs/ja/API/CollectionClass/#last) コレクションの最終要素を返します <br />
 [`at()`](http://developer.4d.com/docs/ja/API/CollectionClass/#at) 指定インデックスにある要素を返します<br />
 [`flat()`](http://developer.4d.com/docs/ja/API/CollectionClass/#flat) ネストされたコレクションを平坦化します<br />
 [`includes()`](http://developer.4d.com/docs/ja/API/CollectionClass/#includes) 指定した式の値がコレクション内で見つかれば true を返します<br />
 [`reduceRight()`](http://developer.4d.com/docs/ja/API/CollectionClass/#reduceright) reverse().reduce() と同じ効果<br />
 [`flatMap()`](http://developer.4d.com/docs/ja/API/CollectionClass/#flatmap) map().flat() と同じ効果<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [コレクションに便利な関数を追加しました！](https://blog.4d.com/ja/new-handy-functions-for-collections/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**ボタン等の新しいプロパティ**](https://github.com/4D-JP/HDI/releases/download/20/HDI_Buttons.zip)<span id="20-0-1"></span><br />
ボタン・チェックボックス・ラジオボタンにタイトルの [横揃え](http://developer.4d.com/docs/ja/FormObjects/propertiesText/#%E6%A8%AA%E6%8F%83%E3%81%88) および [タイトルと画像を隣接させる](https://developer.4d.com/docs/ja/FormObjects/propertiesTextAndPicture/#%E3%82%BF%E3%82%A4%E3%83%88%E3%83%AB%E3%81%A8%E7%94%BB%E5%83%8F%E3%82%92%E9%9A%A3%E6%8E%A5%E3%81%95%E3%81%9B%E3%82%8B) プロパティが追加されました。また、チェックボックスとラジオボタンについては、画像の [状態の数](https://developer.4d.com/docs/ja/FormObjects/propertiesTextAndPicture/#%E7%8A%B6%E6%85%8B%E3%81%AE%E6%95%B0) の最大が 6 に拡張されました。<br />
いずれもボタンスタイルによってはプロパティが適用されない場合があります。詳しくは各プロパティのドキュメントを参照ください。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [フォームオブジェクトの進化](https://blog.4d.com/ja/evolution-of-form-objects/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Office365: メールのコピー・移動・返信・削除**](https://github.com/4D-JP/HDI/releases/download/19r8/HDI_Office365_manage_mails.zip) (v19r8)<span id="19-8-6"></span><br />
Microsoft の Graph API を使用してメールをコピー・移動・返信・削除する方法を紹介します。<br />
参照: [4D NetKit](https://github.com/4d/4D-NetKit/tree/19RX)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [Microsoft 365: Microsoft Graph API でメールをコピー、移動、返信、削除する](https://blog.4d.com/ja/microsoft-365-copy-move-reply-and-delete-emails-with-the-microsoft-graph-api/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Office365: メールの受信**](https://github.com/4D-JP/HDI/releases/download/19r8/HDI_Office365_get_mails.zip) (v19r8)<span id="19-8-5"></span><br />
Microsoft の Graph API を使用してメールを受信する方法を紹介します。<br />
参照: [4D NetKit](https://github.com/4d/4D-NetKit/tree/19RX)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [Microsoft 365: Microsoft Graph API でメールを受信する](https://blog.4d.com/ja/microsoft-365-receive-emails-with-the-microsoft-graph-api/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Webセッションとアクセス権限**](https://github.com/4D-JP/HDI/releases/download/19r8/HDI_Permissions.zip) (v19r8)<span id="19-8-4"></span><br />
4D のスケーラブルWebセッションに権限を付与することで、データへのアクセスを詳細に管理できるようになりました。<br />
参照: [ORDA ＞ 権限](http://developer.4d.com/docs/ja/ORDA/privileges)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [完全な権限システムでデータアクセスをフィルタリングする](https://blog.4d.com/ja/filter-access-to-your-data-with-a-complete-system-of-permissions/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: 表組みとテーマ**](https://github.com/4D-JP/HDI/releases/download/19r8/HDI_4DVP_tableStyle.zip) (v19r8)<span id="19-8-3"></span><br />
4D View Pro の表組みにテーマを適用できるようになりました。 [`VP SET TABLE THEME`](http://developer.4d.com/docs/ja/ViewPro/method-list#vp-set-table-theme) コマンドが追加されたほか、 [`VP CREATE TABLE`](http://developer.4d.com/docs/ja/ViewPro/method-list#vp-create-table) コマンドが拡張され、テーマオプションをサポートするようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D View Pro: 表組みのスタイルをカスタマイズ](https://blog.4d.com/ja/4d-view-pro-customize-the-style-of-your-tables/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: テキストボックス**](https://github.com/4D-JP/HDI/releases/download/19r8/HDI_4DWP_UseTextBoxes.zip) (v19r8)<span id="19-8-2"></span><br />
4D Write Pro でテキストボックスを利用できるようになりました。それにともない、2つの新しいコマンドも追加されています: [`WP New text box`](https://doc.4d.com/4Dv19R8/4D/19-R8/WP-New-text-box.301-6196646.ja.html)、[`WP DELETE TEXT BOX`](https://doc.4d.com/4Dv19R8/4D/19-R8/WP-DELETE-TEXT-BOX.301-6196772.ja.html)<br />
参照: [テキストボックスの管理](https://doc.4d.com/4Dv19R8/4D/19-R8/Using-a-4D-Write-Pro-area.200-6130476.ja.html#6131907)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro : フローティングテキストボックス！](https://blog.4d.com/ja/4d-write-pro-say-welcome-to-floating-text-boxes/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: コレクション/エンティティセレクション型での自動行高**](https://github.com/4D-JP/HDI/releases/download/19r8/HDI_LISTBOX_VariableRowHeight.zip) (v19r8)<span id="19-8-1"></span><br />
コレクション/エンティティセレクション型のリストボックスでも自動行高が設定できるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [コレクション型のリストボックスにおける自動行高](https://blog.4d.com/ja/variable-row-heights-in-collection-based-list-boxes/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 下部キャリーオーバー行**](https://github.com/4D-JP/HDI/releases/download/19r7/HDI_4DWP_CarryOverRows.zip) (v19r7)<span id="19-7-7"></span><br />
データソースに紐づいた表組みを使用する際、表が複数ページに分割される場合に [下部キャリーオーバー行](https://doc.4d.com/4Dv19R7/4D/19-R7/Handling-tables.200-6011887.ja.html#6021028) を表示できるようになりました。これは通常、小計を表示するのに使用します。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro: キャリーオーバー行を導入](https://blog.4d.com/ja/4d-write-pro-carry-over-rows-are-available/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: フォーミュラの簡略表示**](https://github.com/4D-JP/HDI/releases/download/19r7/HDI_4DWP_DisplayFormulas.zip) (v19r7)<span id="19-7-6"></span><br />
新しく追加された [フォーミュラソースを記号として表示](https://doc.4d.com/4Dv19R7/4D/19-R7/Managing-formulas.300-6011882.ja.html#6014416) プロパティを使って、ドキュメントのフォーミュラを ⓕ 記号として簡略に表示することができます。これは、エンドユーザーがフォーミュラの詳細な定義を知る必要がない場合に便利です。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro: ユーザーフレンドリーな式表示](https://blog.4d.com/ja/4d-write-pro-user-friendly-display-of-formulas/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ドキュメントの変更検知**](https://github.com/4D-JP/HDI/releases/download/19r7/HDI_4DWP_ModifiedDocuments.zip) (v19r7)<span id="19-7-5"></span><br />
新しい [`.modified`](https://doc.4d.com/4Dv19R7/4D/19-R7/4D-Write-Pro-Attributes.300-6011946.ja.html#6015862) プロパティを使って、ドキュメントが変更されたかどうかを検知できます。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro – ドキュメントの変更を検知](https://blog.4d.com/ja/4d-write-pro-document-modification-detection/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: 複数行のドラッグ＆ドロップ**](https://github.com/4D-JP/HDI/releases/download/19r7/HDI_LB_DragAndDrop.zip) (v19r7)<span id="19-7-4"></span><br />
リストボックスから複数行をドラッグ＆ドロップする際、"alt" キーを使わなくても自然に操作できるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [リストボックス – Altキーよ、さようなら！](https://blog.4d.com/ja/list-boxes-say-goodbye-to-alt-key/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: 表組みの列の管理**](https://github.com/4D-JP/HDI/releases/download/19r7/HDI_4DVP_TablesManagement.zip) (v19r7)<span id="19-7-3"></span><br />
新しく追加された　[`VP INSERT TABLE COLUMNS`](http://developer.4d.com/docs/ja/ViewPro/method-list#vp-insert-table-columns)、
[`VP REMOVE TABLE COLUMNS`](http://developer.4d.com/docs/ja/ViewPro/method-list#vp-remove-table-columns)、
[`VP SET TABLE COLUMN ATTRIBUTES`](http://developer.4d.com/docs/ja/ViewPro/method-list#vp-set-table-column-attributes)、
[`VP Get table column index`](http://developer.4d.com/docs/ja/ViewPro/method-list#vp-get-table-column-index) を使って表組に列を追加・削除する方法を紹介します。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D View Pro: 行と列を管理する新しいコマンド](https://blog.4d.com/ja/4d-view-pro-new-commands-to-manage-rows-columns/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**フォームオブジェクトの角の丸み**](https://github.com/4D-JP/HDI/releases/download/19r7/HDI_RoundedCorner.zip) (v19r7)<span id="19-7-2"></span><br />
静的テキストおよび入力オブジェクトのプロパティに [`角の半径`](http://developer.4d.com/docs/ja/FormObjects/propertiesCoordinatesAndSizing#%E8%A7%92%E3%81%AE%E5%8D%8A%E5%BE%84) が追加され、角の丸みを設定できるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [角の丸み、登場！](https://blog.4d.com/ja/say-hello-to-rounded-corners/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**FileHandle クラス**](https://github.com/4D-JP/HDI/releases/download/19r7/HDI_FileHandle.zip) (v19r7)<span id="19-7-1"></span><br />
新しく追加された　[`FileHandle　クラス`](http://developer.4d.com/docs/ja/API/FileHandleClass) で、ファイルを毎回開いたり閉じたりする必要なく、書き込み・読み取りが容易にできるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [ファイル、フォルダー…そしてファイルハンドル!](https://blog.4d.com/ja/files-folders-and-now-file-handles/)

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 空ピクチャーの非表示化**](https://github.com/4D-JP/HDI/releases/download/19r6/HDI_4DWP_HideEmptyPictures.zip) (v19r6)<span id="19-6-7"></span><br />
4D Write Pro ドキュメントに含まれる空ピクチャーを非表示にできるようになりました (デフォルトでは空の四角を表示)。<br />
参照: [空のピクチャー](https://doc.4d.com/4Dv19R6/4D/19-R6/Handling-pictures.200-5903894.ja.html#5938250)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro: 空ピクチャーの非表示化](https://blog.4d.com/ja/4d-write-pro-disable-visibility-of-empty-images/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**メール: OAuth2を使って、Microsoftアカウントからメールを送信する**](https://github.com/4D-JP/HDI/releases/download/19r6/HDI_office365_SendMail.zip) (v19r6)<span id="19-6-6"></span><br />
4D NetKit が提供する OAuth2Provider クラス、および Office365クラスを使って、Microsoftアカウントと連携してメールを送信する方法を紹介します。<br />
参照: [4D NetKit](https://github.com/4d/4D-NetKit/tree/19RX)、HDI "[メール: Microsoft ID プラットフォームから Oauth2.0アクセストークンを取得](https://4d-jp.github.io/hdi/#v19r3)"<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [Microsoft 365: 電子メールの送信](https://blog.4d.com/ja/microsoft-365-send-emails/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: 表組みとデータコンテキスト**](https://github.com/4D-JP/HDI/releases/download/19r6/HDI_4DVP_CreateTables.zip) (v19r6)<span id="19-6-5"></span><br />
新しく追加された [`VP CREATE TABLE`](http://developer.4d.com/docs/ja/ViewPro/method-list/#vp-create-table) と [`VP REMOVE TABLE`](http://developer.4d.com/docs/ja/ViewPro/method-list/#vp-remove-table) コマンドを使って、表組みの作成と削除ができるようになりました。この表組みにデータコンテキストを関連付けることで、コレクションやオブジェクトに格納されたデータを簡単に表示できます。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D View Pro: コレクションを表組みとして表示](https://blog.4d.com/ja/4d-view-pro-display-your-collections-as-tables/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 表組みとデータソースの関連付け**](https://github.com/4D-JP/HDI/releases/download/19r6/HDI_4DWP_ORDA_Tables.zip) (v19r6)<span id="19-6-4"></span><br />
4D Write Pro ドキュメントの表組みに、コレクションやエンティティセレクションをデータソースとして関連づけられるようになりました。<br />
参照: [データソースに基づくテーブル](https://livedoc.4d.com/4Dv19R6/4D/19-R6/Handling-tables.200-5908411.ja.html#5908491)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro: エンティティセレクションやコレクションで表組みを動的に埋める](https://blog.4d.com/ja/4d-write-pro-dynamically-fill-tables-with-entity-selections-collections/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: プロパティの取得・設定**](https://github.com/4D-JP/HDI/releases/download/19r6/HDI_LISTBOXES_Properties_v3.zip) (v19r6)<span id="19-6-3"></span><br />
[`LISTBOX SET PROPERTY`](https://doc.4d.com/4Dv19R6/4D/19-R6/LISTBOX-SET-PROPERTY.301-5911042.ja.html)、および
[`LISTBOX Get property`](https://doc.4d.com/4Dv19R6/4D/19-R6/LISTBOX-Get-property.301-5911088.ja.html) コマンドを使って、リストボックスのプロパティを設定する方法を紹介します。<br />
4D v19 R6 では "横方向パディング" および "縦方向パディング" プロパティが新たに追加され、内マージンの設定が可能になりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [リストボックス: もっと美しく、もっと便利に](https://blog.4d.com/ja/list-boxes-more-control-more-beauty/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**フォーミュラを関数やコマンド内で使う**](https://github.com/4D-JP/HDI/releases/download/19r6/HDI_formula_in_commands.zip) (v19r6)<span id="19-6-2"></span><br />
コードを呼び出す Collectionクラス関数は、formula 引数として Formulaオブジェクトをサポートするようになりました。<br />
また、
[`EXECUTE METHOD IN SUBFORM`](https://doc.4d.com/4Dv19R6/4D/19-R6/EXECUTE-METHOD-IN-SUBFORM.301-5910907.ja.html)、
[`CALL FORM`](https://doc.4d.com/4Dv19R6/4D/19-R6/CALL-FORM.301-5910890.ja.html)、
[`CALL WORKER`](https://doc.4d.com/4Dv19R6/4D/19-R6/CALL-WORKER.301-5911386.ja.html) コマンドも Formulaオブジェクトをサポートするようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [コレクションとコールバックコマンドにおけるフォーミュラの使用](https://blog.4d.com/ja/the-use-of-formulas-in-collections-callback-commands/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**HTTPRequest クラス**](https://github.com/4D-JP/HDI/releases/download/19r6/HDI_HTTP_Classes.zip) (v19r6)<span id="19-6-1"></span><br />
新しい [`HTTPRequest`](http://developer.4d.com/docs/ja/API/HTTPRequestClass/)クラスを使って、HTTPRequest オブジェクト を扱うことができます。このオブジェクトは、HTTPサーバーへのリクエストの設定と送信、および HTTPサーバーのレスポンスを処理するのに使用します。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [HTTPクラス: 非同期の HTTPリクエストを実行する新しい方法](https://blog.4d.com/ja/http-classes-a-new-way-to-perform-asynchronous-http-requests/)

* <i class="fa fa-download" aria-hidden="true"></i> [**ORDAキャッシュの管理とRESTリクエストの最適化**](https://github.com/4D-JP/HDI/releases/download/19r5/HDI_ORDA_ContextAndRequestsOptimization.zip) (v19r5)<span id="19-5-7"></span><br />
パフォーマンスのさらなる向上のため、ORDAキャッシュを管理する機能とRESTリクエストを最適化する機能が追加されました。<br />
 [`dataClass.setRemoteCacheSettings()`](http://developer.4d.com/docs/ja/API/DataClassClass/#setremotecachesettings)、
 [`dataClass.getRemoteCache()`](http://developer.4d.com/docs/ja/API/DataClassClass/#getremotecache)、
 [`dataClass.clearRemoteCache()`](http://developer.4d.com/docs/ja/API/DataClassClass/#clearremotecache)、
 [`entitySelection.getRemoteContextAttributes()`](http://developer.4d.com/docs/ja/API/EntitySelectionClass/#getremotecontextattributes)、
 [`entity.getRemoteContextAttributes()`](http://developer.4d.com/docs/ja/API/EntityClass/#getremotecontextattributes)、
 [`dataStore.getRemoteContextInfo()`](http://developer.4d.com/docs/ja/API/DataStoreClass/#getremotecontextinfo)、
 [`dataStore.getAllRemoteContexts()`](http://developer.4d.com/docs/ja/API/DataStoreClass/#getallremotecontexts)、
 [`dataStore.clearAllRemoteContexts()`](http://developer.4d.com/docs/ja/API/DataStoreClass/#clearallremotecontexts)、
 [`dataStore.setRemoteContextInfo()`](http://developer.4d.com/docs/ja/API/DataStoreClass/#setremotecontextinfo)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [ORDA - RESTリクエストの管理によるパフォーマンスの最適化](https://blog.4d.com/ja/orda-optimize-performance-with-full-control-over-rest-requests/)<br />
 
* <i class="fa fa-download" aria-hidden="true"></i> [**親フォームとサブフォーム間の通信**](https://github.com/4D-JP/HDI/releases/download/19r5/HDI_4D_SubformCommunication.zip) (v19r5)<span id="19-5-6"></span><br />
新しく追加された [`OBJECT Get subform container value`](https://doc.4d.com/4Dv19R5/4D/19-R5/OBJECT-Get-subform-container-value.301-5862192.ja.html) および [`OBJECT SET SUBFORM CONTAINER VALUE`](https://doc.4d.com/4Dv19R5/4D/19-R5/OBJECT-SET-SUBFORM-CONTAINER-VALUE.301-5862140.ja.html) コマンドを使い、親フォームとサブフォーム間でスカラー型の変数あるいは式を同期させることができます。<br />
参考: [サブフォーム](https://doc4d.github.io/docs/ja/FormObjects/subformOverview.html#%E8%A6%AA%E3%83%95%E3%82%A9%E3%83%BC%E3%83%A0%E3%81%A8%E3%82%B5%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%A0%E3%81%AE%E5%90%8C%E6%9C%9F-%E5%8D%98%E4%B8%80%E5%80%A4)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [フォームとサブフォームの通信を簡単に](https://blog.4d.com/ja/form-and-subform-communication-made-easy/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: データコンテキストの利用**](https://github.com/4D-JP/HDI/releases/download/19r5/HDI_4DVP_DataContext.zip) (v19r5)<span id="19-5-5"></span><br />
4D View Pro ドキュメントのシートにデータコンテキストを関連付けることができるようになりました。オブジェクトまたはコレクションをバインドすることで、それらの内容をシートのセルに自動で表示することができます。<br />
参考: [`VP SET DATA CONTEXT`](http://developer.4d.com/docs/ja/ViewPro/method-list/#vp-set-data-context)、
[`VP Get data context`](http://developer.4d.com/docs/ja/ViewPro/method-list/#vp-get-data-context)、
[`VP SET BINDING PATH`](http://developer.4d.com/docs/ja/ViewPro/method-list/#vp-set-binding-path)、
[`VP Get binding path`](http://developer.4d.com/docs/ja/ViewPro/method-list/#vp-get-binding-path)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D View Pro: データコンテキストを使ったデータ表示](https://blog.4d.com/ja/4d-view-pro-populate-your-sheets-with-a-data-context/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: データコンテキストの利用**](https://github.com/4D-JP/HDI/releases/download/19r5/HDI_4DWP_ORDA.zip) (v19r5)<span id="19-5-4"></span><br />
4D v19R5 より、4D Write Pro ドキュメントにデータコンテキストを関連付けることができるようになりました。これにより、テンプレートドキュメント内で、エンティティやエンティティセレクションといった ORDAデータのほか、任意のオブジェクトデータを利用することができます。<br />
参考: [`WP SET DATA CONTEXT`](https://doc.4d.com/4Dv19R5/4D/19-R5/WP-SET-DATA-CONTEXT.301-5866708.ja.html)、[`WP Get data context`](https://doc.4d.com/4Dv19R5/4D/19-R5/WP-Get-data-context.301-5866737.ja.html)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [ORDA と 4D Write Pro : パワーカップル!](https://blog.4d.com/ja/orda-and-4d-write-pro-the-power-couple/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 段落のリンク**](https://github.com/4D-JP/HDI/releases/download/19r5/HDI_4DWP_LinkedParagraphs.zip) (v19r5)<span id="19-5-3"></span><br />
4D Write Pro の段落を、次の段落とリンクするための新しい `wk keep with next` 属性が追加されました。これを設定すると、改ページやカラムブレークにより、離してはいけない段落同士が分離されてしまうことを防げます。<br />
参考: [段落ブレーク＞自動ブレークを管理する＞次の段落につなげる](https://doc.4d.com/4Dv19R5/4D/19-R5/Using-a-4D-Write-Pro-area.200-5827439.ja.html#5864778)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro - 段落リンクでレイアウト改善](https://blog.4d.com/ja/4d-write-pro-elevate-your-documents-layout-with-linked-paragraphs/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Write Pro: 繰り返し表示される表組みのヘッダー行**](https://github.com/4D-JP/HDI/releases/download/19r5/HDI_4DWP_RepeatedHeaders.zip) (v19r5)<span id="19-5-2"></span><br />
4D v19R5 より、4D Write Pro の表組みは、最大5行までのヘッダー行を持てるようになりました。<br />
参考: [テーブルの管理＞繰り返し表示されるヘッダー行](https://doc.4d.com/4Dv19R5/4D/19-R5/Using-a-4D-Write-Pro-area.200-5827439.ja.html#5859192)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro: 表組みのヘッダー行](https://blog.4d.com/ja/4d-write-pro-say-hello-to-table-headers/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Copy Parameters**](https://github.com/4D-JP/HDI/releases/download/19r5/HDI_CopyParameters.zip) (v19r5)<span id="19-5-1"></span><br />
新しく追加された [`Copy parameters`](https://doc.4d.com/4Dv19R5/4D/19-R5/Copy-parameters.301-5872607.ja.html) コマンドを使い、関数/メソッドから関数/メソッドへと引数を転送することができます。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [パラメーターを簡単に管理する方法](https://blog.4d.com/ja/a-seamless-way-to-manage-parameters/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**システムワーカー**](https://github.com/4D-JP/HDI/releases/download/19r4/HDI_Systemworker.zip) (v19r4)<span id="19-4-4"></span><br />
新しい [`SystemWorker`](http://developer.4d.com/docs/ja/API/SystemWorkerClass/) クラスを使って、外部プロセスを非同期に実行することができます。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [外部プロセスを非同期で起動する](https://blog.4d.com/ja/launch-an-external-process-asynchronously/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**View Pro: ワークブックオプションの管理**](https://github.com/4D-JP/HDI/releases/download/19r4/HDI_4DVP_workbook_options.zip) (v19r4)<span id="19-4-3"></span><br />
新しい [`VP SET WORKBOOK OPTIONS`](https://developer.4d.com/docs/ja/ViewPro/method-list/#vp-set-workbook-options) コマンドを使って、様々なワークブックオプションを管理することができます。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D View Pro:ワークブックオプション](https://blog.4d.com/ja/4d-view-pro-workbook-options/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Write Pro: 表組みの行内部の自動改ページ**](https://github.com/4D-JP/HDI/releases/download/19r4/HDI_4DWP_PageBreaksInTableRows.zip) (v19r4)<span id="19-4-2"></span><br />
4D Write Pro に新しい `wk page break inside row` 属性が追加され、表組みの行内部の自動改ページができるようになりました。<br />
参考: [表のページ分け](https://doc.4d.com/4Dv19R4/4D/19-R4/Using-a-4D-Write-Pro-area.200-5760411.ja.html#5798838)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro - ページレイアウトをより詳細に管理](https://blog.4d.com/ja/4d-write-pro-more-control-on-page-layout/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**ORDAクラス: エイリアス属性**](https://github.com/4D-JP/HDI/releases/download/19r4/HDI_ORDA_Aliases.zip) (v19r4)<span id="19-4-1"></span><br />
ORDAクラスに [エイリアス属性](https://doc4d.github.io/docs/ja/ORDA/ordaClasses.html#%E3%82%A8%E3%82%A4%E3%83%AA%E3%82%A2%E3%82%B9%E5%B1%9E%E6%80%A7-1) を定義できるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [ORDA - エイリアス属性](https://blog.4d.com/ja/orda-say-hello-to-aliases/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**メール: Microsoft ID プラットフォームから Oauth2.0アクセストークンを取得**](https://github.com/4D-JP/HDI/releases/download/19r3/HDI_OAuth2_Microsoft_mail.zip) (v19r3)<span id="19-3-6"></span><br />
Microsoft ID プラットフォームから Oauth2.0アクセストークンを取得し、IMAP および SMTP transporter を作成するサンプルです。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [Microsoft 365へのアクセス](https://blog.4d.com/ja/4d-and-microsoft-365-access/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Webエリア: Webカメラの使用**](https://github.com/4D-JP/HDI/releases/download/19r3/HDI_Webcam.zip) (v19r3)<span id="19-3-6"></span><br />
Webエリアの `埋め込みWebレンダリングエンジンを使用`プロパティを有効にすることで、コードを書くことなく Webカメラが
使用できることを紹介します。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [Webエリアが Webカメラに対応](https://blog.4d.com/ja/webcam-support-in-web-areas/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Write Pro: SVGへの書き出し**](https://github.com/4D-JP/HDI/releases/download/19r3/HDI_4DWP_ExportSVG.zip) (v19r3)<span id="19-3-5"></span><br />
[`WP EXPORT DOCUMENT`](https://livedoc.4d.com/4D-Write-Pro-19-R3/4D-Write-Pro/WP-EXPORT-DOCUMENT.301-5606518.ja.html) および [`WP EXPORT VARIABLE`](https://livedoc.4d.com/4D-Write-Pro-19-R3/4D-Write-Pro/WP-EXPORT-VARIABLE.301-5606522.ja.html) コマンドの機能が拡張され、4D Write Pro ドキュメントを SVG に書き出せるようになりました。<br />
参考：[SVG フォーマットへの書き出し](https://livedoc.4d.com/4Dv19R3/4D/19-R3/Exporting-to-SVG-format.200-5626425.ja.html)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro ドキュメントをSVG形式で書き出す](https://blog.4d.com/ja/export-4d-write-pro-documents-to-svg-format/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Write Pro: 継続セクションブレーク**](https://github.com/4D-JP/HDI/releases/download/19r3/HDI_4DWP_ContinuousSectionBreaks.zip) (v19r3)<span id="19-3-4"></span><br />
4D Write Pro に、改ページを強制しない [継続したセクションブレーク](https://doc.4d.com/4Dv19R3/4D/19-R3/Using-a-4D-Write-Pro-area.200-5606485.ja.html#5615462) が追加されました。これにより、ページ内で複数のセクションを管理できるようになり、同じページ上で異なる段組の設定ができるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro - 継続セクションブレーク](https://blog.4d.com/ja/4d-write-pro-continuous-section-breaks/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**Write Pro: フォーミュラのハイライト**](https://github.com/4D-JP/HDI/releases/download/19r3/HDI_4DWP_HightlightFormulas.zip) (v19r3)<span id="19-3-3"></span><br />
4D Write Pro に新しい表示オプションが追加され、ドキュメントに含まれるフォーミュラを、値表示・参照表示のいずれの場合でもハイライトすることができるようになりました。
ハイライトは `wk formula highlight` および `wk formula highlight color` を使って設定します。<br />
参照: [4D Write Pro標準アクションの使用](https://doc.4d.com/4Dv19R3/4D/19-R3/Using-4D-Write-Pro-standard-actions.200-5606489.ja.html)<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro: フォーミュラはいずこ](https://blog.4d.com/ja/4d-write-pro-where-are-my-formulas/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**ORDAクラス: 計算属性**](https://github.com/4D-JP/HDI/releases/download/19r3/HDI_ORDA_ComputedAttributes.zip) (v19r3)<span id="19-3-2"></span><br />
ORDAクラスに [計算属性](https://developer.4d.com/docs/ja/ORDA/ordaClasses/#%E8%A8%88%E7%AE%97%E5%B1%9E%E6%80%A7) が追加できるようになりました。それぞれ専用の関数を設定することで、計算属性値を取得・設定・クエリ・並べ替えすることが可能です。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [ORDAの計算属性によるマジックショー！](https://blog.4d.com/ja/a-magic-show-awaits-you-with-ordas-calculated-attributes/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**クラス: 計算プロパティ**](https://github.com/4D-JP/HDI/releases/download/19r3/HDI_CS_ComputedProperties.zip) (v19r3)<span id="19-3-1"></span><br />
`Function get` および `Function set` キーワードを使って、クラスに [計算プロパティ](https://developer.4d.com/docs/ja/Concepts/classes/#function-get-%E3%81%A8-function-set) が追加できるようになりました。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [クラスに計算プロパティが登場！](https://blog.4d.com/ja/need-a-magic-wand-here-are-computed-class-properties/)<br />

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ピクチャーフォーマットの変更**](https://github.com/4D-JP/HDI/releases/download/19r2/HDI_4DWP_FormatPictures.zip) (v19r2)<span id="19-2-1"></span><br />
4D Write Pro に新しく `wk image display mode` 属性が追加され、インラインおよびアンカーピクチャーのフォーマットが変更できるようになりました。また、新しい `wk background display mode` の追加によって、背景画像のフォーマットも簡単に変更できるようになりました。これらの属性の値として使用できる定数は [4D Write Pro ＞ ピクチャーを管理する ＞ 背景画像](https://doc.4d.com/4Dv19R2/4D/19-R2/Handling-pictures.200-5514111.ja.html#5524063) の章にて説明しています。<br />
　　<i class="fa fa-external-link" aria-hidden="true"></i> ブログ記事: [4D Write Pro - 新しいピクチャーフォーマット](https://blog.4d.com/ja/4d-write-pro-new-image-formats/)<br />

## 19 # {#v19}

* <span style="color:red;text-decoration:underline">(v19.3)</span> <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 文字列の検索と置換**](https://github.com/4D-JP/HDI/releases/download/19/HDI_4DWP_FindAndReplace.zip)<span id="19-0-10"></span><br />
v19では、新しい 4D Write Pro コマンド [WP Find all](https://doc.4d.com/4Dv19/4D/19/WP-Find-all.301-5391091.ja.html) が追加され、文字列の検索および置換が容易にできるようになりました。<br/>
※ 4D v19.3 で日本語環境での動作が修正されました。
* <span style="color:red;text-decoration:underline">(v19.2)</span> <i class="fa fa-download" aria-hidden="true"></i> [**Compare Strings**](https://github.com/4D-JP/HDI/releases/download/19/HDI_CompareStrings.zip)<span id="19-0-9"></span><br />
v19では、[Strings](https://doc.4d.com/4Dv19/4D/19.1/Strings.302-5654328.ja.html) 定数テーマに複数の新たな定数が追加されました。これらの定数は既存の [`Position`](https://doc.4d.com/4Dv19/4D/19.1/Position.301-5653307.ja.html) コマンドにおいて、強力なオプションとして使用することができます。また、重複の検出や並べ替えをおこなう目的で文字列を比較するための新しい [`Compare strings`](https://doc.4d.com/4Dv19/4D/19.1/Compare-strings.301-5653292.ja.html) コマンドも追加されています。<br/>
※ 4D v19.2 で日本語環境での動作が修正されました。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D変換タグ: 4DEACH**](https://github.com/4D-JP/HDI/releases/download/19/HDI_4DEACHTag.zip)<span id="19-0-8"></span><br />
[`4DEACH`](https://developer.4d.com/docs/ja/Tags/tags/#4deach-%E3%81%A8-4dendeach) が新たに変換タグとして追加されました。<br />
これを使って、エンティティセレクション / コレクション / オブジェクトプロパティをループすることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**データの暗号化**](https://github.com/4D-JP/HDI/releases/download/19/HDI_BLOB_Encryption.zip)<span id="19-0-7"></span><br />
[`Encrypt data BLOB`](https://doc.4d.com/4Dv19/4D/19/Encrypt-data-BLOB.301-5449220.ja.html)[`Decrypt data BLOB`](https://doc.4d.com/4Dv19/4D/19/Decrypt-data-BLOB.301-5449312.ja.html) コマンドを使って、パスフレーズとソルト付与によるBLOBの暗号化・復号化ができます。外部保存の機密文書(PDFファイル)を暗号化・復号化するサンプルアプリケーションを使って、この機能を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**プロジェクトをコマンドでコンパイル**](https://github.com/4D-JP/HDI/releases/download/19/HDI_CompileProject.zip)<span id="19-0-6"></span><br />
新しい [`Compile project`](https://livedoc.4d.com/--19/-/Compile-project.301-5457347.ja.html) コマンドを使って、プロジェクトをプログラムからコンパイルできるようになりました。このコマンドを使うと、カレントプロジェクト以外のプロジェクトもコンパイルすることが可能です。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: 時間型カラムとフッターの自動計算**](https://github.com/4D-JP/HDI/releases/download/19/HDI_LISTBOXES_Demo_V2.zip)<span id="19-0-5"></span><br />
コレクション/エンティティセレクション型のリストボックスでも、カラムに時間を表示し、フッターに自動計算を表示することができるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: docxファイルのインポート**](https://github.com/4D-JP/HDI/releases/download/19/HDI_4DWP_ImportDocx.zip)<span id="19-0-4"></span><br />
4D v19より、.docx ファイルを 4D Write Pro にインポートできるようになりました。<br />
参照: [`WP Import document`](https://doc.4d.com/4Dv19/4D/19/WP-Import-document.301-5390187.ja.html) コマンド、 [.docx フォーマットのファイルの読み込み方](https://doc.4d.com/4Dv19/4D/19/Importing-and-Exporting-in-docx-format.200-5390147.ja.html#5473301) 。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ブレークの取得**](https://github.com/4D-JP/HDI/releases/download/19/HDI_4DWP_GetUserBreaks.zip)<span id="19-0-3"></span><br />
新しい [`WP Get breaks`](https://doc.4d.com/4Dv19/4D/19/WP-Get-breaks.301-5441632.ja.html) コマンドを使って、ドキュメント内にあるブレークの種類と位置を取得できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**フォームオブジェクト: コレクションによる規定値の設定**](https://github.com/4D-JP/HDI/releases/download/19/HDI_UseCollectionsInForms.zip)<span id="19-0-2"></span><br />
v19では、タブコントロール・コンボボックス・ドロップダウンメニューの規定値をコレクションによって設定することができるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**IMAP transporter: メールボックスの操作**](https://github.com/4D-JP/HDI/releases/download/19/HDI_IMAPMailboxes.zip)<span id="19-0-1"></span><br />
[`IMAP_transporter`](http://developer.4d.com/docs/ja/API/IMAPTransporterClass/) クラスの関数 
[`.createBox()`](http://developer.4d.com/docs/ja/API/IMAPTransporterClass/#createbox)、
[`.deleteBox()`](http://developer.4d.com/docs/ja/API/IMAPTransporterClass/#deletebox)、
[`.renameBox()`](http://developer.4d.com/docs/ja/API/IMAPTransporterClass/#renamebox)、
[`.subscribe()`](http://developer.4d.com/docs/ja/API/IMAPTransporterClass/#subscribe)、
[`.unsubscribe()`](http://developer.4d.com/docs/ja/API/IMAPTransporterClass/#unsubscribe) を使ってメールボックスを操作する方法を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: ドキュメントの読み込み完了確認**](https://github.com/4D-JP/HDI/releases/download/18r6/HDI_4DVP_End_Loading.zip) (v18r6)<span id="18-6-8"></span><br />
オフスクリーンエリアで開いた 4D View Pro ドキュメントが読み込みが完了したかを確認するのに、
`on VP Range Changed` と `on Timer` イベントを組み合わせて利用します。<br />
参考：[`VP Run offscreen area`](https://doc.4d.com/4Dv19/4D/19/VP-Run-offscreen-area.301-5443003.ja.html) の [例題2](https://doc.4d.com/4Dv19/4D/19/VP-Run-offscreen-area.301-5443003.ja.html#5381874)
* <i class="fa fa-download" aria-hidden="true"></i> [**IMAP Transporter: メール検索**](https://github.com/4D-JP/HDI/releases/download/18r6/HDI_IMAPMailSearching.zip) (v18r6)<span id="18-6-7"></span><br />
[`IMAP_transporter.searchMails( )`](https://doc.4d.com/4Dv18R6/4D/18-R6/IMAP-transportersearchMails.305-5197554.ja.html) を使って、メールサーバー上で選択されているメールボックス内のメールを検索することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**IMAP Transporter: サーバーへのメールの保存**](https://github.com/4D-JP/HDI/releases/download/18r6/HDI_IMAPAppend.zip) (v18r6)<span id="18-6-6"></span><br />
新しく追加された [`IMAP_transporter.append( )`](https://doc.4d.com/4Dv18R6/4D/18-R6/IMAP-transporterappend.305-5219267.ja.html) を使って、ローカルで作成したメールをメールサーバーに保存することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**メール: OAuth2.0 を使った接続**](https://github.com/4D-JP/HDI/releases/download/18r6/HDI_OAuth2_mail.zip) (v18r6)<span id="18-6-5"></span><br />
OAuth2.0 を使って IMAP および SMTP transporter を作成し、Gmailサーバーに接続するサンプルです。Gmailサーバーにおける OAuth2.0 の仕組みの詳細は、Google の [OAuth2.0を使用してGoogleAPIにアクセスする](https://developers.google.com/identity/protocols/oauth2) を参照ください。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: 検索と置換**](https://github.com/4D-JP/HDI/releases/download/18r6/HDI_4DVP_Find.zip) (v18r6)<span id="18-6-4"></span><br />
4D v18 R6 で追加された新しい [`VP Find`](https://doc.4d.com/4Dv18R6/4D/18-R6/VP-Find.301-5184846.ja.html) コマンドを使って、4D View Pro ドキュメント内の値を検索・置換できるようになりました。このコマンドにはさまざまな検索条件を追加することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**スケーラブル Web セッション**](https://github.com/4D-JP/HDI/releases/download/18r6/HDI_ScalableSession.zip) (v18r6)<span id="18-6-3"></span><br />
4D v18 R6 より、スケーラブル Web セッションが使用できるようになりました。ストラクチャー設定の「[スケーラブルセッション(マルチプロセスセッション)](https://doc.4d.com/4Dv18R6/4D/18-R6/WebOptions-I-page.300-5217843.ja.html#5229239)」を有効にすると、新しい [`Session`](https://doc.4d.com/4Dv18R6/4D/18-R6/Session.301-5225575.ja.html) コマンドは、カレントのスケーラブル Web セッションに対応した [`Session オブジェクト`](https://developer.4d.com/docs/ja/API/sessionClass/) を返します。<br />
このオブジェクトの [`storage`プロパティ](https://developer.4d.com/docs/ja/API/sessionClass/#storage) を使って、同セッション内で共有したいデータを保存することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: On Before Keystroke イベント**](https://github.com/4D-JP/HDI/releases/download/18r6/HDI_LISTBOXES_BeforeKeystroke.zip) (v18r6)<span id="18-6-2"></span><br />
リストボックスにおいて、編集中のセルがなくても文字入力とともに `On Before Keystroke` イベントが発生するようになりました。このイベントを利用してクエリやハイライトなどの操作をおこなうことができます。<br />
また、[`Is editing text`](https://doc.4d.com/4Dv18R6/4D/18-R6/Get-edited-text.301-5198452.ja.html) コマンドが追加され、これにより `On Before Keystroke` イベントが生成されたときに進行中の入力があるかどうかを検知することができるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**IMAP Transporter: メールのコピー・移動・削除**](https://github.com/4D-JP/HDI/releases/download/18r6/HDI_IMAPMailCopy.zip) (v18r6)<span id="18-6-1"></span><br />
IMAP Transporter の関数 [`IMAP_transporter.copy( )`](https://doc.4d.com/4Dv18R6/4D/18-R6/IMAP-transportercopy.305-5197555.ja.html)、
[`IMAP_transporter.move( )`](https://doc.4d.com/4Dv18R6/4D/18-R6/IMAP-transportermove.305-5197556.ja.html)、
[`IMAP_transporter.expunge( )`](https://doc.4d.com/4Dv18R6/4D/18-R6/IMAP-transporterexpunge.305-5221757.ja.html) を使って、サーバー上のメールをコピー・移動・削除する方法を紹介します。<br />
Gmailに関する注意点: [Gmail/All MailメールボックスとIMAP (ブログ記事)](https://4d-jp.github.io/2021/02/21/gmail-all-mail//)
* <i class="fa fa-download" aria-hidden="true"></i> [**フォームエディターマクロ**](https://github.com/4D-JP/HDI/releases/download/18r5/HDI_FormMacro.zip) (v18r5)<span id="18-5-6"></span><br />
4D v18 R5 ではマクロが導入されました。フォームエディター上で繰り返しおこなうタスクを自動化するのに、マクロは非常に便利です。<br />
参照：[マクロの使用例 6つ (ブログ記事)](https://4d-jp.github.io/2021/02/15/6-practical-examples-on-how-to-use-macros/)、[フォームエディターマクロ](http://developer.4d.com/docs/ja/FormEditor/macros/)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: 共有可能/追加可能なエンティティセレクションの操作**](https://github.com/4D-JP/HDI/releases/download/18r5/HDI_Shareable_ES_Enhancements.zip) (v18r5)<span id="18-5-5"></span><br />
エンティティセレクションをもとに別のエンティティセレクションを作成すると、その特性が継承されます。例外が [`entitySelection.copy()`](https://doc.4d.com/4Dv19/4D/19/entitySelectioncopy.305-5391689.ja.html) を使った場合で、共有可能 (追加不可) エンティティセレクションを追加可能 (共有不可) にしたり、その逆が可能です。<br />
また、新しく追加された [`entitySelection.isAlterable()`](https://doc.4d.com/4Dv19/4D/19/entitySelectionisAlterable.305-5391690.ja.html) を使って、エンティティセレクションの特性が共有可能か追加可能かを確認することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 小数点揃え**](https://github.com/4D-JP/HDI/releases/download/18r5/HDI_4DWP_SetupDecimalTabs.zip) (v18r5)<span id="18-5-4"></span><br />
[`WP SET ATTRIBUTES`](https://doc.4d.com/4Dv18R5/4D/18-R5/WP-SET-ATTRIBUTES.301-5125607.ja.html) コマンドで
[`wk tab decimal separator`](https://doc.4d.com/4Dv18R5/4D/18-R5/4D-Write-Pro-Attributes.300-5125597.ja.html#5171902) セレクターを使用して、4D Write Pro ドキュメントの小数点揃えの設定を変更できるようになりました。点基準、カンマ基準、最初の点またはカンマ基準、システム設定基準で小数点を揃えることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: 共有可能なエンティティセレクション**](https://github.com/4D-JP/HDI/releases/download/18r5/HDI_Shareable_EntitySelection.zip) (v18r5)<span id="18-5-3"></span><br />
4D v18 R5 では、特定のエンティティセレクションを複数プロセスやワーカー間で共有できるようになりました。ただし、共有不可のエンティティセレクションも存在します。共有不可のエンティティセレクションは、新しく追加された [`entitySelection.copy()`](https://doc.4d.com/4Dv19/4D/19/entitySelectioncopy.305-5391689.ja.html) コマンドや、拡張された [`OB Copy`](https://doc.4d.com/4Dv19/4D/19/OB-Copy.301-5392284.ja.html) コマンドを使って、共有可能なエンティティセレクションとしてコピーすることが可能です。<br />
参照：[共有可能なエンティティセレクション/共有不可のエンティティセレクション](https://doc.4d.com/4Dv18R5/4D/18-R5/Entity-selections.300-5126508.ja.html#5169945)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: カスタムファンクション**](https://github.com/4D-JP/HDI/releases/download/18r5/HDI_4DVP_allow_formulas.zip) (v18r5)<span id="18-5-2"></span><br />
[`VP SET CUSTOM FUNCTIONS`](https://doc.4d.com/4Dv18R5/4D/18-R5/VP-SET-CUSTOM-FUNCTIONS.301-5062623.ja.html) を使って、4D View Pro で使用できるカスタムファンクションを作成することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: データモデルクラス関数のスコープ**](https://github.com/4D-JP/HDI/releases/download/18r5/HDI_ORDA_FunctionsScope.zip) (v18r5)<span id="18-5-1"></span><br />
4D v18 R5 では、[データモデルクラス](https://developer.4d.com/docs/ja/ORDA/ordaClasses/)関数のスコープを定義するためのキーワード ([`local`](http://developer.4d.com/docs/ja/ORDA/ordaClasses/#%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E9%96%A2%E6%95%B0) および [`exposed`](http://developer.4d.com/docs/ja/ORDA/ordaClasses/#%E5%85%AC%E9%96%8Bvs%E9%9D%9E%E5%85%AC%E9%96%8B%E9%96%A2%E6%95%B0)) が使えるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: プロパティの取得・設定**](https://github.com/4D-JP/HDI/releases/download/18r4/HDI_LISTBOXES_Properties_v2.zip) (v18r4)<span id="18-4-9"></span><br />
[`LISTBOX SET PROPERTY`](https://doc.4d.com/4Dv18R4/4D/18-R4/LISTBOX-SET-PROPERTY.301-4982971.ja.html)、および
[`LISTBOX Get property`](https://doc.4d.com/4Dv18R4/4D/18-R4/LISTBOX-Get-property.301-4983017.ja.html) コマンドを使って、リストボックスのプロパティを設定する方法を紹介します。4D v18 R4 では "行の移動可" プロパティが新たに追加され、配列型のリストボックスに対して適用することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: 計算の停止・再開・強制**](https://github.com/4D-JP/HDI/releases/download/18r4/HDI_4DVP_Suspend_Resume.zip) (v18r4)<span id="18-4-8"></span><br />
新しく追加された [`VP SUSPEND COMPUTING`](https://doc.4d.com/4Dv18R4/4D/18-R4/VP-SUSPEND-COMPUTING.301-5056265.ja.html)、
[`VP RESUME COMPUTING`](https://doc.4d.com/4Dv18R4/4D/18-R4/VP-RESUME-COMPUTING.301-5056276.ja.html)、および
[`VP RECOMPUTE FORMULAS`](https://doc.4d.com/4Dv18R4/4D/18-R4/VP-RECOMPUTE-FORMULAS.301-5056287.ja.html) コマンドを使って、4D View Pro エリアの計算を停止・再開・強制することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**IMAP を使ったメール受信**](https://github.com/4D-JP/HDI/releases/download/18r4/HDI_IMAPMailDownloading.zip) (v18r4)<span id="18-4-7"></span><br />
IMAP transporter オブジェクトを使って、IMAP プロトコルによるメールの受信ができます。<br />
参考：[Eメールオブジェクト](https://doc.4d.com/4Dv18R4/4D/18-R4/Email-object.300-4981948.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**CryptoKey クラスを使った署名と検証**](https://github.com/4D-JP/HDI/releases/download/18r4/HDI_Cryptokey_class.zip) (v18r4)<span id="18-4-6"></span><br />
4D クラスストアに新しく追加された [CryptoKey クラス](http://developer.4d.com/docs/ja/API/cryptoClass/) を利用して、電子メッセージに署名を付与したり、これを検証したりすることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: フォーミュラが返すキャリッジリターンの扱い**](https://github.com/4D-JP/HDI/releases/download/18r4/HDI_4DWP_ParagraphBreaks.zip) (v18r4)<span id="18-4-5"></span><br />
新しいドキュメント設定プロパティ [`wk break paragraphs in formulas`](https://doc.4d.com/4Dv18R4/4D/18-R4/4D-Write-Pro-Attributes.300-5038135.ja.html#5039441) が追加されました。[`WP SET ATTRIBUTES`](https://doc.4d.com/4Dv18R4/4D/18-R4/WP-SET-ATTRIBUTES.301-5038145.ja.html) コマンドを使ってこれを指定することで、4D Write Pro ドキュメント内のフォーミュラが返すキャリッジリターン文字を改行・改段落のどちらとして認識するか選択することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: PDFへのエクスポート**](https://github.com/4D-JP/HDI/releases/download/18r4/HDI_4DWP_ExportPDF.zip) (v18r4)<span id="18-4-4"></span><br />
[`WP EXPORT DOCUMENT`](https://doc.4d.com/4Dv18R4/4D/18-R4/WP-EXPORT-DOCUMENT.301-5038146.ja.html) コマンドを使って、4D Write Pro ドキュメントを PDF のファイルまたは BLOB 変数にエクスポートできるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: オフスクリーンエリア**](https://github.com/4D-JP/HDI/releases/download/18r4/HDI_4DVP_Offscreen.zip) (v18r4)<span id="18-4-3"></span><br />
新しく追加された [`VP Run offscreen area`](https://doc.4d.com/4Dv18R4/4D/18-R4/VP-Run-offscreen-area.301-5042473.ja.html) コマンドを使って、オフスクリーンの (メモリにしか存在せず、表示されない) 4D View Pro エリアが作成できるようになりました。このオフスクリーンエリアはドキュメントのエクスポートなどに利用できます。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: データモデルクラスとRESTサーバー**](https://github.com/4D-JP/HDI/releases/download/18r4/HDI_ORDA_Classes_REST_Server.zip) (v18r4)<span id="18-4-2"></span><br />
ORDA のデータモデルクラスに定義されたクラス関数は RESTリクエストで呼び出すことができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: データモデルクラス**](https://github.com/4D-JP/HDI/releases/download/18r4/HDI_ORDA_Classes.zip) (v18r4)<span id="18-4-1"></span><br />
4D v18 R4 では、ORDA データモデルに基づく高レベルのクラスが提供され、それぞれにクラス関数を定義できるようになりました。<br />
参照: [データモデルクラス](https://developer.4d.com/docs/ja/ORDA/ordaClasses/)
* <i class="fa fa-download" aria-hidden="true"></i> [**オフスクリーン Web エリア**](https://github.com/4D-JP/HDI/releases/download/18r3/HDI_Offscreen_WebArea.zip) (v18r3)<span id="18-3-8"></span><br />
新しく追加された [`WA Run offscreen area`](https://doc.4d.com/4Dv18R3/4D/18-R3/WA-Run-offscreen-area.301-4968859.ja.html) コマンドを使って、オフスクリーンの (メモリにしか存在せず、表示されない) Web エリアが作成できるようになりました。この Web エリアは Web ページを自動的に読み込んで解析するといったことに使用できます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro 機能: 文書保護**](https://github.com/4D-JP/HDI/releases/download/18r3/HDI_4DWP_Protection.zip) (v18r3)<span id="18-3-7"></span><br />
4D Write Pro にドキュメントの保護機能が追加されました。[`wk protected`](https://doc.4d.com/4Dv18R3/4D/18-R3/4D-Write-Pro-Constants.302-4929640.ja.html)属性を使ってドキュメント要素に対して保護の有無を設定し、ドキュメント属性である[`wk protection enabled`](https://doc.4d.com/4Dv18R3/4D/18-R3/4D-Write-Pro-Constants.302-4929640.ja.html)を使うことで、保護を有効化・無効化することができます。<br />
参考：[プロテクション](https://doc.4d.com/4Dv18R3/4D/18-R3/4D-Write-Pro-Attributes.300-4929638.ja.html#4936134)
* <i class="fa fa-download" aria-hidden="true"></i> [**アクティビティのモニタリング**](https://github.com/4D-JP/HDI/releases/download/18r3/HDI_Monitor_Activity.zip) (v18r3)<span id="18-3-6"></span><br />
新しく追加された [`START MONITORING ACTIVITY`](https://doc.4d.com/4Dv18R3/4D/18-R3/START-MONITORING-ACTIVITY.301-4936186.ja.html) コマンドを使って、指定以上の時間を要した 4Dランゲージ実行、ネットワークリクエスト、4D データなどのオペレーションを記録することができます。また、このコマンドと連携して使われる [`Get Monitored Activity`](https://doc.4d.com/4Dv18R3/4D/18-R3/Get-Monitored-Activity.301-4936249.ja.html)と [`STOP MONITORING ACTIVITY`](https://doc.4d.com/4Dv18R3/4D/18-R3/STOP-MONITORING-ACTIVITY.301-4936217.ja.html) コマンドも追加されました。<br />
なお、ネットワークアクティビティでは 4DRequestsLog ファイルと同じ情報が、4D ランゲージ実行では 4DDebugLog ファイルと同じ情報が取得されます (参考: [ログファイルの詳細](https://doc.4d.com/4Dv18R3/4D/18-R3/Description-of-log-files.300-4919535.ja.html))。
* <i class="fa fa-download" aria-hidden="true"></i> [**Webサーバーオブジェクト**](https://github.com/4D-JP/HDI/releases/download/18r3/HDI_MultipleWebServers.zip) (v18r3)<span id="18-3-5"></span><br />
新しく追加された [`WEB Server`](https://doc.4d.com/4Dv18R3/4D/18-R3/WEB-Server.301-4851507.ja.html) コマンドを使って、WebServer オブジェクトを取得し、Webサーバーを操作することができます。<br />
また、4D アプリケーション内で利用可能なすべての Web server オブジェクトを返す [`WEB Server list`](https://doc.4d.com/4Dv18R3/4D/18-R3/WEB-Server-list.301-4851515.ja.html) コマンドも追加されました。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: シートオプション**](https://github.com/4D-JP/HDI/releases/download/18r3/HDI_4DVP_SheetOptions.zip) (v18r3)<span id="18-3-4"></span><br />
新しく追加された [`VP SET SHEET OPTIONS`](https://doc.4d.com/4Dv18R3/4D/18-R3/VP-SET-SHEET-OPTIONS.301-4850835.ja.html) コマンドを使って、4D View Pro のシートオプション (セルデータの領域外表示、枠線やヘッダーの表示、シートの保護、枠線・タブ・選択の色指定など) を設定することができます。<br />
参考：[4D View Pro シートオプション](https://doc.4d.com/4Dv18R3/4D/18-R3/4D-View-Pro-Sheet-Options.300-4850975.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: 新コマンド LISTBOX SELECT ROWS**](https://github.com/4D-JP/HDI/releases/download/18r3/HDI_ListBoxSelectRows.zip) (v18r3)<span id="18-3-3"></span><br />
新しく追加された [`LISTBOX SELECT ROWS`](https://doc.4d.com/4Dv18R3/4D/18-R3/LISTBOX-SELECT-ROWS.301-4959830.ja.html) コマンドは、エンティティセレクション型リストボックスおよびコレクション型リストボックスにおいて、選択行を指定するエンティティセレクションおよびコレクションを引数として受け取ります。また、現在の選択行に対するアクション (置換・追加・削除) も指定することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**クラス: 継承**](https://github.com/4D-JP/HDI/releases/download/18r3/HDI_ClassAndInheritance.zip) (v18r3)<span id="18-3-2"></span><br />
クラス継承の例を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**クラス: コンストラクターとメンバーメソッド**](https://github.com/4D-JP/HDI/releases/download/18r3/HDI_Class.zip) (v18r3)<span id="18-3-1"></span><br />
クラスを定義、利用することができるようになりました。クラスの基本となるコンストラクターとメンバーメソッドの例を紹介します。<br />
参考：[クラス](https://developer.4d.com/docs/ja/Concepts/classes/)
* <i class="fa fa-download" aria-hidden="true"></i> [**POP3 を使ったメール受信**](https://github.com/4D-JP/HDI/releases/download/18r2/HDI_POP3MailDownloading.zip) (v18r2)<span id="18-2-6"></span><br />
POP3 transporter オブジェクトを使って、POP3 プロトコルによるメールの受信ができます。<br />
参考：[Eメールオブジェクト](https://doc.4d.com/4Dv18R2/4D/18-R2/Email-object.300-4825407.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ピクチャーの削除**](https://github.com/4D-JP/HDI/releases/download/18r2/HDI_4DWP_DeletePictures.zip) (v18r2)<span id="18-2-5"></span><br />
新しく追加された [`WP DELETE PICTURE`](https://doc.4d.com/4Dv18R2/4D/18-R2/WP-DELETE-PICTURE.301-4735795.ja.html) コマンドを使って、4D Write Pro ドキュメントに含まれる画像を削除できます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: カラムや行の固定化**](https://github.com/4D-JP/HDI/releases/download/18r2/HDI_4DVP_FreezePanes.zip) (v18r2)<span id="18-2-4"></span><br />
新しく追加された [`VP SET FROZEN PANES`](https://doc.4d.com/4Dv18R2/4D/18-R2/VP-SET-FROZEN-PANES.301-4840199.ja.html) コマンド使って、4D View Pro ドキュメントのカラムや行を固定化することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: フォーミュラの操作**](https://github.com/4D-JP/HDI/releases/download/18r2/HDI_4DWP_GetSetFormulas.zip) (v18r2)<span id="18-2-3"></span><br />
新しいコマンドの追加により、4D Write Pro ドキュメントにおけるフォーミュラの操作が簡単におこなえます:<br />
[`WP Get formulas`](https://doc.4d.com/4Dv18R2/4D/18-R2/WP-Get-formulas.301-4829012.ja.html)
[`WP INSERT FORMULA`](https://doc.4d.com/4Dv18R2/4D/18-R2/WP-INSERT-FORMULA.301-4831015.ja.html)
[`WP COMPUTE FORMULAS`](https://doc.4d.com/4Dv18R2/4D/18-R2/WP-COMPUTE-FORMULAS.301-4831142.ja.html)
[`WP FREEZE FORMULAS`](https://doc.4d.com/4Dv18R2/4D/18-R2/WP-FREEZE-FORMULAS.301-4831166.ja.html)<br />
また、$wp_pageCount や $wp_author のような予約されたローカル変数は、新しく使いやすい This.property 形式でも提供されるようになりました。
![予約変数の対応表](/images/HDI_4DWP_GetSetFormulas-ReservedVariables.png){: .align-center}
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: 行やカラムの操作**](https://github.com/4D-JP/HDI/releases/download/18r2/HDI_4DVP_ColumnRowManagement.zip) (v18r2)<span id="18-2-2"></span><br />
新しいコマンドの追加により、4D View Pro の行やカラムの操作が簡単におこなえます:<br />
[`VP DELETE ROWS`](https://doc.4d.com/4Dv18R2/4D/18-R2/VP-DELETE-ROWS.301-4761518.ja.html)
[`VP DELETE COLUMNS`](https://doc.4d.com/4Dv18R2/4D/18-R2/VP-DELETE-COLUMNS.301-4761512.ja.html)
[`VP INSERT ROWS`](https://doc.4d.com/4Dv18R2/4D/18-R2/VP-INSERT-ROWS.301-4761530.ja.html)
[`VP INSERT COLUMNS`](https://doc.4d.com/4Dv18R2/4D/18-R2/VP-INSERT-COLUMNS.301-4761524.ja.html)
[`VP SET ROW COUNT`](https://doc.4d.com/4Dv18R2/4D/18-R2/VP-SET-ROW-COUNT.301-4833138.ja.html)
[`VP SET COLUMN COUNT`](https://doc.4d.com/4Dv18R2/4D/18-R2/VP-SET-COLUMN-COUNT.301-4833116.ja.html)
[`VP SET ROW ATTRIBUTES`](https://doc.4d.com/4Dv18R2/4D/18-R2/VP-SET-ROW-ATTRIBUTES.301-4761500.ja.html)
[`VP SET COLUMN ATTRIBUTES`](https://doc.4d.com/4Dv18R2/4D/18-R2/VP-SET-COLUMN-ATTRIBUTES.301-4761486.ja.html)
[`VP ROW AUTOFIT`](https://doc.4d.com/4Dv18R2/4D/18-R2/VP-ROW-AUTOFIT.301-4833105.ja.html)
[`VP COLUMN AUTOFIT`](https://doc.4d.com/4Dv18R2/4D/18-R2/VP-COLUMN-AUTOFIT.301-4833094.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックスイベントの活用例**](https://github.com/4D-JP/HDI/releases/download/18r2/HDI_Listbox_Events.zip) (v18r2)<span id="18-2-1"></span><br />
4D v18 で新しく追加された [`FORM Event`](https://doc.4d.com/4Dv18/4D/18/FORM-Event.301-4522191.ja.html) コマンド使い、リストボックスのイベントが提供する詳細情報の活用例を紹介します。

## 18 # {#v18}

* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: リモートデータストアー (サンプルアプリケーション)**](https://github.com/4D-JP/HDI/releases/download/18/TIP_Remote_Datastore.zip)<span id="18-0-11"></span><br />
リモートデータストアーのサンプルアプリケーションです。ローカルデータベースでは直近のデータだけを保存し、過去データはすべて外部データベースにて管理します。サンプルには、ローカルデータベース (TIP_Remote_Datastore_Client) とリモートデータベース (TIP_Remote_Datastore_Server) が含まれています。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ヘッダーとフッターの高さ制御**](https://github.com/4D-JP/HDI/releases/download/18/HDI_4DWP_AutoFitHeaders.zip)<span id="18-0-10"></span><br />
4D Write Pro ドキュメントのヘッダーとフッターの高さ自動調整機能を無効化できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro ドキュメントのメール送信**](https://github.com/4D-JP/HDI/releases/download/18/HDI_sendWPDocumentByMail.zip)<span id="18-0-9"></span><br />
4D Write Pro ドキュメントから出力した MIME を[`MAIL Convert from MIME`](https://doc.4d.com/4Dv18/4D/18/MAIL-Convert-from-MIME.301-4609764.ja.html)コマンドでメールオブジェクトに変換し、メールの本文として送信することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**ファイルやフォルダーの圧縮**](https://github.com/4D-JP/HDI/releases/download/18/HDI_CompressFile.zip)<span id="18-0-8"></span><br />
新コマンド[`ZIP Create archive`](https://doc.4d.com/4Dv18/4D/18/ZIP-Create-archive.301-4672146.ja.html)および[`ZIP Read archive`](https://doc.4d.com/4Dv18/4D/18/ZIP-Read-archive.301-4672153.ja.html)を使って、ファイルやフォルダーを圧縮したり、圧縮されたアーカイブを読み取ったりすることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: イベントの扱い方**](https://github.com/4D-JP/HDI/releases/download/18/HDI_4DVP_Events.zip)<span id="18-0-7"></span><br />
4D v18 で新しく追加された [`FORM Event`](https://doc.4d.com/4Dv18/4D/18/FORM-Event.301-4522191.ja.html) コマンド使って、[4D View Pro エリア内で発生するイベント](https://doc.4d.com/4Dv18/4D/18/Form-event-code.301-4505020.ja.html#4614553) の情報を取得する方法を紹介します。<br />
<span style="color:red;text-decoration:underline">※ 4D v17まで使用されていた`Form event` コマンドは [`Form event code`](https://doc.4d.com/4Dv18/4D/18/Form-event-code.301-4505020.ja.html) に名称変更されています。`Form event code` と `FORM Event.code` が返す値は同じです。</span>
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 表組みの行やカラムの挿入と削除、選択範囲の取得**](https://github.com/4D-JP/HDI/releases/download/18/HDI_4DWP_ManageTable.zip)<span id="18-0-6"></span><br />
4D Write Pro の表組みの行やカラムを挿入および削除するコマンドが新しく追加されました:<br />
[`WP Table insert rows`](https://doc.4d.com/4Dv18/4D/18/WP-Table-insert-rows.301-4675336.ja.html)
[`WP Table insert columns`](https://doc.4d.com/4Dv18/4D/18/WP-Table-insert-columns.301-4675806.ja.html)
[`WP TABLE DELETE ROWS`](https://doc.4d.com/4Dv18/4D/18/WP-TABLE-DELETE-ROWS.301-4675983.ja.html)
[`WP TABLE DELETE COLUMNS`](https://doc.4d.com/4Dv18/4D/18/WP-TABLE-DELETE-COLUMNS.301-4675989.ja.html)<br />
これらの動作をおこなうための標準アクションも追加されており、コンテキストメニューからも利用できます。<br />
また、次のコマンドが拡張され、表内の選択範囲の情報を取得できるようになりました:<br />
[`WP Table get rows`](https://doc.4d.com/4Dv18/4D/18/WP-Table-get-rows.301-4523035.ja.html)
[`WP Table get columns`](https://doc.4d.com/4Dv18/4D/18/WP-Table-get-columns.301-4523034.ja.html)
[`WP Table get cells`](https://doc.4d.com/4Dv18/4D/18/WP-Table-get-cells.301-4523033.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: SVG ピクチャーへの変換**](https://github.com/4D-JP/HDI/releases/download/18/HDI_4DVP_Export_SVG.zip)<span id="18-0-5"></span><br />
新しく追加された [`VP Convert to picture`](https://doc.4d.com/4Dv18/4D/18/VP-Convert-to-picture.301-4687105.ja.html)コマンドは、4D View Pro ドキュメントを SVG ピクチャーに変換します。このピクチャーをフォームに読み込んで印刷したり、他の (4D Write Pro などの) ドキュメントに埋め込んだりすることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**プロジェクトデータベース: スタイルシート**](https://github.com/4D-JP/HDI/releases/download/18/HDI_StyleSheet.zip)<span id="18-0-4"></span><br />
4D v18 で正式リリースされたプロジェクトデータベースにおいて、スタイルシートの使い方も新しく、より便利になりました。この HDI では、フォームオブジェクトへのスタイルシート適用例を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: スタイルシート**](https://github.com/4D-JP/HDI/releases/download/18/HDI_4DWP_Stylesheets.zip)<span id="18-0-3"></span><br />
4D Write Pro でスタイルシートが使えるようになりました。[`WP New style sheet`](https://doc.4d.com/4Dv18/4D/18/WP-New-style-sheet.301-4525302.ja.html)コマンドで新規のスタイルシートを作成し、[`WP Get style sheet`](https://doc.4d.com/4Dv18/4D/18/WP-Get-style-sheet.301-4528127.ja.html)コマンドで既存のスタイルシートを取得できます。<br />
そのほかにも次の新コマンドが追加されています: <br />
[`WP IMPORT STYLE SHEETS`](https://doc.4d.com/4Dv18/4D/18/WP-IMPORT-STYLE-SHEETS.301-4574806.ja.html) 
[`WP Get style sheets`](https://doc.4d.com/4Dv18/4D/18/WP-Get-style-sheets.301-4574752.ja.html) 
[`WP DELETE STYLE SHEET`](https://doc.4d.com/4Dv18/4D/18/WP-DELETE-STYLE-SHEET.301-4525464.ja.html) 
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: 印刷・PDF出力**](https://github.com/4D-JP/HDI/releases/download/18/HDI_4DVP_Export_PDF.zip)<span id="18-0-2"></span><br />
新しく追加された [`VP SET PRINT INFO`](https://doc.4d.com/4Dv18/4D/18/VP-SET-PRINT-INFO.301-4638649.ja.html)コマンドを使って、4D View Pro ドキュメントの印刷属性を設定し、[`VP PRINT`](https://doc.4d.com/4Dv18/4D/18/VP-PRINT.301-4680544.ja.html)コマンドおよび [`VP EXPORT DOCUMENT`](https://doc.4d.com/4Dv18/4D/18/VP-EXPORT-DOCUMENT.301-4522260.ja.html) コマンドを使った印刷やPDF出力機能の紹介です。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: リモートデータストア**](https://github.com/4D-JP/HDI/releases/download/18/HDI_Remote_Datastore.zip)<span id="18-0-1"></span><br />
新しく追加された [`Open datastore`](https://doc.4d.com/4Dv18/4D/18/Open-datastore.301-4675616.ja.html) コマンドを使って、RESTリソースとして公開されている外部の 4D データベースをリモートデータストアの形で取得し、操作することができます。<br />
これにともない、[`ds`](https://doc.4d.com/4Dv18/4D/18/ds.301-4505926.ja.html)コマンドおよび [`dataStore.getInfo( )`](https://doc.4d.com/4Dv18/4D/18/dataStoregetInfo.305-4505928.ja.html) メンバーメソッドが拡張されています。
* <i class="fa fa-download" aria-hidden="true"></i> [**サーバー管理用 Webインターフェース (コンポーネント)**](https://github.com/4D-JP/HDI/releases/download/17r6/ServerAdministrator_JA.zip) (v17r6)<span id="17-6-8"></span><br />
Webインターフェースを利用して 4D Server を管理するためのサンプルコンポーネントです。
* <i class="fa fa-download" aria-hidden="true"></i> [**デバッグ・ログ解析ツール**](https://github.com/4D-JP/HDI/releases/download/17r6/4DDebugLogAnalyserv17R6.zip) (v17r6)<span id="17-6-7"></span><br />
デバッグ・ログを解析するためのサンプルツールです ([関連ブログ記事](https://4d-jp.github.io/2019/09/12/a-new-tool-at-your-fingertips-to-analyze-debug-logs/))。
* <i class="fa fa-download" aria-hidden="true"></i> [**ファイル・フォルダーオブジェクトを利用したエクスプローラー**](https://github.com/4D-JP/HDI/releases/download/17r6/HDI_FileManager.zip) (v17r6)<span id="17-6-6"></span><br />
ファイルオブジェクトとフォルダーオブジェクトをドット記法と組み合わせて、独自のリストボックス型ファイルエクスプローラーを作成する例を紹介します。<br />
[`folder.files( )`](https://doc.4d.com/4Dv17R6/4D/17-R6/folderfiles.305-4311981.ja.html)
[`folder.folders( )`](https://doc.4d.com/4Dv17R6/4D/17-R6/folderfolders.305-4311980.ja.html)
[`folder.parent`](https://doc.4d.com/4Dv17R6/4D/17-R6/folderparent.303-4311977.ja.html)<br />
参考：[ファイルとフォルダー](https://doc.4d.com/4Dv17R6/4D/17-R6/File-and-Folder.201-4310307.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: フォーミュラを使った並べ替え**](https://github.com/4D-JP/HDI/releases/download/17r6/HDI_Order_ByFormula.zip) (v17r6)<span id="17-6-5"></span><br />
ORDAに[`entitySelection.orderByFormula( )`](https://doc.4d.com/4Dv18/4D/18.4/entitySelectionorderByFormula.305-5234035.ja.html)メンバーメソッドが追加され、エンティティセレクションの並べ替えにフォーミュラを使えるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**カラーネームを使った色指定**](https://github.com/4D-JP/HDI/releases/download/17r6/HDI_CSS_colors.zip) (v17r6)<span id="17-6-4"></span><br />
次のコマンドの色指定にカラーネームが使えるようになりました：<br />
[`OBJECT SET RGB COLORS`](https://doc.4d.com/4Dv17R6/4D/17-R6/OBJECT-SET-RGB-COLORS.301-4311385.ja.html)、
[`LISTBOX SET ROW COLOR`](https://doc.4d.com/4Dv17R6/4D/17-R6/LISTBOX-SET-ROW-COLOR.301-4311148.ja.html)、
[`LISTBOX SET GRID COLOR`](https://doc.4d.com/4Dv17R6/4D/17-R6/LISTBOX-SET-GRID-COLOR.301-4311102.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: セルの見た目の制御**](https://github.com/4D-JP/HDI/releases/download/17r6/HDI_4DVP_Style.zip) (v17r6)<span id="17-6-3"></span><br />
セルのスタイルを取得・設定・削除するためのコマンドが4D View Pro に追加されました。<br />
[`VP Get default style`](https://doc.4d.com/4Dv17R6/4D/17-R6/VP-Get-default-style.301-4362843.ja.html)、
[`VP SET DEFAULT STYLE`](https://doc.4d.com/4Dv17R6/4D/17-R6/VP-SET-DEFAULT-STYLE.301-4362430.ja.html)、
[`VP ADD STYLESHEET`](https://doc.4d.com/4Dv17R6/4D/17-R6/VP-ADD-STYLESHEET.301-4351934.ja.html)、
[`VP Get cell style`](https://doc.4d.com/4Dv17R6/4D/17-R6/VP-Get-cell-style.301-4362887.ja.html)、
[`VP SET CELL STYLE`](https://doc.4d.com/4Dv17R6/4D/17-R6/VP-SET-CELL-STYLE.301-4362416.ja.html)、
[`VP SET BORDER`](https://doc.4d.com/4Dv17R6/4D/17-R6/VP-SET-BORDER.301-4373260.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: フォーミュラを使ったクエリ**](https://github.com/4D-JP/HDI/releases/download/17r6/HDI_Query_ByFormula.zip) (v17r6)<span id="17-6-2"></span><br />
ORDAの[`query()`](https://doc.4d.com/4Dv18/4D/18.4/dataClassquery.305-5233999.ja.html)メンバーメソッドが拡張され、フォーミュラを扱えるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: 値やフォーミュラの一括取得・設定**](https://github.com/4D-JP/HDI/releases/download/17r6/HDI_4DVP_CellValues.zip) (v17r6)<span id="17-6-1"></span><br />
4D View Pro に追加された新コマンド[`VP Get values`](https://livedoc.4d.com/4D-View-Pro-17-R6/4D-View-Pro/VP-Get-values.301-4385723.ja.html)および[`VP Get formulas`](https://livedoc.4d.com/4D-View-Pro-17-R6/4D-View-Pro/VP-Get-formulas.301-4385776.ja.html)で値やフォーミュラの一括取得、[`VP SET VALUES`](https://livedoc.4d.com/4D-View-Pro-17-R6/4D-View-Pro/VP-SET-VALUES.301-4385689.ja.html)および[`VP SET FORMULAS`](https://livedoc.4d.com/4D-View-Pro-17-R6/4D-View-Pro/VP-SET-FORMULAS.301-4385750.ja.html)で値やフォーミュラの一括設定ができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: 新機能を活用した汎用コード**](https://github.com/4D-JP/HDI/releases/download/17r5/ORDA_Dynamic_Code.zip) (v17r5)<span id="17-5-12"></span><br />
ORDAに追加された新規メンバーメソッド[`entity.getDataClass( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/entitygetDataClass.305-4275760.ja.html)および[`entitySelection.getDataClass( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/entitySelectiongetDataClass.305-4275795.ja.html)のほか、値と属性パスのプレースホルダー、[`dataClass.{attributeName}`](https://doc.4d.com/4Dv17R5/4D/17-R5/dataClassattributeName.303-4128672.ja.html)オブジェクトを活用した、データクラスに依存しない汎用的なコードや、動的なクエリインターフェースの例を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: タブの設定**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_4DWP_SetTabs.zip) (v17r5)<span id="17-5-11"></span><br />
[`WP SET ATTRIBUTES`](https://doc.4d.com/4Dv17R5/4D/17-R5/WP-SET-ATTRIBUTES.301-4115142.ja.html)コマンドに、新しく追加された定数[`wk tab default`](https://doc.4d.com/4Dv18/4D/18/4D-Write-Pro-Constants.302-4523006.ja.html)または[`wk tabs`](https://doc.4d.com/4Dv18/4D/18/4D-Write-Pro-Constants.302-4523006.ja.html)を指定することで、4D Write Pro ドキュメントのデフォルトタブ・任意のタブが定義できます。<br />
参考：[タブの管理](https://doc.4d.com/4Dv17R5/4D/17-R5/Using-a-4D-Write-Pro-area.200-4115105.ja.html#4226039)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ビュープロパティ**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_4DWP_ViewSettings.zip) (v17r5)<span id="17-5-10"></span><br />
新しく追加された[`WP SET VIEW PROPERTIES`](https://doc.4d.com/4Dv17R5/4D/17-R5/WP-SET-VIEW-PROPERTIES.301-4252257.ja.html)コマンドを使って、4D Write Pro ドキュメントのビュープロパティをプログラムにより制御できるようになりました。ビュープロパティを取得するための、[`WP Get view properties`](https://doc.4d.com/4Dv17R5/4D/17-R5/WP-Get-view-properties.301-4252263.ja.html)コマンドも追加されています。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: リンクを貼る**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_4DWP_Hyperlinks.zip) (v17r5)<span id="17-5-9"></span><br />
新しく追加された[`WP SET LINK`](https://doc.4d.com/4Dv17R5/4D/17-R5/WP-SET-LINK.301-4115165.ja.html)コマンドを使って、4D Write Pro ドキュメントに様々な種類のリンクが貼れるようになりました：Web URL、4Dメソッド、4D Write Pro ドキュメント、開いているドキュメント内のブックマーク。リンク内容を取得するための、[`WP Get links`](https://doc.4d.com/4Dv17R5/4D/17-R5/WP-Get-links.301-4115785.ja.html)コマンドも追加されています。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: INSERT系およびSET系コマンドの拡張**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_4DWP_UseTargets.zip) (v17r5)<span id="17-5-8"></span><br />
INSERT系およびSET系のコマンドが改良され、対象としてレンジ以外のものも指定できるようになりました：
[`WP SELECT`](https://doc.4d.com/4Dv17R5/4D/17-R5/WP-SELECT.301-4115146.ja.html)
[`WP SET TEXT`](https://doc.4d.com/4Dv17R5/4D/17-R5/WP-SET-TEXT.301-4115154.ja.html)
[`WP SET ATTRIBUTES`](https://doc.4d.com/4Dv17R5/4D/17-R5/WP-SET-ATTRIBUTES.301-4115142.ja.html)
[`WP INSERT DOCUMENT`](https://doc.4d.com/4Dv17R5/4D/17-R5/WP-INSERT-DOCUMENT.301-4115127.ja.html)
[`WP INSERT PICTURE`](https://doc.4d.com/4Dv17R5/4D/17-R5/WP-INSERT-PICTURE.301-4115132.ja.html)
[`WP Insert table`](https://doc.4d.com/4Dv17R5/4D/17-R5/WP-Insert-table.301-4115119.ja.html)
[`WP INSERT BREAK`](https://doc.4d.com/4Dv17R5/4D/17-R5/WP-INSERT-BREAK.301-4115125.ja.html)<br />
また、コマンドをより分かりやすくするため、一部のコマンドが名称変更されました。
![名称変更されたコマンド](/images/HDI_4DWP_UseTargets-CommandNameChange.png){: .align-center}
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: セル位置の取得・設定**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_4DVP_SelectionCells.zip) (v17r5)<span id="17-5-7"></span><br />
新しく追加されたコマンドによって、4D View Pro ドキュメントの選択セルやアクティブセルの位置を設定・取得することができます：
[`VP Get selection`](https://doc.4d.com/4Dv18/4D/18/VP-Get-selection.301-4522251.ja.html)
[`VP Get active cell`](https://doc.4d.com/4Dv18/4D/18/VP-Get-active-cell.301-4522287.ja.html)
[`VP SET SELECTION`](https://doc.4d.com/4Dv18/4D/18/VP-SET-SELECTION.301-4522250.ja.html)
[`VP SET ACTIVE CELL`](https://doc.4d.com/4Dv18/4D/18/VP-SET-ACTIVE-CELL.301-4522248.ja.html)
[`VP RESET SELECTION`](https://doc.4d.com/4Dv18/4D/18/VP-RESET-SELECTION.301-4522249.ja.html)<br />
また、スプレッドシートの表示を変えて、任意セルを表示枠のどこに配置するか指定できるようになりました：
[`VP SHOW CELL`](https://doc.4d.com/4Dv18/4D/18/VP-SHOW-CELL.301-4522247.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: 動的なストラクチャー情報の取得**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_Database_Info.zip) (v17r5)<span id="17-5-6"></span><br />
新しく追加されたメンバーメソッドや、[データクラス属性](https://doc.4d.com/4Dv17R5/4D/17-R5/ORDA-DataClassAttribute.201-4127158.ja.html)オブジェクトの拡張によって、動的なストラクチャー情報の取得が容易になりました。これにより汎用コードを簡単に書くことができます。<br />
[`dataClass.getInfo( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/dataClassgetInfo.305-4275830.ja.html)
[`entity.getDataClass( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/entitygetDataClass.305-4275760.ja.html)
[`entitySelection.getDataClass( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/entitySelectiongetDataClass.305-4275795.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ユーザーエイリアスの設定**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_SetUserAlias.zip) (v17r5)<span id="17-5-5"></span><br />
新しく追加された[`SET USER ALIAS`](https://doc.4d.com/4Dv17R5/4D/17-R5/SET-USER-ALIAS.301-4276122.ja.html)コマンドを使って、カレントユーザーのエイリアスが設定できるようになりました。これにともない、[`Current user`](https://doc.4d.com/4Dv17R5/4D/17-R5/Current-user.301-4127469.ja.html)コマンドも拡張され、定数パラメーターを受け渡せるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**データファイルの暗号化**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_Encryption.zip) (v17r5)<span id="17-5-4"></span><br />
データファイルの暗号化機能を紹介します。参考: [データの暗号化](https://doc.4d.com/4Dv17R5/4D/17-R5/Encrypting-data.300-4098282.ja.html)<br />
[`Encrypt data file`](https://doc.4d.com/4Dv17R5/4D/17-R5/Encrypt-data-file.301-4032077.ja.html)
[`Data file encryption status`](https://doc.4d.com/4Dv17R5/4D/17-R5/Data-file-encryption-status.301-4031901.ja.html)
[`Register data key`](https://doc.4d.com/4Dv17R5/4D/17-R5/Register-data-key.301-4072179.ja.html)
[`New data key`](https://doc.4d.com/4Dv17R5/4D/17-R5/New-data-key.301-4070478.ja.html)
[`Discover data key`](https://doc.4d.com/4Dv17R5/4D/17-R5/Discover-data-key.301-4097761.ja.html)
[`ds.provideDataKey( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/dsprovideDataKey.305-4069252.ja.html)
[`ds.encryptionStatus( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/dsencryptionStatus.305-4166703.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: 属性パスのプレースホルダーを使ったクエリ**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_PlaceHolders_AttributePaths.zip) (v17r5)<span id="17-5-3"></span><br />
[`dataClass.query( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/dataClassquery.305-4128666.ja.html)および[`entitySelection.query( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/entitySelectionquery.305-4128676.ja.html)のメンバーメソッドを使う際に、属性パスのプレースホルダーが使えるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: 値の命名プレースホルダーを使ったクエリ**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_PlaceHolders_Values.zip) (v17r5)<span id="17-5-2"></span><br />
[`dataClass.query( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/dataClassquery.305-4128666.ja.html)および[`entitySelection.query( )`](https://doc.4d.com/4Dv17R5/4D/17-R5/entitySelectionquery.305-4128676.ja.html)のメンバーメソッドを使う際に、値の命名プレースホルダーが使えるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**ファイルオブジェクト・フォルダーオブジェクト**](https://github.com/4D-JP/HDI/releases/download/17r5/HDI_FilesAndFolders.zip) (v17r5)<span id="17-5-1"></span><br />
新しく追加された[`File`](https://doc.4d.com/4Dv17R5/4D/17-R5/File.301-4280282.ja.html)コマンドと[`Folder`](https://doc.4d.com/4Dv17R5/4D/17-R5/Folder.301-4280288.ja.html)コマンド、およびその戻り値であるファイルオブジェクトとフォルダーオブジェクトを使って、ファイルやフォルダーの操作がオブジェクト記法で簡単にできるようになりました。<br />
参考：[ファイルとフォルダー](https://doc.4d.com/4Dv17R5/4D/17-R5/File-and-Folder.201-4282207.ja.html)<br />
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: バーチャルストラクチャー**](https://github.com/4D-JP/HDI/releases/download/17r4/HDI_4DWP_VirtualStructure.zip) (v17r4)<span id="17-4-6"></span><br />
[`SET FIELD TITLES`](https://doc.4d.com/4Dv17R4/4D/17-R4/SET-FIELD-TITLES.301-4054009.ja.html)および[`SET TABLE TITLES`](https://doc.4d.com/4Dv17R4/4D/17-R4/SET-TABLE-TITLES.301-4054019.ja.html)コマンドで定義したバーチャルストラクチャーが 4D Write Pro 内で利用できるようになりました。<br />
参考：[バーチャルストラクチャーのサポート](https://doc.4d.com/4Dv17R4/4D/17-R4/Managing-expressions.300-4077722.ja.html#4087988)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: レンジ座標の取得**](https://github.com/4D-JP/HDI/releases/download/17r4/HDI_4DWP_MoreCoordinates.zip) (v17r4)<span id="17-4-5"></span><br />
[`WP Get position`](https://doc.4d.com/4Dv17R4/4D/17-R4/WP-Get-position.301-4077777.ja.html)コマンドが拡張され、4D Write Pro ドキュメント内の任意のレンジについて、ページ上の座標を取得できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 垂直ルーラー**](https://github.com/4D-JP/HDI/releases/download/17r4/HDI_4DWP_VerticalRulers.zip) (v17r4)<span id="17-4-4"></span><br />
ページモードで表示された 4D Write Pro エリアで、[垂直ルーラー](https://doc.4d.com/4Dv17R4/4D/17-R4/Using-a-4D-Write-Pro-area.200-4077726.ja.html#4101568)が使えるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: セルの値の設定・取得**](https://github.com/4D-JP/HDI/releases/download/17r4/HDI_4DVP_SetGetCells.zip) (v17r4)<span id="17-4-3"></span><br />
[`VP SET VALUE`](https://doc.4d.com/4Dv17R4/4D/17-R4/VP-SET-VALUE.301-4092966.ja.html)および[`VP Get value`](https://doc.4d.com/4Dv17R4/4D/17-R4/VP-Get-value.301-4100214.ja.html)コマンドによって、4D View Pro ドキュメントのセルの値を設定・取得することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**メール送信**](https://github.com/4D-JP/HDI/releases/download/17r4/HDI_SendMail.zip) (v17r4)<span id="17-4-2"></span><br />
[`SMTP New transporter`](https://doc.4d.com/4Dv17R4/4D/17-R4/SMTP-New-transporter.301-4070576.ja.html)コマンドによって生成した SMTP transporter オブジェクトを使ってメールを送信することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: DOCX形式への書き出し**](https://github.com/4D-JP/HDI/releases/download/17r4/HDI_4DWP_ExportDocx.zip) (v17r4)<span id="17-4-1"></span><br />
[`WP EXPORT DOCUMENT`](https://doc.4d.com/4Dv17R4/4D/17-R4/WP-EXPORT-DOCUMENT.301-4077762.ja.html)および[`WP EXPORT VARIABLE`](https://doc.4d.com/4Dv17R4/4D/17-R4/WP-EXPORT-VARIABLE.301-4077758.ja.html)コマンドを使って、4D Write Pro ドキュメントから[.docx形式への書き出し](https://doc.4d.com/4Dv17R4/4D/17-R4/Exporting-in-docx-format.200-4077720.ja.html)をすることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**bootstrapと4Dタグ**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_Bootstrap_4DTags.zip) (v17r3)<span id="17-3-7"></span><br />
[4D 変換タグ](https://doc.4d.com/4D-Transformation-Tags.300-3907284.ja.html)をbootstrapと組み合わせて使えば、データを差し込んだ見栄えのするページを簡単に作成することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**アプリケーションの起動パラメーター**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_RelaunchAndTest.zip) (v17r3)<span id="17-3-6"></span><br />
[Database Parameters](https://doc.4d.com/Database-Parameters.302-3905958.ja.html)定数テーマに追加された定数 _User param value_ を使って、データベースをコマンドで起動する際にパラメーターを受け渡すことができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**ネットワークアクティビティ情報**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_GetApplicationInfo.zip) (v17r3)<span id="17-3-5"></span><br />
[`Get application info`](https://doc.4d.com/Get-application-info.301-3921185.ja.html)コマンドを使って、アクティブデータベースと、そのネットワーク設定に関する情報を取得することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**テキスト形式でフォームの書き出し**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_ConvertFormToDynamicForm.zip) (v17r3)<span id="17-3-4"></span><br />
[`FORM Convert to dynamic`](https://doc.4d.com/FORM-Convert-to-dynamic.301-3972173.ja.html)コマンドを使って、4DBファイルに保存された従来の 4DフォームをJSONファイルに変換し、ダイナミックフォームとして使用することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: XLSXファイルのインポート・エクスポート**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_4DVP_ExportToExcel.zip) (v17r3)<span id="17-3-3"></span><br />
[`VP IMPORT DOCUMENT`](https://doc.4d.com/VP-IMPORT-DOCUMENT.301-3935955.ja.html)および[`VP EXPORT DOCUMENT`](https://doc.4d.com/VP-EXPORT-DOCUMENT.301-3935956.ja.html)コマンドを使って、XLSXファイルをインポート・エクスポートすることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**メソッドのオブジェクト化**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_NewFormula.zip) (v17r3)<span id="17-3-2"></span><br />
[`New formula`](http://doc.4d.com/New-formula.301-3958154.ja.html)コマンドを使って、メソッドをオブジェクト化することができます。オブジェクト化されたメソッドは引数として受け渡すことができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: セクションとサブセクションの操作**](https://github.com/4D-JP/HDI/releases/download/17r3/HDI_4DWP_ManageSections.zip) (v17r3)<span id="17-3-1"></span><br />
セクションやサブセクションをコマンドにより操作することができます:
[`WP Get section`](https://doc.4d.com/WP-Get-section.301-3921330.ja.html)
[`WP Get sections`](https://doc.4d.com/WP-Get-sections.301-3905004.ja.html)
[`WP SET ATTRIBUTES`](https://doc.4d.com/WP-SET-ATTRIBUTES.301-3920802.ja.html)
[`WP Create subsection`](https://doc.4d.com/WP-Create-subsection.301-3931950.ja.html)
[`WP Get subsection`](https://doc.4d.com/WP-Get-subsection.301-3934758.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: アンカー画像にピクチャー式を設定**](https://github.com/4D-JP/HDI/releases/download/17r2/HDI_4DWP_AnchoredPictureExpressions.zip) (v17r2)<span id="17-2-3"></span><br />
アンカー画像も[ピクチャー式](https://doc.4d.com/Handling-pictures.200-3920761.ja.html#3841026)（変数・フィールド・メソッドなど）によって定義することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: フィールドデータやメソッドを使う**](https://github.com/4D-JP/HDI/releases/download/17r2/HDI_4DVP_DB_Method.zip) (v17r2)<span id="17-2-2"></span><br />
セルへの簡単な記述により、[フィールドへの参照](https://doc.4d.com/Field-references.300-3936010.ja.html)や[プロジェクトメソッドへの参照](https://doc.4d.com/Project-method-references.300-3935962.ja.html)を使用することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 表組みのページネーション**](https://github.com/4D-JP/HDI/releases/download/17r2/HDI_4DWP_TablePagination.zip) (v17r2)<span id="17-2-1"></span><br />
表組みが[自動ページネーション](https://doc.4d.com/Using-a-4D-Write-Pro-area.200-3920766.ja.html#3892922)に対応し、表組みの表示がページをまたぐ場合には行と行のあいだで分割されるようになりました。

## 17 # {#v17}

* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro: プログラムによってドキュメントを作成**](https://github.com/4D-JP/HDI/releases/download/17/HDI_4DVP_Offscreen_doc.zip)<span id="17-0-23"></span><br />
4D View Pro ドキュメントはプログラムによっても簡単に作成することができます。<br />
参考: [4D View Pro オブジェクト](https://doc.4d.com/Handling-4D-View-Pro-areas.300-3935959.ja.html#3429183)、[`VP IMPORT FROM OBJECT`](https://doc.4d.com/VP-IMPORT-FROM-OBJECT.301-3935958.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: ストラクチャー情報を使った汎用コード**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Dynamic_Sort_v17.zip)<span id="17-0-22"></span><br />
ORDAによって取得できるストラクチャー情報を利用した、汎用的なコードによる並べ替えツールの例です。
* <i class="fa fa-download" aria-hidden="true"></i> [**コレクション型リストボックスと複階層コレクション**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ListBoxCollection_Advanced_v17.zip)<span id="17-0-21"></span><br />
複数のリストボックスを使い、複階層のコレクションを表示します。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: エンティティセレクションの表示**](https://github.com/4D-JP/HDI/releases/download/17/HDI_EntitySelectionInListbox.zip)<span id="17-0-20"></span><br />
エンティティセレクションをコレクション型リストボックスに表示するために必要となる設定を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: エンティティセレクションの統計情報**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Statistics.zip)<span id="17-0-19"></span><br />
エンティティセレクションの統計情報は[エンティティセレクションのメンバーメソッド](https://doc.4d.com/ORDA-EntitySelection.201-3905932.ja.html)を使って簡単に取得することができます: 
[`entitySelection.sum( )`](https://doc.4d.com/entitySelectionsum.305-3907529.ja.html)
[`entitySelection.min( )`](https://doc.4d.com/entitySelectionmin.305-3907531.ja.html)
[`entitySelection.max( )`](https://doc.4d.com/entitySelectionmax.305-3907532.ja.html)
[`entitySelection.count( )`](https://doc.4d.com/entitySelectioncount.305-3907530.ja.html)
[`entitySelection.average( )`](https://doc.4d.com/entitySelectionaverage.305-3907535.ja.html)
[`entitySelection.distinct( )`](https://doc.4d.com/entitySelectiondistinct.305-3907534.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: エンティティセレクションの論理演算**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Logical_Operators.zip)<span id="17-0-18"></span><br />
エンティティに対する論理演算は[エンティティセレクションのメンバーメソッド](https://doc.4d.com/ORDA-EntitySelection.201-3905932.ja.html)を使っておこなうことができます: 
[`entitySelection.and( )`](https://doc.4d.com/entitySelectionand.305-3907525.ja.html)
[`entitySelection.or( )`](https://doc.4d.com/entitySelectionor.305-3907518.ja.html)
[`entitySelection.minus( )`](https://doc.4d.com/entitySelectionminus.305-3907519.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: エンティティとエンティティセレクションの操作**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Handling_Entities.zip)<span id="17-0-17"></span><br />
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
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: 楽観的(オプティミスティック)ロック**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Optimistic_Lock.zip)<span id="17-0-16"></span><br />
ORDAの基本仕様である、オプティミスティックロックがどのように動作するかについての説明です。
[`entity.save( )`](https://doc.4d.com/entitysave.305-3907540.ja.html)
[`entity.clone( )`](https://doc.4d.com/entityclone.305-3907549.ja.html)
[`entity.reload( )`](https://doc.4d.com/entityreload.305-3907543.ja.html)
[`entity.drop( )`](https://doc.4d.com/entitydrop.305-3907541.ja.html)
[`entity.touchedAttributes( )`](https://doc.4d.com/entitytouchedAttributes.305-3907548.ja.html)
[`entity.touched( )`](https://doc.4d.com/entitytouched.305-3907547.ja.html)
[`entity.diff( )`](https://doc.4d.com/entitydiff.305-3907546.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: 悲観的(ペシミスティック)ロック**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Pessimistic_Lock.zip)<span id="17-0-15"></span><br />
ORDAでペシミスティックロックを使う方法の紹介です。
[`entity.lock( )`](https://doc.4d.com/entitylock.305-3907542.ja.html)
[`entity.unlock( )`](https://doc.4d.com/entityunlock.305-3907544.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**動的なテーブルフォーム**](https://github.com/4D-JP/HDI/releases/download/17/HDI_JSONTableForm_v17.zip)<span id="17-0-14"></span><br />
JSONファイルや、4D オブジェクト (オブジェクト型変数、あるいはオブジェクト型フィールド) によって[ダイナミックフォーム](https://doc.4d.com/Dynamic-Forms.300-3961476.ja.html)を定義することができます。ここでは、テーブルフォームを動的に生成する例を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: エンティティとオブジェクトの相互変換**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Objects_And_Collections.zip)<span id="17-0-13"></span><br />
エンティティやエンティティセレクションをオブジェクトやコレクションに変換したり、その逆をおこなうメンバーメソッドの紹介です: 
[`entity.toObject( )`](https://doc.4d.com/entitytoObject.305-3907556.ja.html)
[`entitySelection.toCollection( )`](https://doc.4d.com/entitySelectiontoCollection.305-3907523.ja.html)
[`entity.fromObject( )`](https://doc.4d.com/entityfromObject.305-3907557.ja.html)
[`dataClass.fromCollection( )`](https://doc.4d.com/dataClassfromCollection.305-3907510.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: エンティティセレクションとカレントセレクションの相互変換**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Current_Selection_Bridge.zip)<span id="17-0-12"></span><br />
カレントセレクションからエンティティセレクションを作成したり、エンティティセレクションをカレントセレクションに反映させることができます。<br />
[`Create entity selection`](https://doc.4d.com/Create-entity-selection.301-3907527.ja.html)
[`USE ENTITY SELECTION`](https://doc.4d.com/USE-ENTITY-SELECTION.301-3907526.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**コレクション型リストボックス**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ListboxCollection.zip)<span id="17-0-11"></span><br />
[コレクション型リストボックス](https://doc.4d.com/4Dv18/4D/18/Overview.300-4575643.ja.html#3779401)の設定の仕方、使い方の紹介です。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: クエリ**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_Query.zip)<span id="17-0-10"></span><br />
ORDAを使ったクエリ方法の紹介です。<br />
[`entitySelection.query( )`](https://doc.4d.com/entitySelectionquery.305-3907515.ja.html)
[`dataClass.query( )`](https://doc.4d.com/dataClassquery.305-3907505.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ドキュメント要素の一括取得**](https://github.com/4D-JP/HDI/releases/download/17/HDI_4DWP_Elements.zip)<span id="17-0-9"></span><br />
[`WP Get elements`](https://doc.4d.com/WP-Get-elements.301-3920772.ja.html)コマンドを使って、ドキュメントの要素をすべて、あるいは種類別に一度に取得することができます。取得要素はコレクションに格納されて返されます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ドキュメント要素の位置情報**](https://github.com/4D-JP/HDI/releases/download/17/HDI_4DWP_GetPosition.zip)<span id="17-0-8"></span><br />
[`WP Get position`](https://doc.4d.com/WP-Get-position.301-3920816.ja.html)コマンドを使って、ドキュメント要素の位置情報を取得することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 段組レイアウト**](https://github.com/4D-JP/HDI/releases/download/17/HDI_4DWP_MultiColumn.zip)<span id="17-0-7"></span><br />
段組(カラム)レイアウトを使用した例です。<br />
参考: [カラムの管理](https://doc.4d.com/Using-a-4D-Write-Pro-area.200-3920766.ja.html#3751928)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: テキストの取得と挿入**](https://github.com/4D-JP/HDI/releases/download/17/HDI_4DWP_SetGetText.zip)<span id="17-0-6"></span><br />
[`WP Get text`](https://doc.4d.com/WP-Get-text.301-3920815.ja.html)および[`WP SET TEXT`](https://doc.4d.com/WP-SET-TEXT.301-3920814.ja.html)コマンドを使って、テキストの取得や挿入をすることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: コンテキストメニューのカスタマイズ**](https://github.com/4D-JP/HDI/releases/download/17/HDI_4DWriteProContextualMenu.zip)<span id="17-0-5"></span><br />
右クリックで表示されるコンテキストメニューをカスタマイズする方法の紹介です。
* <i class="fa fa-download" aria-hidden="true"></i> [**新しい For each...End for each ループ**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ForEach.zip)<span id="17-0-4"></span><br />
新しく実装された[`For each...End for each`](https://doc.4d.com/For-eachEnd-for-each.300-3907126.ja.html)ループの使用例です。コレクション内の各要素、エンティティセレクション内の各エンティティ、オブジェクト内の各プロパティの反復処理が可能です。
* <i class="fa fa-download" aria-hidden="true"></i> [**フォームデータとFormコマンド**](https://github.com/4D-JP/HDI/releases/download/17/HDI_FormData.zip)<span id="17-0-3"></span><br />
[`DIALOG`](https://doc.4d.com/DIALOG.301-3907158.ja.html)コマンドには、フォームデータを引数として渡すことができるようになりました。渡したオブジェクトはフォームにおいて[`Form`](http://doc.4d.com/Form.301-3907390.ja.html)コマンドによって呼び出すことができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**テキスト形式でデータベースストラクチャーを書き出し**](https://github.com/4D-JP/HDI/releases/download/17/HDI_GET_STRUCTURE_INFO.zip)<span id="17-0-2"></span><br />
[`EXPORT STRUCTURE`](http://doc.4d.com/EXPORT-STRUCTURE.301-3906050.ja.html)コマンド使って、データベースストラクチャー定義をXMLフォーマットで書き出します。
* <i class="fa fa-download" aria-hidden="true"></i> [**ORDA: エンティティの新規作成・更新・削除**](https://github.com/4D-JP/HDI/releases/download/17/HDI_ORDA_CRUD.zip)<span id="17-0-1"></span><br />
ORDAにおける、メンバーメソッドを使ったエンティティの基本操作を説明します。<br />
[`dataClass.new( )`](https://doc.4d.com/dataClassnew.305-3907506.ja.html)
[`entity.save( )`](https://doc.4d.com/entitysave.305-3907540.ja.html)
[`entity.drop( )`](https://doc.4d.com/entitydrop.305-3907541.ja.html)
[`entitySelection.drop( )`](https://doc.4d.com/entitySelectiondrop.305-3907513.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**コレクションのクエリ**](https://github.com/4D-JP/HDI/releases/download/16r6/HDI_Collection_Query.zip) (v16r6)<span id="16-6-5"></span><br />
[`collection.query( )`](https://doc.4d.com/collectionquery.305-3730931.ja.html)メンバーメソッドを使ったコレクションのクエリ方法を紹介します。プレースホルダーを使った例、使わない例、比較演算子や、文字列をクエリする際の"@"の扱いなど。
* <i class="fa fa-download" aria-hidden="true"></i> [**コレクションの操作**](https://github.com/4D-JP/HDI/releases/download/16r6/HDI_Collection_Members.zip) (v16r6)<span id="16-6-4"></span><br />
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
* <i class="fa fa-download" aria-hidden="true"></i> [**動的なフォーム**](https://github.com/4D-JP/HDI/releases/download/16r6/HDI_JSONForm.zip) (v16r6)<span id="16-6-3"></span><br />
フォームをテキストで表し、4Dオブジェクトや.jsonファイルとして保存することができます。[ダイナミックフォーム](https://doc.4d.com/Dynamic-Forms.300-4201272.ja.html)は、ランタイムにおいて動的に生成されます。
* <i class="fa fa-download" aria-hidden="true"></i> [**共有オブジェクトとStorage**](https://github.com/4D-JP/HDI/releases/download/16r6/HDI_useSharedObjects.zip) (v16r6)<span id="16-6-2"></span><br />
[共有オブジェクトおよび共有コレクション](https://doc.4d.com/Shared-objects-and-shared-collections.300-4179447.ja.html)はプロセス間でコンテンツを共有することができる、特殊なオブジェクトとコレクションです。作成された共有オブジェクト等の一覧は[`Storage`](https://doc.4d.com/Storage.301-4179448.ja.html)コマンドより取得することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: アンカー画像**](https://github.com/4D-JP/HDI/releases/download/16r6/HDI_4DWP_ImageInAbsolutePosition.zip) (v16r6)<span id="16-6-1"></span><br />
[`WP Add picture`](https://doc.4d.com/WP-Add-picture.301-3726324.ja.html)コマンドを使って、4D Write Pro ドキュメントのテキストレイヤーの前面および背面に、[アンカー画像](https://doc.4d.com/Handling-pictures.200-3726275.ja.html#3624752)を追加することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**Twitter Search API との連携**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_TwitterSearchAPI.zip) (v16r5)<span id="16-5-9"></span><br />
[`HTTP Request`](https://doc.4d.com/HTTP-Request.301-4178732.ja.html)コマンドを使って Twitter のアカウント認証と文字列検索を行う方法の紹介です。
* <i class="fa fa-download" aria-hidden="true"></i> [**JSON ポインターの解決**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_JSON_Pointer.zip) (v16r5)<span id="16-5-8"></span><br />
新しく追加された[`JSON Resolve pointers`](https://doc.4d.com/JSON-Resolve-pointers.301-4179124.ja.html)コマンドは、引数として渡されたオブジェクトに含まれるすべての JSON ポインターを解決します。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: 行高さの自動設定**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_4DVP_AutoRowHeight.zip) (v16r5)<span id="16-5-7"></span><br />
新しいリストボックスプロパティ「[自動行高](https://doc.4d.com/List-box-specific-properties.300-4201189.ja.html#3510338)」および「最小行高」「最大行高」が追加されました。<br />
<span style="text-decoration: underline">※ この機能には 4D View Pro ライセンスが必要です。</span>
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: フチなし全面の背景画像**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_4DWP_BackImagePaperBox.zip) (v16r5)<span id="16-5-6"></span><br />
4D Write Pro で[背景](https://doc.4d.com/Using-a-4D-Write-Pro-area.200-3726280.ja.html#3514034)画像をフチなし全面指定できるようになりました。[`WP SET ATTRIBUTES`](https://doc.4d.com/WP-SET-ATTRIBUTES.301-3726313.ja.html)コマンドで[背景属性](https://doc.4d.com/4D-Write-Pro-Attributes.300-3726323.ja.html#3690279)の`wk background clip`と`wk background origin`を`wk paper box`に指定します。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ヘッダーとフッター**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_4DWP_HeadersFooters.zip) (v16r5)<span id="16-5-5"></span><br />
追加された新コマンドにより、ヘッダーとフッターがプログラムにより操作できるようになりました。<br />
[`WP Get header`](https://doc.4d.com/WP-Get-header.301-3726285.ja.html)[`WP Get body`](https://doc.4d.com/WP-Get-body.301-3726287.ja.html)[`WP Get footer`](https://doc.4d.com/WP-Get-footer.301-3726286.ja.html)[`WP Get frame`](https://doc.4d.com/WP-Get-frame.301-3726289.ja.html)[`WP SET FRAME`](https://doc.4d.com/WP-SET-FRAME.301-3726288.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ピクチャー式の使用**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_4DWP_InsertPictureExpression.zip) (v16r5)<span id="16-5-4"></span><br />
4D Write Pro ドキュメントに、[ピクチャー式](https://doc.4d.com/4Dv17R3/4D/17-R3/Handling-pictures.200-3920761.ja.html#3841026)を挿入できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**Get Process Activity**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_GetProcessActivity.zip) (v16r5)<span id="16-5-3"></span><br />
[`Get process activity`](https://doc.4d.com/Get-process-activity.301-4179078.ja.html)コマンドを使って、セッションやプロセスの情報をモニタリングする方法を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックスとヘルプTips**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_ListboxHelpTips.zip) (v16r5)<span id="16-5-2"></span><br />
[`OBJECT SET HELP TIP`](https://doc.4d.com/OBJECT-SET-HELP-TIP.301-4179220.ja.html)および[`LISTBOX GET CELL POSITION`](https://doc.4d.com/LISTBOX-GET-CELL-POSITION.301-4178984.ja.html)コマンドが拡張され、リストボックス内に個別のヘルプTipsを追加できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: リンクの挿入**](https://github.com/4D-JP/HDI/releases/download/16r5/HDI_4DWP_Links.4dbase.zip) (v16r5)<span id="16-5-1"></span><br />
[`WP SET ATTRIBUTES`](https://doc.4d.com/WP-SET-ATTRIBUTES.301-3726313.ja.html)コマンドで任意のレンジに`wk link url`を設定し、リンクを挿入する方法を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D View Pro プレビュー**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_4DViewProNewFormObject.zip) (v16r4)<span id="16-4-9"></span><br />
4D View Pro ドキュメントの基本操作に必要なコマンドが追加されました。<br />
[`VP NEW DOCUMENT`](https://doc.4d.com/VP-NEW-DOCUMENT.301-3778565.ja.html)[`VP EXPORT DOCUMENT`](https://doc.4d.com/VP-EXPORT-DOCUMENT.301-3778567.ja.html)[`VP Export to object`](https://doc.4d.com/VP-Export-to-object.301-3778568.ja.html)[`VP IMPORT DOCUMENT`](https://doc.4d.com/VP-IMPORT-DOCUMENT.301-3778566.ja.html)[`VP IMPORT FROM OBJECT`](https://doc.4d.com/VP-IMPORT-FROM-OBJECT.301-3778569.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 表組み**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_4DWritePro_Tables.zip) (v16r4)<span id="16-4-8"></span><br />
4D Write Pro に表組みを挿入し、表示を整える方法を紹介します。<br />
[`WP Insert table`](https://doc.4d.com/WP-Insert-table.301-3726290.ja.html)[`WP Table append row`](https://doc.4d.com/WP-Table-append-row.301-3726291.ja.html)[`WP Table get columns`](https://doc.4d.com/WP-Table-get-columns.301-3726293.ja.html)[`WP Table get rows`](https://doc.4d.com/WP-Table-get-rows.301-3726292.ja.html)[`WP Table get cells`](https://doc.4d.com/WP-Table-get-cells.301-3726294.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**JSONオブジェクトの評価**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_JSONFileValidation.zip) (v16r4)<span id="16-4-7"></span><br />
新コマンド[`JSON Validate`](https://doc.4d.com/JSON-Validate.301-4179123.ja.html)を使って、任意のJSONオブジェクトが、あらかじめ定義したJSONスキーマに適合するかをチェックすることができます。また、適合しなかった場合のデバッグ用に、要素の位置を特定できるよう[`JSON Parse`](https://doc.4d.com/JSON-Parse.301-4179121.ja.html)コマンドが拡張されました。
* <i class="fa fa-download" aria-hidden="true"></i> [**オブジェクト記法**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_ObjectNotationDatasource.zip) (v16r4)<span id="16-4-6"></span><br />
[オブジェクト記法](https://doc.4d.com/Using-object-notation.300-4179432.ja.html)の使い方を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**オブジェクトとピクチャー属性**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_PictureObjectAttribute.zip) (v16r4)<span id="16-4-5"></span><br />
オブジェクトの属性値にピクチャーを設定できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**標準アクションとマルチステートオブジェクト**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_StandardActionMultiStateObject.zip) (v16r4)<span id="16-4-4"></span><br />
チェックボックス・ポップアップメニュ・ドロップダウンリストなどのマルチステートオブジェクトで標準アクションを利用できるようになり、4D Write Pro 用のカスタムメニューバーが簡単に作成できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**プログラムによる入力順の指定**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_TabbableObjectOrder.zip) (v16r4)<span id="16-4-3"></span><br />
新しいコマンド[`FORM GET ENTRY ORDER`](https://doc.4d.com/FORM-GET-ENTRY-ORDER.301-4179552.ja.html)[`FORM SET ENTRY ORDER`](https://doc.4d.com/FORM-SET-ENTRY-ORDER.301-4179553.ja.html)によってフォーム上のタブ移動による入力順を動的に指定できるようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**ヘルプTips表示のカスタマイズ**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_Tips.zip) (v16r4)<span id="16-4-2"></span><br />
[`SET DATABASE PARAMETER`](https://doc.4d.com/SET-DATABASE-PARAMETER.301-4179137.ja.html)で`Tips enabled`、`Tips delay`、`Tips duration`の新パラメーターが設定できるようになりました。<br />
参考：[`OBJECT SET HELP TIP`](https://doc.4d.com/OBJECT-SET-HELP-TIP.301-4179220.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**コレクション**](https://github.com/4D-JP/HDI/releases/download/16r4/HDI_UseCollections.zip) (v16r4)<span id="16-4-1"></span><br />
[コレクション](https://doc.4d.com/Data-Types.300-4179320.ja.html#3687203)という新しいデータタイプが実装されました。<br />
参考：[コレクションについて](https://doc.4d.com/About-collections.300-4179667.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 標準アクション**](https://github.com/4D-JP/HDI/releases/download/16r3/HDI_4DWP_StandardActions.zip) (v16r3)<span id="16-3-3"></span><br />
4D Write Pro で使える標準アクションが多数実装されました。新コマンド[`INVOKE ACTION`](https://doc.4d.com/INVOKE-ACTION.301-4178618.ja.html)の使用含め、標準アクションを利用する方法を紹介します。
* <i class="fa fa-download" aria-hidden="true"></i> [**新しい標準アクション**](https://github.com/4D-JP/HDI/releases/download/16r3/HDI_NewStandardActions.zip) (v16r3)<span id="16-3-2"></span><br />
新しい標準アクションをスタイル付テキストに適用する方法を紹介します。<br />
新しく追加された[`Get action info`](https://doc.4d.com/Get-action-info.301-4178619.ja.html)コマンドを使って、任意の標準アクションについて、特定のコンテキストにおける利用可能性やステータスなどの情報を取得することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**New Object**](https://github.com/4D-JP/HDI/releases/download/16r3/HDI_NewObject.zip) (v16r3)<span id="16-3-1"></span><br />
オブジェクトを初期化するための新コマンド[`New object`](https://doc.4d.com/New-object.301-4179445.ja.html)が追加されました。従来のコードと新コマンドを使ったコードを比較します。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: LISTBOX SET PROPERTY**](https://github.com/4D-JP/HDI/releases/download/16r2/HDI_ListboxProperties.zip) (v16r2)<span id="16-2-4"></span><br />
新コマンド[`LISTBOX SET PROPERTY`](https://doc.4d.com/LISTBOX-SET-PROPERTY.301-4178995.ja.html)を使って、リストボックスのプロパティをプログラミングにより設定するデモンストレーションです。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: 選択行のハイライト**](https://github.com/4D-JP/HDI/releases/download/16r2/HDI_ManageListboxHightlight.zip) (v16r2)<span id="16-2-3"></span><br />
リストボックスにおける選択行のハイライトがカスタマイズできるようになりました。<br />
参考：[選択行の見た目をカスタマイズ](https://doc.4d.com/Managing-List-Box-Objects.300-4178954.ja.html#3971639)
* <i class="fa fa-download" aria-hidden="true"></i> [**オブジェクトフィールドに基づいた並べ替え**](https://github.com/4D-JP/HDI/releases/download/16r2/HDI_ORDER_BY_ATTRIBUTE.zip) (v16r2)<span id="16-2-2"></span><br />
新コマンド[`ORDER BY ATTRIBUTE`](https://doc.4d.com/ORDER-BY-ATTRIBUTE.301-4178917.ja.html)を使って、オブジェクトフィールド内のプロパティに基づいてセレクションを並べ替えることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**オブジェクト配列のクエリ**](https://github.com/4D-JP/HDI/releases/download/16r2/HDI_QueryByAttribute.zip) (v16r2)<span id="16-2-1"></span><br />
[`QUERY BY ATTRIBUTE`](https://doc.4d.com/QUERY-BY-ATTRIBUTE.301-4178904.ja.html)[`QUERY SELECTION BY ATTRIBUTE`](https://doc.4d.com/QUERY-SELECTION-BY-ATTRIBUTE.301-4178916.ja.html)コマンドが拡張され、オブジェクト配列が含まれているオブジェクトフィールドのクエリが便利になりました。<br />
参考：[配列属性のクエリ引数をリンクする](https://doc.4d.com/QUERY-BY-ATTRIBUTE.301-4178904.ja.html#3181657)

## 16 # {#v16}

* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ブックマークの操作**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_Bookmarks.zip)<span id="16-0-18"></span><br />
4D Write Proのブックマーク機能を紹介します。参考：[ブックマークコマンド](https://doc.4d.com/Accessing-document-contents-by-programming.300-3726304.ja.html#3507549)<br />
[`WP CREATE BOOKMARK`](https://doc.4d.com/WP-CREATE-BOOKMARK.301-3726301.ja.html)
[`WP GET BOOKMARKS`](https://doc.4d.com/WP-GET-BOOKMARKS.301-3726300.ja.html)
[`WP Get bookmark range`](https://doc.4d.com/WP-Get-bookmark-range.301-3726302.ja.html)
[`WP DELETE BOOKMARK `](https://doc.4d.com/WP-DELETE-BOOKMARK.301-3726299.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ブックマークの活用例**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_InvoicesAndBookmarks.zip)<span id="16-0-17"></span><br />
実際にブックマークを活用したデモンストレーションです。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 4D式とフィルタリング**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_Filter4DExpressions.zip)<span id="16-0-16"></span><br />
4D Write Proのドキュメントには4D式を挿入できますが、これらはあらかじめ[`SET ALLOWED METHODS`](https://doc.4d.com/SET-ALLOWED-METHODS.301-4179548.ja.html)によって許可されている必要があります。<br />
参考：[4D Write Pro ドキュメントに含める式の制限](https://doc.4d.com/Filter-expressions-contained-in-a-4D-Write-Pro-document.300-3726276.ja.html#2993380)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ドキュメントの操作**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_InsertDoc.zip)<span id="16-0-15"></span><br />
次のコマンドを紹介します：<br />
[`WP New`](https://doc.4d.com/WP-New.301-3726295.ja.html) ドキュメントの新規作成<br />
[`WP INSERT DOCUMENT`](https://doc.4d.com/WP-INSERT-DOCUMENT.301-3726298.ja.html) ドキュメントの挿入<br />
[`WP INSERT BREAK`](https://doc.4d.com/WP-INSERT-BREAK.301-3726296.ja.html) ブレークの挿入<br />
[`WP Get page count`](https://doc.4d.com/WP-Get-page-count.301-3726297.ja.html) 総ページ数の取得
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ピクチャーの挿入**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_InsertPicture.zip)<span id="16-0-14"></span><br />
[`WP INSERT PICTURE`](https://doc.4d.com/WP-INSERT-PICTURE.301-3726303.ja.html)コマンドを使って 4D Write Pro ドキュメントにピクチャーを挿入します。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: 印刷**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_Print.zip)<span id="16-0-13"></span><br />
[`WP PRINT`](https://doc.4d.com/WP-PRINT.301-3726306.ja.html)[`WP USE PAGE SETUP`](https://doc.4d.com/WP-USE-PAGE-SETUP.301-3726305.ja.html)コマンドを使った、4D Write Proドキュメントの印刷機能の紹介です。
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: プリエンプティブ実行**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_Thread_safety.zip)<span id="16-0-12"></span><br />
ユーザーインターフェースに関わらない 4D Write Pro コマンドはプリエンプティブに実行することができます。文書作成処理をコオペラティブおよびプリエンプティブに実行した場合の処理速度を比較します。<br />
参考：[プリエンプティブ4Dプロセス](https://doc.4d.com/Preemptive-4D-processes.300-4226849.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**4D Write Pro: ビューモード**](https://github.com/4D-JP/HDI/releases/download/16/HDI_4DWP_ViewProperties.zip)<span id="16-0-11"></span><br />
4D Write Pro ドキュメントの表示は複数の[ビューモードから選択](https://doc.4d.com/Using-a-4D-Write-Pro-area.200-3048088.ja.html#3052041)できます。
* <i class="fa fa-download" aria-hidden="true"></i> [**オブジェクト型フィールドより重複しないパスや値を取得する**](https://github.com/4D-JP/HDI/releases/download/16/HDI_DISTINCT_ATTRIBUTES.zip)<span id="16-0-10"></span><br />
オブジェクト型フィールドに含まれる重複しないパスや値を取得するためのコマンドを紹介します。<br />
[`DISTINCT ATTRIBUTE PATHS`](https://doc.4d.com/DISTINCT-ATTRIBUTE-PATHS.301-4227275.ja.html)[`DISTINCT ATTRIBUTE VALUES`](https://doc.4d.com/DISTINCT-ATTRIBUTE-VALUES.301-4227274.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**GET PICTURE FORMATS**](https://github.com/4D-JP/HDI/releases/download/16/HDI_GetPictureFormats.zip)<span id="16-0-9"></span><br />
新しく追加されたコマンド[`GET PICTURE FORMATS`](https://doc.4d.com/GET-PICTURE-FORMATS.301-4226801.ja.html)でピクチャーのファイル形式を取得することができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: カラム自動リサイズ**](https://github.com/4D-JP/HDI/releases/download/16/HDI_ListboxAutoResizeColumns.zip)<span id="16-0-8"></span><br />
リストボックスに追加された新しいプロパティ ”カラム自動リサイズ” の紹介です。<br />
参考：[カラムの自動リサイズの仕組み]()
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: リアルタイムな On Column Resize イベント**](https://github.com/4D-JP/HDI/releases/download/16/HDI_ListboxOnColumnResize.zip)<span id="16-0-7"></span><br />
フォームイベント[`On Column Resize`](https://doc.4d.com/Form-event.301-4227726.ja.html#3048676)がカラムリサイズ中にリアルタイムで発生するようになりました。
* <i class="fa fa-download" aria-hidden="true"></i> [**リストボックス: 行高さの指定**](https://github.com/4D-JP/HDI/releases/download/16/HDI_ListboxVariableRowHeight.zip)<span id="16-0-6"></span><br />
新しいコマンド[`LISTBOX SET ROW HEIGHT`](https://doc.4d.com/LISTBOX-SET-ROW-HEIGHT.301-4226911.ja.html)および[`LISTBOX Get row height`](https://doc.4d.com/LISTBOX-Get-row-height.301-4226910.ja.html)を使って、あるいは[行高さ配列](https://doc.4d.com/List-box-specific-properties.300-4253551.ja.html#3070590)を関連付けることで、リストボックスの各行の高さを個別に指定することができます。<br />
<span style="text-decoration: underline">※ この機能には 4D View Pro ライセンスが必要です。</span>
* <i class="fa fa-download" aria-hidden="true"></i> [**キャッシュ管理**](https://github.com/4D-JP/HDI/releases/download/16/HDI_ManageCache.zip)<span id="16-0-5"></span><br />
4D v16ではキャッシュの仕組みが刷新され、[キャッシュ管理](https://doc.4d.com/Cache-Management.201-4226165.ja.html)に役立つ次のコマンドが追加されました。これらのコマンドは64-bit版の4Dで提供されている内部アーキテクチャーに依存しているため、64-bit版でのみ正常に動作します。<br />
[`Cache info`](https://doc.4d.com/Cache-info.301-4226247.ja.html)[`Get cache size`](https://doc.4d.com/Get-cache-size.301-4226248.ja.html)[`SET CACHE SIZE`](https://doc.4d.com/SET-CACHE-SIZE.301-4226249.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**On Mouse Up イベント**](https://github.com/4D-JP/HDI/releases/download/16/HDI_Mouse_Up_Event.zip)<span id="16-0-4"></span><br />
ピクチャーエリアに新しく追加された[`On Mouse Up`](https://doc.4d.com/Form-event.301-4227726.ja.html#3047241)イベントの紹介です。
* <i class="fa fa-download" aria-hidden="true"></i> [**印刷設定の保存**](https://github.com/4D-JP/HDI/releases/download/16/HDI_SavePrintSettings.zip)<span id="16-0-3"></span><br />
4D Packプラグインのコマンドが標準コマンドになりました：[`Print settings to BLOB`](https://doc.4d.com/Print-settings-to-BLOB.301-4226252.ja.html)[`BLOB to print settings`](https://doc.4d.com/BLOB-to-print-settings.301-4226253.ja.html)
* <i class="fa fa-download" aria-hidden="true"></i> [**スレッドセーフ XML コマンド**](https://github.com/4D-JP/HDI/releases/download/16/HDI_ThreadSafe_XMLCommands.zip)<span id="16-0-2"></span><br />
DOM、SAX、XML で始まるコマンドはすべてスレッドセーフです。プリエンプティブ・プロセスで実行することによって、処理速度を上げることができます。
* <i class="fa fa-download" aria-hidden="true"></i> [**Webプロセスとプリエンプティブ実行**](https://github.com/4D-JP/HDI/releases/download/16/HDI_WebServerPreemptive.zip)<span id="16-0-1"></span><br />
Webサーバーおよび HTTPクライアント関連のコマンドはすべてスレッドセーフです。プリエンプティブ・プロセスで実行するためには ”プリエンプティブプロセスを使用” という新しいデータベース設定を有効にします。
* <i class="fa fa-download" aria-hidden="true"></i> [**Webサーバーと Google Charts**](https://github.com/4D-JP/HDI/releases/download/16/GoogleChart_4Dv16.zip)<span id="16-0-19"></span><br />
Webサーバーを使って Google Charts を利用する方法の紹介です。

