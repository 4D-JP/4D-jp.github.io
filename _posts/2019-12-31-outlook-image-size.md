---
layout: post
title: "4D Write Proメールの画像サイズ"
date: 2019-12-31 12:00:00
categories: 仕様 
tags: 17.x writepro
version: 17.x
---

4D Write Proに挿入された画像をリサイズし，MIMEエクスポートして送信したメールをOutlookで受信した場合，リサイズ前のサイズで画像が表示されました。オンライン版のOutlookをGoogle ChromeまたはFirefoxで表示した場合は問題ありません。これは仕様です。MIMEエクスポートされたHTMLのソースコードは，``style``属性にイメージのサイズが記述されていますが，Outlookはこれを無視するようです。Apple MailあるいはThunderbirdであれば，指定したとおりのサイズでインライン画像が表示されます。

```html
<img src="cid:20191218.152249.171" alt="banner" style="width:267.75pt;height:135pt"></p>
```
