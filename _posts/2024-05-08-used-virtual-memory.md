---
layout: fix
title: "使用中仮想メモリとは"
date: 2024-05-08 08:00:00
categories: 仕様
tags: windows memory
---

[`GET MEMORY STATISTICS`](https://doc.4d.com/4Dv20/4D/20.3/GET-MEMORY-STATISTICS.301-6866698.ja.html)と[`Cache info`](https://doc.4d.com/4Dv20/4D/20.3/Cache-info.301-6866695.ja.html)返される情報，およびランタイムエラーに表示されている「使用中仮想メモリ」の値は，Windowsの場合，[`MEMORYSTATUSEX`](https://learn.microsoft.com/en-us/windows/win32/api/sysinfoapi/ns-sysinfoapi-memorystatusex)構造体の`ullTotalVirtual`フィールドから`ullAvailVirtual`を差し引いた値です。「仮想アドレス空間のユーザーモード部分で予約あるいはコミットされている仮想メモリの量」なので，厳密な意味で「使用中」ではないかもしれません（PowerShellの`Process.VirtualMemorySize64`では，この値が*Allocated memory* と表現されています）。
