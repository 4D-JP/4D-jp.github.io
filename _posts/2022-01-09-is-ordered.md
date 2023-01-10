---
layout: post
title: "エンティティセレクションの並び順"
date: 2023-01-09 12:00:00
categories: 仕様
tags: 19r8 orda programming userinterface
---

19r8以降，クライアント/サーバー版またはリモートデータストアのエンティティセレクションは`add()`や`minus()`を実行した場合，`entitySelection.isOrdered()`が常に`True`を返すようになりました。内部的にインデックスクエリと該当するセット演算を実行するようなクエリも同様です。エンティティセレクションの並び順が保持されることにより，さらに直感的なインターフェースがORDAで提供できるようになりました。
