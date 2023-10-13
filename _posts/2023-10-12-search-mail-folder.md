---
layout: fix
title: "メールフォルダーの検索"
date: 2023-10-11 08:00:00
categories: 仕様
tags: netkit 20.x
---

*NetKit* の[`Office365..mail.getFolderList()`](https://github.com/4d/4D-NetKit#office365mailgetfolderlist)関数は，`search`オプションをサポートしていますが，[メールフォルダーの検索はできません](https://learn.microsoft.com/en-us/graph/search-query-parameter?tabs=http#using-search-on-message-collections)。これは仕様です。`search`オプションをサポートしているのは`directoryObject`タイプのエンティティですが，メールフォルダーはそれに該当しないためです。