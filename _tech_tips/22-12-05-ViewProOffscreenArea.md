---
layout: technote
title: "1メソッドで完結する4D View Proのオフスクリーン処理"
position: 20221205
date: 2022-12-05 00:00:00
categories: ヒント
tags: viewpro
version: 19
---

たった一つのメソッドで4D View Proのオフスクリーンエリアを利用して処理する例題です。

<!--more-->

## 例題の趣旨

4D View Proでオフスクリーン処理するときは、クラスを作成してクラスを利用して処理する方法が一番のお薦めです。
クラスを作成して、コールバックされたイベントで目的の処理を行います。
もちろん、クラスを作成するのですから、プロジェクトモードの利用が必須となります。

ところで、4D View Proでオフスクリーンを利用するには、コールバック先があれば良いので、実はクラスではなくても処理することは可能です。

これからご紹介する例題では、自分自身のメソッドをコールバック先とすることで、たった一つのメソッドで処理しています。
メソッドである自分自身をコールバック先にするので、クラスの利用はありません。
ですので、プロジェクトモードでなくても4D View Proのオフスクリーンを利用して処理することが可能です。

## 例題

例題は表計算ファイルにある、特定のレンジ（範囲）で指定されたセルの値を取得するメソッドに仕立てました。

コールバックされたイベントと、メソッドからの呼び出しを区別して、初期化をしている点に注目してください。
またドキュメントの読み込みと展開は、非同期で行われるので、タイマーイベントを利用して処理する点にも注目してください。

```4d

/*
	
	引数説明
	$params.path : 処理するファイルのパス
	$params.cells : 読み込むセルのレンジ情報
	
	呼出例
	$cells:=New collection
	$cells.push(New object("name"; "セルA1~C2"; "range"; New collection(0; 0; 3; 2)))
	$cells.push(New object("name"; "セルB4"; "range"; New collection(1; 3; 1; 1)))
	$name:=Select document(""; ""; "ファイルを選択してください"; Allow alias files)
	If (OK=1)
	   $result:=本メソッド(New object("path"; Document; "cells"; $cells))
	   ALERT(JSON Stringify($result; *))  //取り出したセルの情報を表示
	End if 
	
*/

#DECLARE($params : Object)->$result : Object

Case of 
	: (Count parameters#0)  // メソッドとして呼び出されたとき
		
		// 渡されたパラメーターに必須プロパティを追加してセット
		$params.timeout:=Choose(Num($params.timeout)=0; 10; $params.timeout)
		$params.autoQuit:=False  // On Timerイベントを利用するためには無効に設定
		$params.area:="ViewProArea"
		$params.onEvent:=Formula from string(Current method name)  //イベントを自分自身にコールバックして処理する
		
		// オフスクリーンエリアを開く
		$result:=VP Run offscreen area($params)
		
		
	: (FORM Event.code=On VP Ready)  // オフスクリーンで4D View Proエリアの準備ができた
		This.result:=New object  // 戻り値を初期化
		VP IMPORT DOCUMENT(This.area; This.path)  // ドキュメントを読み込む（非同期）
		This.isWaiting:=True  // 読み込み完了待機中
		SET TIMER(10)  // 読み込み完了のタイミングを見計らいタイマーを掛ける（要調整）
		
	: (FORM Event.code=On VP Range Changed)  // 表計算中の１つの計算項目が終了した
		If (This.isWaiting)  // 待機中？
			SET TIMER(10)  // 計算の完了を感知したのでタイマーを再スタートさせる
		End if 
		
	: (FORM Event.code=On Timer)  // ドキュメントが読み込まれたタイミング
		SET TIMER(0)  // タイマー終了
		This.isWaiting:=False  // 待機完了し処理に入ることを宣言
		//セルの値を取り出して戻り値にセット
		This.result.cells:=New collection
		For each ($row; This.cells)
			This.result.cells.push(New object("name"; $row.name; "values"; VP Get values(VP Cells(This.area; $row.range[0]; $row.range[1]; $row.range[2]; $row.range[3]))))
		End for each 
		CANCEL  // オフスクリーンを閉じる
		
End case 
```
