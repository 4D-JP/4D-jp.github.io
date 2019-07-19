---
layout: technote
original_title: Data encryption and decryption between 4D and PHP
title: "4DとPHP間のデータの暗号化と非暗号化"
author: Nicolas Brachfogel
position: Senior Developer, 4D SAS
date: 2017-03-27 00:00:00
categories: セットアップ
tags: deployment encryption
version: 16
---

4DとPHPとの間でデータを暗号化・非暗号化する方法の紹介です。([原文](https://kb.4d.com/assetid=77755)）
<!--more-->

# 要約
---
このテクニカルノートでは、DとPHPスクリプトの間でどのようにデータを暗号化、非暗号化するのかについて説明しています。異なる可能なシナリオを提供して、一方からデータを暗号化する方法と他方から非暗号化する方法を図解します。

# 4Dを使った暗号化と非暗号化
---
ここでは、4Dメソッドを使った”Hello 4D world!!”ストリングの暗号化と非暗号化の例を挙げます。

GENERATE ENCRYPTION KEYPAIRを使って、一対の暗号化キーを作成する必要があります。一回作成すれば全部に使えます。

最初のステップは、一対のキーを作成して、publicKey.txtとprivateKey.txtファイルの内部に保存することです。

```
C_BLOB ($privateKey;$publicKey)
GENERATE ENCRYPTION KEYPAIR ($privateKey;$publicKey;2048)
BLOB TO DOCUMENT(“publicKey.txt”;$publicKey)  // The key is actually plain text
BLOB TO DOCUMENT(“privateKey.txt;$privateKey)
```

これで、ドキュメントの暗号化と非暗号化にこのキーが使えます。

第二ステップは、PrivateKey.txtからprivate keyを使って”Hello 4D world!!”ストリングを暗号化し、encrypted.dataファイル内に保存することです。

```
C_BLOB($privateKey)
DOCUMENT TO BLOB(“privateey.txt”;$privateKey)  // Read private key from disk
C_BLOB($encryptedMessage)
C_TEXT($clearMessage)
$clearMessage:=”Hello 4D World!!”

TEXT TO BLOB($clearMessage;$encryptedMessage)  // Move text to blob to encrypt it
ENCRYPT BLOB($encryptedMessage;$privateKey)  // Encrypt the text in blob
BLOB TO DOCUMENT(“encrypted.data”;$encryptedMessage)  // Store encrypted data on disk
```

最後に、public keyを使って暗号化された文書の非暗号化ができます。

この最後のステップで、事前に作成されたpublic keyを使ってencrypted.dataのコンテンツを非暗号化し、decrypted.txtファイル内に保存します。

decrypted.txtファイルを開くと、素敵な”Hello 4D World!!”が見られます。


# シナリオ２：4Dで暗号化されたファイルをPHPで非暗号化する
---
この第二のシナリオでは、最初に1組のキーを作成して4Dを使ってファイルを暗号化します。シナリオ１の最初の２ステップで暗号化したファイルを作成したのと基本的に同じです。

次にPHP内のファイルを非暗号化します。PHPメソッドを呼び出す4Dコードの例です：

```
C_TEXT($result;$error)
C_BOOLEAN($isOK)
$isO:=PHP EXECUTE(“phpCode.php”;”decrypt”;$result;”publicKey.txt”;”encrypted.data”)
  // phpCode.phpにで２つのストリング・パラメータを使って非暗号化のファンクションを実行する
If ($isOK)
  ALERT($result)
Else
  PHP GET FULL RESPONSE($error)  // エラーの検索
　ALERT($error)
End if
```
この小さな断片のコードがphpCode.php内の非暗号化を実行し、ファンクションが返すアウトプットをメッセージボックス内に出力します。エラーになった場合は、代わりにエラーを出力します。

以下はPHPコードの例で、publicKey.txt内に含まれるpublic keyを使ってencrypted.txtファイルのコンテンツを非暗号化します。

最初のステップは4Dのpublic keyをPHPが受け入れられるフォーマットに修正します。

```
<?php
include (‘Crypt /RSA.php’);  //オープンソースPHPライブラリー：phpseclib.sourceforge.net

function decrypt($publicKeyfileName, $encryptedFileName)
{
    $file = fopen(publicKeyFileName, “r”);

   // publicKey.txtファイル内のpublicKeyを読みます。
　 $publicKey = fread($file, 10000);

   // PHPのオープンSSLはSubjectPublicKeyInfoストラクチャを採用しているのに対して、4DがPKCS#1 RSAPublicKeyストラクチャを使っているため、public keyを変換する必要があります
　$rsa = new Crypt_RSA( );
  $rsa ->loadKey($publicKey);  //4Dのpublic keyを設定
  $rsa ->setPublicKey ( );

   // デフォルトのフォーマットでpublic keyを出力します
   // これはSubjectPublicKeyInfoの一つです。
   $publicKey = $rsa->getPublicKey( );
```

このコードを実行するために、phpseclibと呼ばれるオープンソースPHPライブラリーをインストールしなければなりません。こちらからダウンロードできます：http://phpseclib.sourceforge.net

大切なことは、この一部のコードはpublic keyをPHPが受け入れられるフォーマットに変換することです。4Dで作成されいていないキーを使うときは、スキップできるでしょう。また、一度行えば、変換されたキーはファイルに保存されます。

これでキーが適切なフォーマットになり、実際の暗号化を進めることができます。この第二ステップは、暗号化されたファイルを解除するとても古典的なPHPコードです。唯一特別なものは、各暗号化されたblobのはじめに追加される4Dヘッダーを扱うことです。最初の３文字（あるいは、もし4Dがビッグエンディアン・システムで暗号化している場合は４文字）を削除して純粋な暗号化ファイルを入手します。

```
$finalResult = ‘ ‘ ;
$file = fopen($encryptedFileName, “r”);

// ビットでのRSAキーのサイズ。4DでGENERATE ENCRYPTION KEYPAIRメソッドを使って呼び出したときに使用した第三引数
$keySize = 2048;

// 暗号化したファイルはチャンクごとに非暗号化されなければならない
$chunkSize = $keySize / 8;

// 暗号化されたBLOBの最初の３文字には特定の4Dヘッダーが含まれています（もし4Dがビッグエンディアン・システムで暗号化している場合は4文字）
$content = fread($file, $chunkSize + 3);

//特定の4Dヘッダーを削除
$content = substr($content, 3);

while ($content != “ “)
{
   // 非暗号化にはpublic keyを使います
   $encryptionOK = openssl public decrypt ($content, $chunkResult, $publicKey);
   $finalResult .= $chunkResult;
   $content = fread($file, $chunkSize); // 次のチャンク
}

if ($encryptionOK)
  return $finalResult;
else
  return “error”;
}
```

このコードを実行すると非暗号化されたファイルが返されます。あるいは非暗号化の最中にエラーになった場合はエラーを返します。

# シナリオ３：PHPで暗号化されたファイルを4Dで非暗号化
---
このシナリオでは、外部の手法で暗号化された時に、4Dを使って非暗号化することに焦点を当てます。以下のPHPコードを外部的な暗号化の例として検討します：

```
  function encrypt ($privateKeyFileName)
{
  $file = fopen($privateKeyFileName, “r”);

  //privateKeyFileNameファイル内のprivateKeyを読み込みます
  $privateKey = fread($file, 10000);

  fclose($file);

  $decrypted = “Hello 4D World!!”;

  // privateKeyを使ってストリングを暗号化
  $encryptionOK = openssl_private_encrypt ($decrypt, $encrypted,  $privateKey);

  // encrypted.dataファイル内に結果を書き込む
  $file = fopen(“encrypted.data”, “w”);

  fwrite($file, $encrypted);
  fclose($file);
}
```
このサンプルは、極端にシンプルで、”Hello 4D World!!”ストリングを暗号化し、encrypted.txtファイル内に入れているだけです。

このファイルを非暗号化するには、事前に作成されたpublicとprivate keyを使って、以下の4Dコードを実行します：

```
C_BLOB($encryptedMessage;$publicKey)
DOCUMENT TO BLOB(“publicKey.txt”;$publicKey)
DOCUMENT TO BLOB(“encrypted.txt”;$encryptedMessage)

INSERT IN BLOB($encryptedMessage;0;3)  // blobの最初に３バイトを追加
$encryptedMessage{0}:=1  //バージョン
$encryptedMessage{1}:=2  //プラットフォーム
$encryptedMessage{2}:=0  //パッディング
```

暗号化されたblobに小さな修正を行なっているのが分かります。3バイトのヘッダーを追加して、値1, 2と0を含んでいます。4Dによる適切な暗号化を保証します。

# おわりに
---
基本的に、4Dと他のプログラムとの間の暗号化と非暗号化は２つのステップが必要です：

—	public keyフォーマットをチェック。4Dで生成されたpublic keyは、PKCS#1 RSAPublicKeyストラクチャを使います。これは一般的なフォーマットですが、最も一般的なのはSubjectPublicKeyInfoストラクチャです。4D以外でキーを使用したいときは変換が必要でしょう。他方、4Dは両方のフォーマットが使えます。

—	4Dヘッダーの操作。リトルエンディアンプラットフォーム上で、4Dは値1, 2と0を暗号化されたファイルの最初に含ませています。ビッグエンディアンプラットフォームでは、4Dは1, 1,0と0を暗号化されたファイルの最初に含む4バイトを追加します。このヘッダーは、もし4D暗号化ファイルを使いたい場合には削除しなければなりませんし、4D内で4D以外の暗号化ファイルを使いたければ追加しなければなりません。



