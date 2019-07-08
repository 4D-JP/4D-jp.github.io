---
layout: post
title: "クライアント/サーバー版ORDAの速度アップ"
date: 2019-07-08 12:00:00
categories: リリースノート
tags: 17r5 orda
---

4D RemoteのORDA（ランゲージまたはリストボックス）の裏側では，RESTリクエストがサーバーに送られています。17r5では，クライアント側からのRESTリクエストを最適化することにより，ORDAのパフォーマンスを向上させるための努力が払われました。

公式ブログ記事（英文）で紹介されているように，17r5のORDAは，17r4との比較で200-300%（LAN）または3000%（WAN）のスピードが期待できます。リストボックスの場合，従来のカレントセレクション型との比較でTCPフレーム数が98.8%，転送バイトサイズが98.7%, 処理時間は88%ほど削減できるかもしれません。

<i class="fa fa-external-link" aria-hidden="true"></i> [Use ORDA to boost performance in Client/Server mode](https://blog.4d.com/use-orda-to-boost-performance-in-client-server-mode/)

具体的には，データクラス，そのデータクラスと階層に制限なくリレーションで結ばれているデータクラスに対するアクセスの仕方に修正が加えられました。オブジェクト型フィールドやピクチャに対するRESTアクセスは修正の対象外となっています。

17r4までは，エンティティにアクセスするようなコードがクライアント側で実行されるたびにRESTリクエストがサーバーに送信されていました。また，サーバーからは，データクラスの属性がすべて返されていました。リレーション属性を介して別のデータクラスのエンティティにアクセスするようなコードでも，同じようにRESTリクエストが発生しました。

17r5以降，同一のエンティティセレクションに属する複数のエンティティに対するアクセスが検出されると，コードが解析され，必要な属性だけがまとめてリクエストされるようになりました。

17r5以降，RESTリクエストの最適化は，デフォルトで有効にされており，エンティティセレクション型のリストボックスでも自動的に働くようになっています。たとえば，スクロール操作では，インタフェースに表示されているエンティティ属性だけがサーバーからまとめて返されます。

フォーミュラ等でエンティティをロードする場合，あるいはエンティティを更新する場合，最初の１個はすべての属性がロードされ，後続の処理では，実際に使用した属性だけがリクエストされます。

クライアント側のプロセスからメインのデータストア（``ds``）にアクセスする場合，RESTリクエストの最適化コンテキスト(後述)を使用することができます。このコンテキストは，サーバーとの接続が中断されない限り，有効です。

#### 典型的な例

ここでは``For each``ブロックが使用されていますが，エンティティセレクションからエンティティを取り出すようなコードであれば，どのような処理でも最適化の対象となります。

```
$sel2:=$ds.Employee.query("firstname = ab@")

For each ($e;$sel2)
    $s:=$e.firstname+" "+$e.lastname+" works for "+$e.employer.name
End for each
```

##### ネットワーク・トラフィック（17r4）

``$sel2:=$ds.Employee.query("firstname = ab@")``

```
127.0.0.1:8044/rest/Employee?$query='%7B%22model%22:%22Employee%22,%22queryItems%22:%5B%7B%22tokenType%22:%22simpleCompWithEm%22,%22attName%22:%22firstname%22,%22emName%22:%22Employee%22,%22comparaison%22:13,%22instance%22:0,%22checkForNull%22:false,%22value%22:%22ab@%22,%22diacritical%22:false%7D%5D%7D'&$method='entityset'&$progress4Dinfo='5CB39501D9854659885585A0E40A1127'&$top='80'
```

**注記**：エンティティセレクションのエンティティは，80個（既定値）ずつ返されます。

``$e.employer.name`` 

**注記**：Employee.employerはCompanyデータクラスです。

```
127.0.0.1:8044/rest/Company(2))
```

```js
{__entityModel:Company,__KEY:2,__TIMESTAMP:2018-04-25T14:42:18.351Z,__STAMP:0,ID:2,name:Charlie Echo Animations,creationDate:0!0!0,revenues:82000000,extra:{a:false},employees:{__deferred:{uri:/rest/Company(2)/employees?$expand=employees}}}
```

**ポイント**：エンティティの属性がすべて返されます。

``For each``ループ（２回目以降）

```
127.0.0.1:8044/rest/Employee(309)
```

```js
 {__entityModel:Employee,__KEY:309,__TIMESTAMP:2018-10-11T15:16:37.727Z,__STAMP:0,ID:309,firstname:Abarrane,lastname:BIASAL,salary:30709,birthdate:0!0!0,woman:true,managerID:307,employerID:2,photo:null,extra:null,heure:0,manager:{__deferred:{uri:/rest/Employee(307),__KEY:307}},employer:{__deferred:{uri:/rest/Company(2),__KEY:2}},directReports:{__deferred:{uri:/rest/Employee(309)/directReports?$expand=directReports}}}
```

**ポイント**：エンティティ毎にRESTリクエストが発生します。

##### ネットワーク・トラフィック（17r5）

``$sel2:=$ds.Employee.query("firstname = ab@")``

```
127.0.0.1:8044/rest/Employee?$query='%7B%22model%22:%22Employee%22,%22queryItems%22:%5B%7B%22tokenType%22:%22simpleCompWithEm%22,%22attName%22:%22firstname%22,%22emName%22:%22Employee%22,%22comparaison%22:13,%22instance%22:0,%22checkForNull%22:false,%22value%22:%22ab@%22,%22diacritical%22:false%7D%5D%7D'&$method='entityset'&$progress4Dinfo='5CB39501D9854659885585A0E40A1127'&$top='80'
```

```
127.0.0.1:8044/rest/Company(2))
```

```js
{__entityModel:Company,__KEY:2,__TIMESTAMP:2018-04-25T14:42:18.351Z,__STAMP:0,ID:2,name:Charlie Echo Animations,creationDate:0!0!0,revenues:82000000,extra:{a:false},employees:{__deferred:{uri:/rest/Company(2)/employees?$expand=employees}}}
```

**ポイント**：ここまでは以前と変わりません。

エンティティの属性はすべてロードされましたが，``For each``ブロックの中で，実際にアクセスしたのは ``firstname`` ``lastname`` ``employer.name`` の３個だけでした。必要な属性が判明したので，ループの２回目では，エンティティセレクション内の2番目から81番目までのエンティティについて，必要な属性だけがまとめてリクエストされます。これが最適化です。

``For each``ループ（２回目）

```
127.0.0.1:8044/rest/Employee/$entityset/E301FD6333524B30865981380A6257C1?$attributes='firstname,lastname,employer,employer.name'&$skip='1'&$top='80'
```

条件分岐により，ループ内でアクセスする属性が変動する場合はどうでしょうか。最適化で省略された属性に対するアクセスが途中で発生した場合，追加のリクエストがサーバーに送信され，次回の最適化されたORDAリクエストからその属性も「必要な属性」のリストに含まれます。

#### 補足情報

* テスト目的でORDAの最適化をオフにすることができます。

```
ds.private.setRemoteAutoFilter(False)
```

* 必要なケースがあると事前にわかっているのであれば，ループ処理を開始する前にエンティティセレクションのメンバーを取り出し，目的のエンティティ属性にアクセスすることより，その属性が最適化されたORDAリクエストに含まれるよう，あらかじめ仕向けることができます。

```
$toBeMarkedAsUsed:=$sel2.first().salary // If条件で必要になることがあるのでタッチ
For each ($e;$sel2)
    $s:=$e.firstname+" "+$e.lastname+" works for "+$e.employer.name
    If ($i%40=0)
      $s:=$s+" and earns "+String($e.salary)
    End if 
End for each
```

* データベースエンジンの統計情報を返すコマンド``Get database measures``に``clientORDA``という新しいプロパティが追加されました。ORDAの最適化により，リクエストの回数・時間・サイズが節約されていることが確認できます。


#### 最適化コンテキスト

前述したように，ORDAの最適化は，RESTリクエストでロードするべきエンティティの「必要な属性」をクライアントが学習することにより，実現しています。クエリなどの処理によって形成された「最適化コンテキスト」は，同一エンティティセレクションに対する連続的なアクセスで暗黙的に使用されるだけでなく，他の場面でも明示的に使用できるようになっています。

新しいエンティティセレクションを返す下記のコマンドは，最適化コンテキスト（オブジェクト型）が渡せるようになりました。

* ``dataClass.query()``
* ``entitySelection.query()``
* ``dataClass.fromCollection()``
* ``dataClass.all()``
* ``Create entity selection``

**注記**: ``query()``は，すでにオブジェクト型のパラメーター``querySettings``をサポートしています。今回，このオブジェクトに``context``というプロパティが追加されました。

``parameters``  
``queryPath``  
``queryPlan``  
``attributes``（17r5）  
``parameters``（17r5）  

<i class="fa fa-external-link" aria-hidden="true"></i> [dataClass.query()](https://doc.4d.com/4Dv17R5/4D/17-R5/dataClassquery.305-4128666.ja.html#3765382)

最適化コンテキストをサポートするコマンドには，``context``プロパティにコンテキスト名（文字列）がセットされたオブジェクトを渡すことができます。同名のコンテキストが渡されたコマンドは，同一の最適化コンテキストを共有することになります。プロセスが違っていても，最適化コンテキストを共有することができますが，異なるデータクラスに対して同じコンテキストを使用することはできません。

下記のメンバーメソッドは，自動的にエンティティセレクションの最適化コンテキストを使用します。

* ``entitySelection.and()``
* ``entitySelection.minus()``
* ``entitySelection.or()``
* ``entitySelection.orderBy()``
* ``entitySelection.slice()``
* ``entitySelection.drop()``

エンティティセレクションに対する処理で形成された最適化コンテキストは，``dataClass.get()``メソッドに渡すことができます。

* ``dataClass.get(primaryKey; {settings} )``
