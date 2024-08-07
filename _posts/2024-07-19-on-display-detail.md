---
layout: fix
title: "リストボックス列とOn Display Detail"
date: 2024-07-18 08:00:00
categories: 仕様
tags: userinterface programming
---

リストボックス列特有のプロパティに関する[ドキュメント](https://doc.4d.com/4Dv20/4D/20.2/List-box-column-specific-properties.300-6750221.ja.html#:~:text=On%20Display%20Detail)には，データソースの値が「On Display Detail イベントで計算されます」と記述されていますが，これはリストボックスの列ではなく，リストボックス全体に対して発生するフォームイベントのことを指しています。

フォームエディターでリストボックスの列を選択した場合，プロパティリストにフォームイベントの*On Display Detail* は表示されません。プロジェクトモードであれば，*.4DForm* ファイルを編集することにより，列のレベルで*On Display Detail* イベントを有効にすることができ，オブジェクトメソッドで 処理できるようになりますが，これは正式にサポートされている仕様ではないことに留意してください。

<i class="fa fa-external-link" aria-hidden="true"></i> [リストボックス> リストボックス列 > フォームイベント](https://developer.4d.com/docs/ja/FormObjects/listboxOverview/#フォームイベント-1)

列のレベルで*On Display Detail* が発生し，バイナリモードではこれを無効にできないのは，一種の不具合（ACI0099570, ACI0100429）ですが，既存のアプリケーションに与える影響を考慮し，動作はそのまま残されています。プロジェクトモードでは，フォームのソースコードを書き換えることにより，プロパティリストでは選択することができないはずのイベントを強制的に有効化することができますが，そのようにしてドキュメントに明記されていない歴史的な動作を意図的に利用することは勧められていません。
