---
layout: post
title: "HTMLテンプレートと改行コード"
date: 2019-12-03 10:00:00
categories: 仕様
tags: quickreport
---

クイックレポートのHTML出力には，カスタムテンプレートを使用することができます。テンプレートは，特殊な「タグ」（``PRCESS 4D TAGS``とは違うタグ）がコメント文で挿入されたHTMLテキストであり，整形されたレポートを出力するために使用されるものです。

<i class="fa fa-external-link" aria-hidden="true"></i> [``QR SET HTML TEMPLATE ``](https://doc.4d.com/4Dv17/4D/17.3/QR-SET-HTML-TEMPLATE.301-4621022.ja.html)

タグを使用してテキストを挿入した場合，テンプレート内の改行コード（``0x10``）は，すべて``<br />``タグに変換されます。``Document to text``コマンドでテンプレートをロードした場合，改行コードの数が違うために，HTML出力の体裁が変わってしまうことがあります。これは仕様です。クロスプラットフォームで改行の数を揃えるためには，``Document to text``コマンドで同じ改行オプションを指定するようにしてください。
