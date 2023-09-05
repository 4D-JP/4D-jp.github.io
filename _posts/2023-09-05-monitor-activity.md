---
layout: fix
title: "時間を要するオペレーション"
date: 2023-09-05 08:00:00
categories: 仕様
tags: 19.x programming debugging
---

[特定のコマンド](https://doc.4d.com/4Dv20/4D/20.1/MESSAGES-OFF.301-6479957.ja.html)が処理に`3`秒以上を要する場合，デフォルトで進捗バーが自動的に表示されます。v18r3以降，同等のORDAオペレーションでも進捗バーが表示されるようになりました。

* dataClass.fromCollection()	
* entitySelection.toCollection()	
* dataClass.query()
* entitySelection.query()
* entitySelection.orderBy()	
* entitySelection.orderByFormula()	
* entitySelection.drop()	
* entitySelection.sum()	
* entitySelection.count()	
* entitySelection.min()	
* entitySelection.max()	
* entitySelection.distinct()	
* entitySelection.average()	

時間がかかっている処理に関する情報を収集したい場合，[`START MONITORING ACTIVITY`](https://doc.4d.com/4Dv20/4D/20.1/START-MONITORING-ACTIVITY.301-6480713.ja.html)に閾値とオペレーションのタイプを指定することができます。オペレーションのタイプは，ランゲージ・ネットワーク・データベースオペレーションの組み合わせで指定します。

オペレーションのタイプにランゲージを含めた場合，[`SET DATABASE PARAMETER`](https://doc.4d.com/4Dv20/4D/20.1/SET-DATABASE-PARAMETER.301-6480429.ja.html)と *Log command list* で監視するコマンドを指定することができます。その場合，コマンド番号をひとつずつセミコロン区切りで列挙するか，負のコマンド番号をセミコロン区切りで列挙することにより，監視の対象から除外することができます。
