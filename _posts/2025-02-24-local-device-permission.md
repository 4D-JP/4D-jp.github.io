---
layout: fix
title: "ローカルネットワーク上のデバイスを見つけることを許可しますか"
date: 2025-02-24 08:00:00
categories: 仕様
tags: mac
---

macOS 15 Sequoia以降，「プライバシーとセキュリティ」設定でローカルネットワークへのアクセスを許可するアプリを指定できるようになりました。そのため，4Dまたは4D Serverを起動した後，「ローカルネットワーク上 のデバイスを見つけることを許可しますか?」というアラート画面が表示されることがあります。

<img src="https://github.com/user-attachments/assets/18b0d554-1066-4a42-b59e-d0cf2a104807" width="260" height="auto" />

ローカルネットワーク操作とは，ブロードキャスト機能を有するネットワークインタフェースに関連づけられたインターネットプロトコルネットワークと定義されています。Wi-FiおよびEthernetが含まれ，携帯電話の回線を利用してインターネットに接続するワイヤレス通信網（無線広域通信網）およびVPNは含まれません。マルチキャストアドレス（224.0.0.0/4, ff00::/8）およびIPv4のブロードキャストアドレス（255.255.255.255）もローカルネットワークアドレスです。ローカルネットワーク上のDNSサーバーやプロキシに対するアクセスは除外されます。「ローカルネットワーク上 のデバイスを見つけること」が目的とは限りません。

4Dの場合，Webサーバー（TCP待ち受け）はローカルネットワーク操作に該当しないので，許可は必要ありません。4D Serverの公開と発見（いずれもUDP）は許可が必要です。ローカルネットワーク上の4D Serverに対するアクセス（ServerNet=TCPまたはQUIC=UDP）も許可が必要です。Webエリアの表示に許可は必要ありません。

<i class="fa fa-external-link" aria-hidden="true"></i> [TN3179: Understanding local network privacy](https://developer.apple.com/documentation/technotes/tn3179-understanding-local-network-privacy/)