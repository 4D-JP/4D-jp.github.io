---
layout: post
title: "ロックされたファイルに対するアクセス"
date: 2022-11-29 12:00:00
categories: 仕様
tags: 19r7 system
---

他のアプリケーションによって開かれているなどの理由で，ロックされているファイルを19r7で削除・移動・リネームしようとした場合，プラットフォーム共通のエラーコードの`5`が返されるようになりました。これは新しい仕様です。19r6以前は，操作の条件により，`602` `604` `609`などのエラーコードが返されました。