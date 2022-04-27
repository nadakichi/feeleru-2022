[![Image from Gyazo](https://i.gyazo.com/017441fb07c19dc8b480dd940ad05a15.jpg)](https://gyazo.com/017441fb07c19dc8b480dd940ad05a15)

<h2 align="center">Osigoto taiken</h2>

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
