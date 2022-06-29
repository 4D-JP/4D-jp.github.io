---
layout: post
title: "Windows版のUUIDフォーマット"
date: 2022-06-18 15:00:00
categories: 仕様
tags: programming windows
version: 19
---

UUIDでは，16進数の`13`桁目および`17`桁目にそれぞれアルゴリズムとバリアント（変種）のコードが出力される場合があります。たとえばバージョン４のバリアント１であれば，`13`桁目が常に`4`，`17`桁目が`8`から`b`の値になります。

<i class="fa fa-external-link" aria-hidden="true"></i> [UUID](https://ja.wikipedia.org/wiki/UUID)

Windows版の4Dでは，UUIDのバージョンコードが`13`桁目ではなく`15`桁目に出現します。Mac版は慣例どおり`13`桁目です。言い換えるならば，値は確かにUUIDですが，フォーマットはMicrosoftのGUIDやCLSIDのものを踏襲しており，Macと比較すると，`HHHHHHHH-HHHH-HHHH`グループがそれぞれバイトスワップされたような格好になっています。これはプラットフォームの設計に由来する仕様です。
