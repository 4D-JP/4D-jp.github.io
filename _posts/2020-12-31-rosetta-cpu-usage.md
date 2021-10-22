---
layout: post
title: "RosettaでCPU使用率は得られない"
date: 2020-12-31 12:00:00
categories: 仕様
tags: programming mac
---

Apple Silicon版の:macOS Big Surで`Get application info`を実行した場合，`cpuUsage`プロパティに`-1`が返されます。これは仕様です。コマンドは内部的に[thread_info](https://developer.apple.com/documentation/kernel/1418630-thread_info)を使用していますが，Rosettaで動作しているIntelアプリケーションには，CPUの情報が返されないようです。
