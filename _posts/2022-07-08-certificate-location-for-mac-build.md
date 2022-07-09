---
layout: post
title: "ビルドアプリケーションのTLS証明書"
date: 2022-07-08 08:00:00
categories: 仕様
tags: 19.x web http security
---

Mac版のビルドアプリケーションをネットワーク経由で配付するためには，アプリをコード署名する必要があります。アプリの構成ファイルを署名後に変更すると，コード署名が無効となるので，アプリの中に暫定的なファイルを含めることは推奨されていません。これにはWebサーバーのTLS証明書も含まれます。証明書には，有効期限があるためです。Mac版では，[データベースフォルダー内の証明書](https://developer.4d.com/docs/ja/Admin/tls.html)を暗黙的に使用するのではなく，新しい`WEB Server`コマンドを使用し，[`certificatesFolder`](https://developer.4d.com/docs/ja/API/WebServerClass.html#certificatefolder)でアプリ外のパスを指定するようにしてください。
