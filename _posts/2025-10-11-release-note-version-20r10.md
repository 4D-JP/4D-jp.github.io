---
layout: fix
title: "4D 20r10 修正リスト"
date: 2025-11-30 08:00:00
categories: 修正リスト
tags: 20r10
build: 100296
version: "20r10"
permalink: /2025/284/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0106026 *tool4d* で*Build4D* を使用してOEM版のサーバーアプリケーションをビルドした場合，途中でエラーが発生し，ライセンスフォルダーにライセンスがインストールされませんでした。

**注記**: 修正により，*tool4d* で[`Create deployment license`](https://developer.4d.com/docs/ja/commands/create-deployment-license)および`BUILD APPLICATION`が使用できるようになりました。

* ACI0106042 共有オブジェクトグループのコピー中にアクセス競合が発生する恐れがありました。

* ACI0106020 頻繁に`License info`を使用した場合，内部タイマープロセスがクラッシュすることがありました。

**注記**: コマンドの実行に伴い，メニューバーが更新されたいたことが関係しています。修正により，`License info`を実行してもメニューバーは更新されないようになりました。[`License info`](https://developer.4d.com/docs/ja/commands/license-info)はライセンスフォルダーの内容を毎回リロードするコマンドであり，頻繁に呼び出されることは想定されていません。ライセンスの使用状況を定期的に確認するのであれば，[`License usage`](https://developer.4d.com/docs/ja/commands/license-usage)を検討してください。

* ACI0106043 HTTPリクエストハンドラーの`IncomingMessage`オブジェクトの`urlQuery`プロパティの値に含まれる`%3D`が`=`にデコードされました。

* ACI0106040 macOS 26.1 Apple Silicon版のみ。4D Write Proエリアに対して擬似的にキーボードイベントを発生させた場合，アプリケーションがクラッシュする恐れがありました。

* ACI0106026 *tool4d* で*Build4D* を使用してOEM版のサーバーアプリケーションをビルドした場合，途中でエラーが発生し，ライセンスフォルダーにライセンスがインストールされませんでした。

**注記**: 修正により，*tool4d* で[`Create deployment license`](https://developer.4d.com/docs/ja/commands/create-deployment-license)および`BUILD APPLICATION`が使用できるようになりました。

* ACI0105906 WebSocketサーバーは`1`件のメッセージバンドル毎に1回しかワーカーをトリガーしませんでした。同時に`n+x`件のメッセージがキューに追加されても，`n+1`件しかワーカーのスタックが増えないため，最新のメッセージではなく，数分前に送信したメッセージが処理されることがありました。

* ACI0105933 インストーラーの英語版およびフランス語版の「お読みください（README）」ファイルに記載されたコンポーネントのダウンロードURL（GitHub）が正しくありませんでした。

* ACI0106023 `SMTPTransporter`でメールを送信した場合，メール本文中に含まれるピリオド記号（`.`）が失わることがありました。ACI0105850が修正されたことによる副作用のようです。

* ACI0105929 Mac版のみ。`entitySelection.slice()`で作成したエンティティセレクションに対し，オブジェクト型フィールドの並び替えを属性パスを指定せずに実行した場合，アプリケーションがクラッシュすることがありました。

* ACI0105920 デザインモードのウィンドウ（ツールボックスやエクスプローラーなど）をフルスクリーン表示している状態でプロジェクト依存関係を表示した場合，依存関係マネージャーのウィンドウが正しく表示されませんでした。

* ACI0105917 Windows版のみ。View Proスプレッドシートのピボットテーブルにフィールドをドラッグ＆ドロップすることができませんでした。

* ACI0105877 エクスプローラーで複製したクラスをごみ箱に移動してから再び複製した場合，複製したクラスとごみ箱にあったクラスの両方が「ホーム」タブに表示されました。

* ACI0105975 「アプリケーションについて」画面のリンク（法的な情報・著作権・世界の4D）が間違っていました。ホームページではなく，[世界中の4D](https://jp.4d.com/4d-around-the-world)にジャンプするべきです。

* ACI0105955 コンポーネントをビルドした場合，Appleの公証に必要な`CFBundlePackageType`キー（値: `BNDL`）が*Info.plist* ファイルに書き込まれませんでした。

**注記**: アプリケーション本体のビルドコマンドに加え，*Build4D* コンポーネントも[修正](https://github.com/4d/Build4D/commit/29d30e312e04302f2ba4c2141025f0778536bad2)されました。

* ACI0105908 `Choose`コマンドの引数としてクラスのプロパティを記述した場合，メソッドエディターのヘルプTipsに間違った型が表示されました。

* ACI0105901 エクスプローラーでテーブルを選択した場合，すぐにプレビューが表示されませんでした。エクスプローラーのウィンドウを背面に移動してから再び最前面に移動すれば，プレビューが表示されます。

* ACI0105850 メールに特定の文字が含まれる場合，[`MAIL Convert to MIME`](https://developer.4d.com/docs/ja/commands/mail-convert-to-mime)または[`MAIL Convert from MIME`](https://developer.4d.com/docs/ja/commands/mail-convert-from-mime)で本文を正しく変換できないことがありました。

* ACI0105946 ASTインタープリターモードでは，コンパイル済みコンポーネントメソッドに対して`Call chain`を使用した場合，正しい呼び出し連鎖が返されないことがありました。

* ACI0105944 ASTインタープリターモードでは，`Call chain`から`formula`プロパティが返されないことがありました。