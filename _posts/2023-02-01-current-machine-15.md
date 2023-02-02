---
layout: post
title: "Current machineは15文字まで"
date: 2023-02-01 09:00:00
categories: 仕様
tags: windows network
---

Windows版で`Current machine`から返される文字列は`15`文字が限度となっています。これは仕様です。コマンドはローカルコンピューターのNetBIOS名を返すようになっているためです。

<i class="fa fa-external-link" aria-hidden="true"></i> [GetComputerNameW](https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-getcomputernamew)
