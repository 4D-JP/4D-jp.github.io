---
layout: technote
original_title: FullCalendar Integration
title: フルカレンダーの統合
author: Add Komoncharoensiri
position: Director of Technical Services, 4D Inc.
date: 2020-03-04 00:00:00
categories: テックノート
tags: development plugin
version: 17, v18
---

FullCalendarの統合の方法について。([原文](http://library.4d-japan.com/00_xfer/00_tn/)）
<!--more-->

## はじめに
---

4Dについて最も良いことの一つは、4Dアプリケーションで利用できる他のテクノロジーへの扉を開いてくれることです。オープソース・フレームワークの多くは、簡単に4Dアプリケーションに統合でき、アプリケーションには元々存在しない『失われた機能』を提供できることです。そうすることで、4Dデベロッパーは、調査と開発に費やす時間を削減でき、結果的にプロジェクトの納品は早くなります。このテクニカルノートでは、FullCalendar（フルカレンダー）というJavaScriptオープンソース・フレームワークとv15R5で書かれたアプリケーションの統合について説明しています。ここで取り上げたFullCalendarのバージョンは4.3.1です。

## FullCalendarについて
---

FullCalendar ( https://fullcalendar.io )は広く知られたJavaScriptオープンソース・フレームワークで、Webディスプレイ・エンジンを通じてインタラクティブなカレンダーを構築し、レンダリングするための1セットのJavaScript APIを提供します。FullCalendarはコミュニティー・ベースのオープンソース・プロジェクトで、2009年4月から出回っています。

その成功と安定性は、コミュニティー・メンバーの貢献によってもたらされています。FullCalendarについてのディスカッションのほとんど（サポートの質問も含め）StackOverflow ( https://stackoverflow.com/questions/tagged/fullcalendar )で見ることができます。

FullCalendarはMITライセンス下でライセンスを発行されています。より詳しいライセンス情報は、 https://fullcalendar.io/license へアクセスしてください。

## FullCalendar 4.3.1
---

このテクニカルノートで使用されているのはFullCalendar 4.3.1です。 https://fullcalendar.io からダウンロードできます。４つの異なる表示：month（月）、week（週）、day（日）があります。

![図１：月表示](/images/TechNote/fullcalendar/fullcalendar1.png){: .align-center}
![図２：週表示](/images/TechNote/fullcalendar/fullcalendar2.png){: .align-center}
![図３：日表示](/images/TechNote/fullcalendar/fullcalendar3.png){: .align-center}
![図４：リスト表示](/images/TechNote/fullcalendar/fullcalendar4.png){: .align-center}

フレームワークはいくつかのフォルダで構成されていて、そこにはJavaScript、CSSとJSONが含まれています。これらのファイルはフレームワークの中の機能の本質的なものになります。したがってこれらのいずれも外さないようにしてください。

![図5：月表示](/images/TechNote/fullcalendar/fullcalendar5.png){: .align-center}

## 統合
---

FullCalendarを統合するには複数のパートがあります：

### フレームワークのロケーション

Jsとパッケージ・フォルダ (FullCalendar)はDatabase Resourceフォルダの中に置かなければなりません。これにより、クライアント/サーバー・モードでアプリケーションを運用する時に、フレームワークが確実に各4Dリモートに配給されます。このテクニカルノート中のデモでは、jsとパッケージは”fullcalendar”という名称のフォルダ内に置かれます。

![図6：フレームワークのロケーション](/images/TechNote/fullcalendar/fullcalendar6.png){: .align-center}

### HTMLテンプレート

FullCalendarでそのレイアウトをレンダリングするためにHTMLファイルが必要です。HTMLテンプレートはjsとパッケージ・フォルダに関係したロケーションで作成されます。そこにはいくつかのパーツがあり、データを注入したり、修正したり、アクセスするのに必要です。

![図7：HTMLテンプレート](/images/TechNote/fullcalendar/fullcalendar7.png){: .align-center}

```
<body>
<div id='calendar-container'>
<div id='calendar'></div>
</div>
</body>

```

JavaScriptコードが含まれます：

```
var calendar; // global object
document.addEventListener('DOMContentLoaded', function() {
updateEventData('dayGridMonth', <!--#4DTEXT eventDefaultDate_t-->, []);
});
function change(what, val){
switch(what){
case 'view':
calendar.changeView(val);
break;
case 'date':
calendar.changeView(calendar.view.type, val);
break;
}
}
function getTitle(){
return calendar.view.title;
}
function updateEventData(dv, dd, ev){
var calendarEl = document.getElementById('calendar');
calendar = new FullCalendar.Calendar(calendarEl, {
plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
height: 'parent',
header: {
left: '', // Hide default header objects
center: '', // Hide default header objects
right: '' // Hide default header objects
},
defaultDate: dd,
defaultView: dv,
navLinks: false, // can click day/week names to navigate views
editable: true,
eventLimit: true, // allow "more" link when too many events
events: ev,
eventClick: function(info) {
$4d.waCallBackEventEdit(info.event.extendedProps, function(result){
info.event = result;
});
},
eventDrop: function(info) {
$4d.waCallBackEventUpdate(info.event.extendedProps, info.event.start, info.event.end, function(result){
info.event = result;
});
},
eventResize: function(info) {
$4d.waCallBackEventUpdate(info.event.extendedProps, info.event.start, info.event.end, function(result){
info.event = result;
});
}
});
calendar.render();
}
```

注意すべきは、<!- - #4DTEXT eventDefaultDate_t- - >は、ウェブエリアで実行されたhtmlファイルが開かれる前に、<span class="notranslate command">PROCESS 4D TAGS</span>コマンドを通じて実行されるということです。

JavaScript機能はわずかしかなく、コマンドの<span class="notranslate command">WA EXECUTE JAVASCRIPT FUNCTION</span>を通じて4Dメソッドからコールされます。

<strong>function change (what, val)</strong>

　1. FullCalendarに指示して、現行のディスプレイ表示を以下のいずれかの表示に変更します：davGridMonth (month)、timeGridWeek (week)、timeGridDay (day)もしくはlistWeek (list)。

　2. FullCalendarに表示日付を変更するように指示します。

<strong>function getTitle()</strong>

　　カレンダーから現在のタイトルを得る。

<strong>function updateEventData (dv, dd, ev)</strong>

　　新しいデフォルトの日付、デフォルトの表示とイベントデータでFullCalendarを再度レンダリングします。

どのカレンダーでも、最低３つのイベントがよく発生すると予想されます：
eventClick、eventDrop、eventResizeです。

ユーザーがイベント上でクリックした時に、FullCalendarは4Dにイベント情報を入力ウィンドウに表示するように指示します。このイベントは、イベントID情報を伴う"waCallBackEventEdit"という名前の4Dメソッドへのコールをトリガーします。

　　$4d.waCallBackEventEdit

イベント・ウィジェットを他の場所へドラッグ＆ドロップしたり、リサイズした時には、FullCalendarは新しい開始日と終了日を4Dに送り、イベント・レコードを更新します。これらの２つのイベントは、イベントID情報、新しい開始日、新しい終了日を伴う"waCallBackEventUpdate"という名前の4Dメソッドのコールをトリガーします。

　　$4d.waCallBackEventUpdate


### 4D プロジェクト・メソッド - Callback

以下のメソッドはcallbackメソッドです。これらはFullCalendar内部のイベントからトリガーされます。

メソッド：<span class="notranslate method">waCallBackEventEdit </span>

ユーザーがカレンダー内のイベントをクリックした時にこのメソッドがコールされます。イベント・レコードIDを含むオブジェクトがインプットとして渡されます。メソッドはレコードを見つけ、入力ウィンドウを開き、ユーザーはレコードを編集することができます。

```

// ----------------------------------------------------
// Method: waCallBackEventEdit
// Parameters
// $1 - extendedProps object
// ----------------------------------------------------

C_OBJECT($0;$1;$events_o;$event_o)
 If ($1.ID#Null)
&nbsp;&nbsp;$events_o<:=ds.Events.query(“ID = :1";$1.ID)
&nbsp;&nbsp;If($events_o.length>0)
&nbsp;&nbsp;$event_o:=$events_o[0]
&nbsp;&nbsp;editEvent($event_o)

&nbsp;&nbsp;C_TEXT($title_t;$start_t;$end_t)
&nbsp;&nbsp;$title_t:=String(Time($event_o.startTime);HH MM AM PM)+” "+
&nbsp;&nbsp;$event_o.subject
&nbsp;&nbsp;$start_t:=formatDate($event_o.startDate;”yyyy-mm-dd"+"T"+String(Time($event_o.startTime))
&nbsp;&nbsp;$end_t:=formatDate ($event_o.endDate;”yyyy-mm-dd"+"T"+String(Time($event_o.endTime))
&nbsp;&nbsp;$0:=New object(“title";$title_t;"start";$start_t;”end";$end_t;”extendedProps”;\
&nbsp;&nbsp;New object(“ID";String($event_o.ID)))
&nbsp;&nbsp;End if
End if
```

メソッド：<span class="notranslate method">waCallBackEventUpdate</span>

このメソッドは、ユーザがカレンダー内のイベントの移動（ドラッグ＆ドロップ）したり、リサイズした時にコールされます。イベント・レコードIDを含むオブジェクトは、第一パラメータとして渡されます。第二、第三の入力パラメータは、イベントの新しい開始日/時間と終了日/時間です。このメソッドは、イベントの４つのピースを更新します：startDate、startTime、endDateとendTimeです。

```

// ----------------------------------------------------
// Method: waCallBackEventUpdate
// Parameters
// $1 - Event object
// $2 - New start date
// $3 - New end date
// ----------------------------------------------------

C_OBJECT($0;$1;$events_o;$event_o;$status_o)
C_TEXT($2;$3)

If&nbsp;($1.ID#Null)
&nbsp;&nbsp;$events_o:=ds.Events.query(“ID = :1";$1.ID)
&nbsp;&nbsp;If($events_o.length>0)
&nbsp;&nbsp;$event_o:=$events_o[0]
&nbsp;&nbsp;$event_o.startDate:=Date($2)
&nbsp;&nbsp;$event_o.startTime:=gmtToTime($2)
&nbsp;&nbsp;$event_o.endDate:=Date($3)
&nbsp;&nbsp;$event_o.endTime:=gmtToTime($3)
&nbsp;&nbsp;$status_o:=$event_o.save()
&nbsp;&nbsp;If($status_o.success=False)
&nbsp;&nbsp;ALERT($status_o.statusText)
&nbsp;&nbsp;End if
&nbsp;End if
End if
```

### カレンダー・フォーム

下記のフォームには二つのメイン・セクション：ヘッダーとボディが含まれます。ヘッダー・セクションは4Dフォーム・オブジェクトを使って自然に構築されたタイトル、ツールバー・ボタン、ナビゲーション・ボタンが含まれます。FullCalendarはすでにこれらのアイテムを備えていますが、ユーザーインターフェイスに特定の外観や感触を構成するためにこれらを使う必要はなく、一つのデザインの選択肢です。

![図12：カレンダー・フォーム ヘッダーセクション](/images/TechNote/fullcalendar/fullcalendar12.png){: .align-center}

ボトム・セクションはひとつのWeb Areaで構成されています。プロセスされたHTMLファイルをロードするのに使用され、フォームの上にカレンダーをレンダリングします。

![図13：カレンダー・フォーム　ボトムセクション](/images/TechNote/fullcalendar/fullcalendar13.png){: .align-center}

### Web Areaプロパティ

Web Areaに対してFullCalendarとインタラクティブにするために、以下のプロパティーをWeb Areaに設定しなければなりません。

![図14：web areaプロパティー](/images/TechNote/fullcalendar/fullcalendar14.png){: .align-center}

“On End URL Loading”イベントをチェックします。

![図15：web area On End URL Loading ](/images/TechNote/fullcalendar/fullcalendar15.png){: .align-center}

Web Areaオブジェクト・メソッドは、”On End URL Loading”イベントがトリガーされた時に、updateCalendarという名称のプロジェクト・メソッドをコールします。

### リーダーによって検査される4Dプロジェクト・メソッド

以下はリーダーが検査すべき、主となるプロジェクト・メソッドのリストです。
 <span class="notranslate method"> - updateCalendar </span>
 <span class="notranslate method"> - createCalendarData </span>
 <span class="notranslate method"> - changeDate </span>
 <span class="notranslate method"> - changeView </span>
 <span class="notranslate method"> - updateTitle </span>
 <span class="notranslate method"> - applicationStartup </span>

## デモについて
---

デモ・アプリケーションはビルトイン・パスワード・システムを使っています。シングル・ユーザーとマルチ・ユーザー両方のアプリケーションでカレンダーの使い勝手をデモするために書かれました。そしてまた、カレンダーを共有したりアクセス許可したりするようにデザインされています。デザイナーとしてログインするためには、パスワードは”a”を使います。
他のユーザーに対してパスワードは設定していません。

マルチユーザー・アプリケーションでは、<span class="notranslate method">setupUserListForCalendar</span>という名のフック・メソッドが作成され、どのようなユーザー/パスワード・システム（ネイティブあるいはカスタム）とも動作できるようになります。このフックについてより知りたい場合は <span class="notranslate method">applicationStartup</span>という名称のメソッドの内部を見てください。

この実装には、３つの目に見えるプロジェクト・メソッドがあります。各メソッドは自身のプロセスの中で特定のウィンドウを開きます。

![図16：execute method ](/images/TechNote/fullcalendar/fullcalendar16.png){: .align-center}

メソッドの<span class="notranslate method">openCalendarMainWindow</span>は、カレントユーザーとカレンダーを共有する全ユーザーのリストを伴うカレンダー・ウィンドウを表示します。各ユーザーは関連する色を名前の次に表示します。

![図17：Main window ](/images/TechNote/fullcalendar/fullcalendar17.png){: .align-center}

各名前のチェックボックスは、カレンダー中のユーザーイベントの表示を切り替えます。

メソッドの<span class="notranslate method">openCalendarPermission</span>は、カレントユーザーのリストと関連する共有許可を表示します。このウィンドウで変更されたことは、ウィンドウが閉じられた時に自動的に保存されます。

![図18：calendar share permission ](/images/TechNote/fullcalendar/fullcalendar18.png){: .align-center}

メソッドの<span class="notranslate method">openCalendarWindow</span>は、カレンダーをカレントユーザーと共有する全ユーザーリスト無しにカレンダー・ウィンドウを表示します。

![図19：execute method ](/images/TechNote/fullcalendar/fullcalendar19.png){: .align-center}

## 追加の資料

FullCalendarドキュメント
・  https://fullcalendar.io/docs 

ORDA
・ https://doc.4d.com/4Dv17R5/4D/17-R5/ORDA.200-4163453.ja.html 

Web Area デザイン・リファレンス
・  https://doc.4.com/4Dv17R5/4D/17-R5/Web-areas.300-4163663.ja.html 

Web Area ランゲージ・リファレンス
・　 https://doc.4d.com/4Dv17R5/4D/17-R5/Web-Area.201-4127095.ja.html 



