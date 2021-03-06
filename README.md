[![Image from Gyazo](https://i.gyazo.com/017441fb07c19dc8b480dd940ad05a15.jpg)](https://gyazo.com/017441fb07c19dc8b480dd940ad05a15)

<h2 align="center">Osigoto taiken</h2>

# 概要
ユーザーを登録すると職場体験を掲載することが出来ます。自身が掲載した職場体験は、編集と
削除をすることが出来ます。他のユーザーが掲載した職場体験はクレジットカードを用いて決済することが出来ます。

# 体験一覧　
![demo](https://gyazo.com/8b9dba1d9f2dd2e19bda0af4092ce17e/raw)
　　
# 機能  
## 掲載ページ 

![demo](https://gyazo.com/8e8214eaa59b88e6729045d46bfc4c9b/raw)  
  
## 検索ページ  
検索ボタンにて遷移    
![demo](https://gyazo.com/84ef9a713b43e9dafcfece1ac2b2f140/raw)  
  
## 詳細ページ  
掲載者は変更・削除ページへ  
購入者は購入ページへ  
コメント機能でやりとりができます。
![demo](https://gyazo.com/c63b42a40536054ec71352422eafd6d1/raw)  
  
## マイページ  
掲載者の掲載一覧  
![demo](https://gyazo.com/4c3e1d0c00aa015c7a6c2f9d8b892611/raw)  
  
## 購入ページ  
![demo](https://gyazo.com//5266c838bab06b356f8501c3422e04e6/raw)  
  
## 実装予定  
日程検索が出来るようコーディングしたい。  

# URL  
Herokuによるデプロイ  
  
https://feeleru-2022.herokuapp.com/  
  
Basic認証  
  
・ ID：admin  
・ Pass：2222  
  
# テスト用アカウント  
購入者用  
  
・ Eメールアドレス：test@com  
・ パスワード：aaa111  
  
購入用カード情報（PAYJPテスト用）  
  
・ 番号：4242424242424242  
・ 期限：5月/22年（未来の年月であれば可能）  
・ セキュリティコード：123  
  
掲載者用  
  
・ Eメールアドレス：test2@com  
・ パスワード：bbb222  

## Users テーブル

|Column|Type|Options|
|------|----|-------|
|nickname       |string|null:false|
|email          |string|null:false, unique:true|
|encrypted_password |string|null:false|

### Association

has_many :orders  
has_many :businesses  
has_many :comments  
has_many :favorites  

## Orders テーブル

|Column|Type|Options|
|------|----|-------|
|user   |references|null:false,foreign_key:true|
|item   |references|null:false,foreign_key:true|

### Association
belongs_to :user
belongs_to :item
belongs_to :address

## Businessesテーブル
|Column|Type|Options|
|------|----|-------|
|name            |string|null:false|
|text            |text  |null:false|
|price           |integer|null:false|
|category_id     |integer|null:false|
|prefecture_id   |integer|null:false|
|user   |references|null:false,foreign_key:true|

### Association
belongs_to :user  
has_one :order
has_many :comments  
has_many :favorites

## Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post_code      |string|null:false|
|city           |string|null:false|
|address        |string|null:false|
|building       |string|          |
|telephone      |string|null:false|
|prefecture_id  |integer|null:false|
|order   |references|null:false,foreign_key:true|

### Association
belongs_to :order

## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|business   |references|null:false,foreign_key:true|
|user   |references|null:false,foreign_key:true|

### Association
belongs_to :business
belongs_to :user

## Favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|business   |references|null:false,foreign_key:true|
|user   |references|null:false,foreign_key:true|

### Association
belongs_to :business
belongs_to :user
