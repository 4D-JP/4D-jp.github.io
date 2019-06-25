---
layout: post
title: "XMLのインデントが除去されるわけではない"
date: 2019-06-26 12:00:00
categories: 仕様
tags: xml
---

``DOM Parse XML source``または``DOM Parse XML variable``でXML文書をインポートし，`` XML SET OPTION``で``XML indentation``オプションを``XML no indentation``に設定してから``DOM EXPORT TO VAR``または``DOM EXPORT TO FILE``を使用した場合，依存のXMLノードに施されているプリティプリントは除去されません。これは仕様です。インデントは，``DOM Create XML Ref``で作成したノードに適用されるオプションです。
