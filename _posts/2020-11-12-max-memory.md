---
layout: post
title: "BLOBの最大サイズ"
date: 2020-11-10 12:00:00
categories: 仕様
tags: 18.x programming
---

テキスト・ピクチャ・BLOB・オブジェクト型を総称してBLOBと呼ぶことがありますが，上限サイズはそれぞれ違います。**テキスト**は，``4``GiBが4Dのメモリ管理によって扱える理論的な上限サイズであり，UTF-16コードポイント（文字）数でいえば，20億弱となります。**オブジェクト**の場合，テキスト型のプロパティには前述した制限が適用されますが，プロパティはいくらでも追加することができるので，単体としてのサイズは4Dのメモリ管理ではなく，システム側の制限によって上限サイズが決まります。**ピクチャ**も，4Dではなくシステム側の制限によって上限サイズが決まりますが，ネットワーク・ファイル・レコード・シリアルポートなどを介してストリーム入出力する場合，ストリームのサイズ上限（``2``GiB）によって制約されます。``WRITE PICTURE FILE``コマンドでエクスポートするのであれば，ストリームの限界サイズには制約されません。

v16では，キャッシュマネージャーが新しくなりましたが，技術的な制約により，種別（BLOB・ピクチャ・テキスト）毎の合計サイズが``2``GiBと決まっていました。つまり，BLOBの合計``2``GiB，ピクチャの合計``2``GiB，テキストの合計``2``GiBが上限でした。たとえば，``2``GiBのBLOBを``1``個，あるいは``200``MiBのBLOBを10個まで作成することができます。

V18では，テキスト・ピクチャ・BLOB・オブジェクト型の変数，プロパティ，および「レコードの外」に保存されるフィールドそれぞれに``2``GiBまでデータを代入できるようになりました，たとえば，``1``GiBのBLOBを``4``個（BLOB合計で``4``GiB）作成することができます。「レコードの中」保存されるフィールドの場合，レコード``1``個の最大サイズが``2``GiBなので，他のフィールドとの合計で``2``GiBを超えることはできません。

これらの数値はいずれも設計上の理論的な最大サイズです。快適に管理できる最大サイズは，オペレーションシステムにも左右されます。たとえば，Windows Server 2016以前の場合，数百``GiB``のキャッシュをフラッシュするのにかなりの時間を要することが知られています。その点，Windows Server 2019と4D v18の組み合わせであれば，パフォーマンスが劇的に向上します。