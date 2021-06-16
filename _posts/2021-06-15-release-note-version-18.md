---
layout: fix
title: "4D v18.5 修正リスト"
date: 2021-06-15 08:00:00
categories: 修正リスト
tags: "18.5"
build: 266755
version: 18.5
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}}  

* ACI0102066 暗号化されたデータファイルを「レコードを強制更新」または「アドレステーブルを圧縮」モードでメンテナンスした場合，再起動後に「問題が検出されました（テーブルは暗号化されていますが一部のBLOBは暗号化されていません）」というエラーが返されました。

* ACI0102026 `entitySelection.drop()`でテーブルの全レコードを削除しようとした場合，デッドロック状態に陥ることがありました。内部的なセマフォの順序が良くないため，テーブルに対して別のスレッドが同時にアクセスした場合，問題が発生する可能性があります。
 
* ACI0102048 データファイルの暗号化をMSCで解除した場合，そのデータファイルをv18.4または18r6で開くことができませんでした。

**注記**: v18.4/18r6の内部データファイル暗号化バージョンは「v3」，v18.5/19は「v4」です。v4の暗号化データファイルをv3で開くことはできません。そのようなデータファイルを開くためには，v4に対応したバージョンのMSCで暗号化を解除する必要があります。MSCで暗号化を解除すると，内部データファイル暗号化バージョンが「v3」に戻されます。

* ACI0102038 暗号化されたデータファイルをMSCで検証した場合，保存オプションが「データファイル内」に設定されたBLOBフィールドが実際には暗号化されていなくても，エラーが検出されませんでした。

* ACI0101992 暗号化されたデータファイルをMSCで修復した後，アプリケーションの開始時に「プライマリーキーの問題が検出されました」というメッセージが表示されました。

**注記**: 修復されたデータファイルは，初回の起動時にプライマリーキーの検証が自動的に実行されるようになっていたことが関係しています。修正により，圧縮・修復・暗号化されたデータファイルのプライマリーキーを初回の起動時に検証する必要はなくなりました。

* ACI0101983 保存オプションが「データファイル内」に設定されたテキスト・ピクチャ・オブジェクト・BLOB型のフィールドは暗号化されませんでした。
 
* ACI0101991 階層リストボックスの選択行を`shift`キーと上下矢印の操作で増減することができませんでした。ACI0101729およびACI0101725が修正されたことによる副作用です。
 
* ACI0101729 `shift`キーを押しながら上下矢印キーを入力してリストボックス行の選択範囲を拡大しようとした場合，範囲が移動するだけで，常に一定の行数が選択されました。

* ACI0101725 `LISTBOX SELECT ROW`と`lk remove from selection`でリストボックス行の選択を解除した後，`shift`キーを押しながらクリックまたは上下矢印キーの操作で選択範囲を変更しようとした場合，コマンドで選択を解除した行が選択の起点となりました。
 
* ACI0101900 `application/pdf`形式のファイルが添付されたメールを`MAIL Convert from MIME`で処理した場合，添付ファイルが失われてました。

* ACI0101744 4D WriteドキュメントをWrite Proに変換した場合，スタイルが正しく適用されないことがありました。

**注記**: 4D Writeでは段落ではなく文字のスタイルとして「標準（Normal）」スタイルが定義されていることがありました。Write Proでは，既定の段落スタイルとして「標準」スタイルが定義されています。修正により，インポートした`.4W7`ドキュメントの「標準」スタイルが文字に対して定義されていたとしても，段落に適用されるようになりました。

* ACI0101766 Windows版のみ。Write Proドキュメントから生成したマルチスタイルテキストに標準テキストを連結してテキスト入力エリアに表示した場合，アプリケーションがクラッシュすることがありました。

**注記**: 問題は修正されましたが，フォントファミリー名「Helvetica Neue LT Std 57 Condensed」はGDIの制限を超えているため，Windows版ではサポートされません。