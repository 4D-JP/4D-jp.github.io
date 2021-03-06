---
layout: fix
title: "4D v17.4 Hotfix 2 修正リスト"
date: 2020-08-31 08:00:00
categories: 修正リスト
tags: 17.4 hotfix  
build: 255151
version: 17.4 Hotfix 2
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0101074 フォーミュラエディターで入力した``Char(13)``のようなフォーミュラをWrite Proドキュメントに挿入した後，表示を値から参照に切り替えて値に戻した場合，アプリケーションがクラッシュしました。``Current date``のようなフォーミュラであれば問題ありません。

* ACI0100981 Write Proに改行だけを返すメソッドが数式として改行の直前に挿入されている場合，フッターで``This.pageCount``というフォーミュラを評価すると，アプリケーションがクラッシュしました。

* ACI0100869 クライアント/サーバー版のみ。属性パスを指定して``entity.toObject()``を実行した場合，返されるオブジェクトにリレーション属性が含まれないことがありました。

* ACI0100696 Windows版のみ。画面の下方で日本語を入力した場合，変換プログラムの候補リストが入力中の文字列を覆い隠してしまいました。ポップアップがテキスト入力エリアの（上端ではなく）下端から上に向かって描画されるためです。

* ACI0099670 Mac 64ビット版のみ。``SET WINDOW RECT``でウィンドウをリサイズした場合，プラグインエリアが正しく再描画されませんでした。プラグインに渡されるクリッピング領域がコマンドの実行後に更新されないためです。

* ACI0100727 v16からv17に変換されたストラクチャの場合，フォームエディターのプロパティリストでチェックボックスの標準アクションを``accept``に設定することができました。

* ACI0100681 特定の条件が揃った場合，SQLの``LEFT OUTER JOIN``を実行すると，同じレコードが``2``個，返されました。

* ACI0100649 Mac 64ビット版のみ。プラグインSDKのエントリーポイント``PA_GetKey``は，``option``キーの補助を利用して入力したアクセント文字を返しませんでした。U.S.キーボード配列の場合，``option``キーを押しながら``u`` ``e`` ``i`` のようなキーを押すことにより，結合用のアクセント記号を入力することができますが，``PA_GetKey``は，そのような文字に対して``0``を返し，続けて入力されたキーをアクセント記号がない文字のコードを返しました。

* ACI0100781 ``MSG_Extract``で取り出した添付ファイル名のアポストロフィ記号がデルタ（``∆``）記号になりました。

* ACI0100846 Windows版のみ。地域と言語が英語（シンガポール）に設定されている場合，日付フォーマット（``System Date abbrievated``）が正しくありませんでした。``DD/MM/YY``ではなく``MM/DD/YY``で表示されました。

* ACI0100809 クライアント/サーバー版のみ。IPアドレスの「許可/拒否リスト」のエントリーにクライアントの「拒否」アドレスと「すべて許可」を組み合わせた設定を入力した場合，拒否」に設定されているアドレスからクライアントを接続することができました。たとえば

| 許可/拒否 | アドレス |
| - | - |
| 拒否 | 192.168.2.2 |
| 拒否 | 192.168.2.8 |
| 許可 | * |

から``1``行目（サーバーのローカルIPアドレス）を削除した場合，``1``行目に繰り上がった「拒否」アドレス（クライアントのIPアドレス）から接続することができました。

**注記**: 「すべて許可」の前に拒否アドレスが指定されていれば，そのアドレスは許可の例外となります。拒否アドレスの前に「すべて許可」が指定されていれば，拒否アドレスの指定は無効となります。これが本来の仕様です。修正前，常にサーバーのローカルIPアドレスが「許可/拒否リスト」のIPアドレスと照合されていました。

* ACI0100882 4D WriteプラグインをWrite Proに変換した場合，スタイルシート名のアクセント文字（``Ä`` ``Ö`` ``Ü`` ``ß``）およびアンダースコア記号（``_``）が失われました。ACI0100702と同じ問題です。
