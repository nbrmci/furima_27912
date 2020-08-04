# furima_app DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|

### Association

-has_one :credit
-has_one :address
-has_many :items
-has_many :comments

## creditテーブル

|Column|Type|Options|
|------|----|-------|
|credit_number|string|null: false|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|

### Association

-belongs_to :user

## addressテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|phone_number|string|null: false|

### Association

-belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|name|string|null: false, add_index: true|
|describe|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|condition_id|integer|null: false, foreign_key: true|
|shipping_charge_id|integer|null: false, foreign_key: true|
|shipping_region_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|Purchase_status_id|integer|null: false, foreign_key: true|
|days_until_shipping|string|null: false|
|price|integer|null: false|
|sales_commission|integer|null: false|
|sales_profit|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association

-belongs_to :user
-has_many :comments
-belongs_to :category
-belongs_to :condition
-belongs_to :shipping_charge
-belongs_to :shipping_region
-belongs_to :brand
-belongs_to :purchase_status

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|
|user_id|integer|null: false, foreign_key: true|
|items_id|integer|null: false, foreign_key: true|

### Association

-belongs_to :user
-belongs_to :item

## categoryテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

-has_many :items

## conditionテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

-has_many :items

## shipping_chargeテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

-has_many :items

## shipping_regionテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

-has_many :items

## brandテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

-has_many :items

## purchase_statusテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

-has_many :items