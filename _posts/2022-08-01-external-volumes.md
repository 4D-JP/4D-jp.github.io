---
layout: post
title: "管理者はネットワークドライブにアクセスできない"
date: 2022-08-01 08:00:00
categories: 仕様
tags: 19.x windows network
---

Windows版の4Dを管理者権限で起動した場合，`VOLUME LIST`はネットワーク接続された外部ボリュームを返しません。これは仕様です。

<i class="fa fa-external-link" aria-hidden="true"></i> [マップされたドライブは管理者特権のプロンプトから使用できません](https://docs.microsoft.com/en-US/troubleshoot/windows-client/networking/mapped-drives-not-available-from-elevated-command)
