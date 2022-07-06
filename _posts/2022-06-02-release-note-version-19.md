---
layout: fix
title: "4D v19.3 修正リスト"
date: 2022-07-05 08:00:00
categories: 修正リスト
tags: "19.3"
build: 280807
version: "19.3"
permalink: /153/:slug/
---

**バージョン**: {{page.version}}  
**ビルド**: {{page.build}} 

* ACI0103036 Mac版のみ。クイックレポートエディターの印刷プレビューボタンがグレーアウト表示されました。Windows版では，XPSがシステムにインストールされていることが条件ですが，Macでは関係ないはずです。

* ACI0103003 `Compile project`から返される変数タイプの定数が間違っていました。ポインター型`40`・ピクチャ型`10`・テキスト型`33`のタイプがランゲージの定数と違います。ポインター型`23`・ピクチャ型`3`・テキスト型`2`が返されるべきです。

**注記**: テキスト型とピクチャ型はv11で内部的なフォーマットが変更されました。ポインター型はv16以降で新しいフォーマットが使用されています。コマンドはコンパイラーが内部的に使用している定数をそのまま返していました。修正により，`Is text` `Is pointer` `Is picture`と同じ値が返されるようになりました。

* ACI0102522 フランス語版のみ。ランゲージをフランス設定に変更した場合，`fk logs folder`が`kf dossier fichiers d'historique`に変換されますが，定数がメソッドエディターに認識されず，エラーが表示されました。アポストロフィが原因のようです。

**注記**: オートコンプリートでエラーが返されないように一部の定数名が変更されました。`Fichier historique des sauvegardes` `Fichier de configuration application` `Fichier dernière intégration historique` `Dossier des thèmes éditeur`

* ACI0103046 Mac版のみ。タブコントロールの上下どこをクリックしてもイベントが発生しました。

* ACI0101062 `CONFIRM`ダイアログの高さに余裕がありませんでした。

* ACI0100583 HTTPサーバーの停止と開始を繰り返した場合，TLSの証明書チェーンに同一の証明書が何度も追加されました。
