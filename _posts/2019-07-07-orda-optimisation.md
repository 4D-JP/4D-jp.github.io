---
layout: post
title: "クライアント/サーバー版ORDAの速度アップ"
date: 2019-07-08 12:00:00
categories: リリースノート
tags: 17r5 orda
---

4D RemoteのORDA（ランゲージまたはリストボックス）の裏側では，RESTリクエストがサーバーに送られています。17r5では，クライアント側からのRESTリクエストを最適化することにより，ORDAのパフォーマンスを従来（クラシックコード）のクエリに近づける努力が払われました。

具体的には，データクラス，そのデータクラスと階層に制限なくリレーションで結ばれているデータクラスに対するアクセスの仕方に修正が加えられました。オブジェクト型フィールドやピクチャに対するRESTアクセスは修正の対象外となっています。

17r4までは，エンティティにアクセスするようなコードがクライアント側で実行されるたびにRESTリクエストがサーバーに送信されていました。また，サーバーからは，データクラスの属性がすべて返されていました。リレーション属性を介して別のデータクラスのエンティティにアクセスするようなコードでも，同じようにRESTリクエストが発生しました。

17r5以降，同一のエンティティセレクションに属する複数のエンティティに対するアクセスが検出されると，コードが解析され，必要な属性だけがまとめてリクエストされるようになりました。

17r5以降，RESTリクエストの最適化は，デフォルトで有効にされており，エンティティセレクション型のリストボックスでも自動的に働くようになっています。たとえば，スクロール操作では，インタフェースに表示されているエンティティ属性だけがサーバーからまとめて返されます。

フォーミュラ等でエンティティをロードする場合，あるいはエンティティを更新する場合，最初の１個はすべての属性がロードされ，後続の処理では，実際に使用した属性だけがリクエストされます。

RESTリクエストの最適化コンテキストは，クライアント側でメインのデータストア（``ds``）を使用したときに作成され，サーバーとの接続が中断されない限り，アクティブです。クライアント側のプロセスは，最適化コンテキストが共有できるようになっています。

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

エンティティの属性はすべてロードされましたが，``For each``ブロックの中で，実際にアクセスしたのは ``firstname`` ``lastname`` ``employer.name`` の３個だけでした。さらに，エンティティセレクションのエンティティは，80個目までがすでに返されています。そこで，次回のリクエストは，81個目以降のエンティティが必要になったときに発生し，必要な属性だけが返されることになります。これが最適化です。

```
127.0.0.1:8044/rest/Employee/$entityset/E301FD6333524B30865981380A6257C1?$attributes='firstname,lastname,employer,employer.name'&$skip='1'&$top='80'
```

条件分岐により，ループ内でアクセスする属性が変動する場合はどうでしょうか。最適化で省略された属性に対するアクセスが途中で発生した場合，追加のリクエストがサーバーに送信され，次回の最適化されたORDAリクエストからその属性も「必要な属性」のリストに含まれます。

#### 補足情報

テスト目的でORDAの最適化をオフにすることができます。

```
ds.private.setRemoteAutoFilter(False)
```

必要なケースがあると事前にわかっているのであれば，ループ処理を開始する前にエンティティセレクションのメンバーを取り出し，目的のエンティティ属性にアクセスすることより，その属性が最適化されたORDAリクエストに含まれるよう，あらかじめ仕向けることができます。

```
$toBeMarkedAsUsed:=$sel2.first().salary // If条件で必要になることがあるのでタッチ
For each ($e;$sel2)
    $s:=$e.firstname+" "+$e.lastname+" works for "+$e.employer.name
    If ($i%40=0)
      $s:=$s+" and earns "+String($e.salary)
    End if 
End for each
```
