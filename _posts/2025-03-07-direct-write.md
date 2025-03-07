---
layout: fix
title: "数字など丸みのある文字の曲線部分が欠けてしまう"
date: 2025-03-06 08:00:00
categories: 仕様
tags: windows userinterface projectmode
---

4D 20でストラクチャファイルをプロジェクトモードに変換した場合，Windows版の過去バージョンで作成したフォームの入力エリアに表示した文字の末端（特に数字など丸みのある文字の曲線部分）が欠けてしまうことがあります。

#### 関連記事

* [新しいテキストレンダリング](https://4d-jp.github.io/2022/02/28/text-api/)
* [Direct2Dを有効にするべき理由](https://4d-jp.github.io/2024/05/30/direct2d/)

4Dは，19r4以降，高解像度ディスプレイに対応しています。これはGDIスケーリング（画像や文字サイズを引き伸ばすことで高解像度ディスプレイに対応する便宜的な仕組み）ではなく，テキストのレンダリングをGDIからDirectWriteに移行することによって実現した本格的な対応です。

#### 関連記事

* [Write ProエリアはDirect2Dが必要](https://4d-jp.github.io/2022/06/28/write-pro-needs-d2d/)
* [旧式プリントレイヤー](https://4d-jp.github.io/2022/02/28/old-print-layer/)
* [GDIスケーリング論考](https://4d-jp.github.io/2020/08/03/gdi-scaling/)

GDIを使用していた過去バージョンで作成されたフォームを4D 20のDirectWriteモードで表示した場合，まったく同じようにテキストがレンダリングされることはありません。

バイナリモードには互換性オプションの「[フォームでのテキストレンダリングではDirectWriteを使用する](https://doc.4d.com/4Dv20/4D/20.2/Compatibility-page.300-6750362.ja.html)」が用意されていますが，プロジェクトモードではこのオプションが表示されません。過去バージョンで作成されたバイナリモードのフォームを4D 20に変換した場合，このオプションを有効化することは任意となっていますが，バイナリモードのフォームを4D 20でプロジェクトモードに変換した場合，このオプションは強制的に有効化されます。アップグレードの原則は「互換性を重視」ですが，プロジェクトモード変換の原則は「現行の仕様に移行」だからです。

もし，どうしても過去バージョンと同じようなテキストのレンダリングを希望し，高解像度ディスプレ対応を諦めても良いのであれば，直接，*settings.4DSettings* ファイルを編集することができます。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<preferences stamp="…">
  <com.4d>
	<database>
	  <misc win_form_text_directwrite="false"/>
	</database>
  </com.4d>
</preferences>
```

ただし，4D 19 R4以降は全体として「高解像度ディスプレイ対応アプリケーション」なので，高解像度ディスプレイではフォームの表示が不自然になるかもしれません。その場合，4D.exeと同階層の*Resources* フォルダーにある*info.plist* ファイルを編集し，高解像度ディスプレイ未対応当時の動作を強制することができます。

```xml
<key>WinDPIAwareness</key>
<string>0</string>
```

いずれも暫定的な措置であり，GDIモードが将来的にサポートされるわけではありません。過去バージョンで作成したフォームの入力エリアに表示した文字の末端（特に数字など丸みのある文字の曲線部分）が欠けてしまう場合，そのような入力エリアのサイズを調整することが勧められています。

## ケーススタディ

それぞれのモードでテキスト入力に数字を表示しています。プロパティは下記のとおりです。

* フォント名: `ＭＳ Ｐゴシック`
* フォントサイズ: `13`
  
### GDIモード

<img width="144" alt="gdi" src="https://github.com/user-attachments/assets/3a1299b9-b19a-4c70-aa36-85b0733299e9" />

### DirectWriteモード

<img width="144" alt="d2" src="https://github.com/user-attachments/assets/b00e4fc5-263d-471a-aecb-a30e21d8c449" />

`6`および`9`の左側が欠けていることに気づきます。

#### 修正案①

スタイルシートのフォントサイズを変更します。オブジェクトの高さは自動的に調整されます。

* フォントサイズ: `16`

<img width="144" alt="" src="https://github.com/user-attachments/assets/933aa1f9-171b-46c8-b0f5-b01881c18625" />

* フォントサイズ: `20`

<img width="144" alt="" src="https://github.com/user-attachments/assets/3a249f9a-d8cb-404c-af96-c35ee98aff0b" />

#### 修正案②

スタイルシートのフォント名を`ＭＳ Ｐゴシック`ではなく，よりモダンなものに変更します。

* フォント名: `游ゴシック`

<img width="144" alt="" src="https://github.com/user-attachments/assets/664079f8-3a6a-43b5-92ac-dfe2e517f290" />

* システムフォント

<img width="144" alt="" src="https://github.com/user-attachments/assets/8d5282a9-ea24-4123-a304-480b3b5fa434" />