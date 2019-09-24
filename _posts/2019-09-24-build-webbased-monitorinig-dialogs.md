---
layout: post
title: Webベースのモニタリングダイアログを１ステップずつ構築する
date: 2019-09-17 00:00:00
categories: ブログ
tags: 18.x 17r6
author: Intissar Elmezrouai
---

![serverAdmin-1024x512](/images/blog/09/9_16/serverAdmin-1024x512.jpg)

4D Server管理ウィンドウをWebインターフェイスを使って再作成したい？リモートデスクトップを使うか、あるいは4D Clientライセンスを使って、サーバールームへ行かなくても4D Serverに何が起こっているかをチェックしたい？これからはウェブ経由で4D Serverの主なパラメータ（例：メモリ使用量、ドライブ空き容量、ユーザー、プロセス、そしてリアルタイムモニターまで）を監視することができます。

このブログでは、様々なRリリースで4Dが配布してきたコマンド群を体験して、あなた自身のWebベースのサーバー管理ダイアログを構築します。さらに4Dスペインの技術マネージャー（アンジェロ・カロプレーセ）は、あなたのアプリケーションにもすぐ使える完全なコンポーネントを提供してくれました。

{:.download}
[カスタム管理ダイアログ](https://github.com/4D-JP/HDI/releases/download/17r6/ServerAdministrator_JA.zip
) 

![adminWeb-1024x541](/images/blog/09/9_16/adminWeb-1024x541.png)

![adminPhone-576x1024](/images/blog/09/9_16/adminPhone-576x1024.png)

これらのような管理ダイアログが可能なのは、4D v16とそれ以前から存在するコマンドのおかげです。

* <span class="no translate command">ストラクチャー・ファイル</span>
* <span class="no translate command">データファイル、ログファイル</span>
* <span class="no translate command">アプリケーションのバージョン</span>
* <span class="no translate command">GET ACTIVITY SNAPSHOT</span>
* <span class="no translate command">VOLUME ATTRIBUTES</span>
* <span class="no translate command">Get 4D file</span>
* <span class="no translate command">GET MEMORY STATISTICS</span>
* <span class="no translate command">GET ACTIVITY SNAPSHOT</span>

しかし、管理情報を使う他のコマンドもまた存在します。

<a href=“https://blog.4d.com/retrieve-the-license-information-by-programming/”><span class="notranslate command">Get license info</span></a> : 有効なライセンスについての詳細な情報を提供するオブジェクトを返します。
<a href=“https://blog.4d.com/enhancement-of-get-process-activity-command/“><span class="notranslate command">Get process activity</span></a> : 指定された時間に接続されているユーザー・セッション、または関連する実行中のプロセス（あるいはその両方）のスナップショットを返します。
<a href=“https://blog.4d.com/get-machine-hardware-information-2/“><span class="notranslate command">Get system info</span></a> : オペレーティングシステムに関する情報、および（ローカルまたはリモートの）マシン上のシステムハードウェアとソフトウェアの特性を含むオブジェクトを返します。
<a href=“https://blog.4d.com/new-command-to-get-web-server-information/“><span class="notranslate command">Web Get server info</span></a> : 4D Web Serverの現在のセッションについて、詳細なランタイム情報を含むオブジェクトを返します。

そして最後に、<a href=“https://blog.4d.com/new-server-administration-commands/“>このブログ</a>では、あなた自身の管理インターフェイスを作成できる4D v17 R4のコマンドを紹介しています。

上記のコンポーネントをダウンロードして、必要に応じてカスタマイズし、テイラーメイド（誂え）体験をお楽しみください！
