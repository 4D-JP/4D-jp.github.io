---
layout: technote
title: "4D World Tour 2019（２日目）"
author: Keisuke Miyako
date: 2019-05-29 00:00:00
permalink: /event/2019-05-29/
standalone: true
---

4D World Tour 2019（２日目）
<!--more-->

## 共有オブジェクトとストレージ
---

<i class="fa fa-external-link" aria-hidden="true"></i> [共有オブジェクト](https://doc.4d.com/4Dv17/4D/17.1/Shared-objects-and-shared-collections.300-4179447.ja.html)および<i class="fa fa-external-link" aria-hidden="true"></i> [ストレージ](https://doc.4d.com/4Dv17/4D/17.1/Storage.301-4179448.ja.html)は，インタープロセス変数に代わるもので，プロセス間で情報を共有するための新しいメカニズムです。

<i class="fa fa-download" aria-hidden="true"></i> [conf19-shared-object.4dbase.zip](https://github.com/4D-JP/event-world-tour-2019/releases/tag/shared-object-1.0)

## シグナル
---

<i class="fa fa-external-link" aria-hidden="true"></i> [シグナル](https://doc.4d.com/4Dv17R4/4D/17-R4/New-signal.301-4104310.ja.html)は``17 R4``から使用できるようになった特殊な共有オブジェクトです。

カスタムオブジェクトに``enqueue`` ``dequeue``といったメソッドを<i class="fa fa-external-link" aria-hidden="true"></i> [New formula](https://doc.4d.com/4Dv17R4/4D/17-R4/New-formula.301-4055155.ja.html)で追加し，内部的にシグナルを使用するようなコードを記述すれば，簡易的なメッセージキューが実装できます。

<i class="fa fa-download" aria-hidden="true"></i> [conf19-signal-queue.4dbase.zip
](https://github.com/4D-JP/event-world-tour-2019/releases/tag/signal-queue-1.1)

![図: メッセージキュー](https://user-images.githubusercontent.com/10509075/58517516-9d1e9880-81e6-11e9-8504-caf02af203d6.png){: .align-center}

＜ 図: メッセージキュー ＞
{: .text-center}

## オブジェクト型
---

### ORDAリストボックス

![図: ORDAリストボックス](https://user-images.githubusercontent.com/10509075/58543752-05976500-823b-11e9-90d5-e19aac95b393.png){: .align-center}

＜ 図: ORDAリストボックス ＞
{: .text-center}

![図: 友人の友人の友人・・・ ](https://user-images.githubusercontent.com/10509075/58543949-62931b00-823b-11e9-8f58-a13dc4f89175.png){: .align-center}

＜ 図: 友人の友人の友人・・・ ＞
{: .text-center}
