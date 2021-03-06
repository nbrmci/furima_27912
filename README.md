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
|birthday|date|null: false|

### Association

- has_many :items
- has_many :comments
- has_one :purchase_status

## addressテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|phone_number|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :item

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|name|string|null: false, add_index: true|
|describe|text|null: false|
|category|integer|null: false|
|condition|integer|null: false|
|shipping_charge|integer|null: false|
|shipping_region|integer|null: false|
|Purchase_status_id|integer|null: false, foreign_key: true|
|days_until_shipping|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :address
- has_many :comments
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_charge
- belongs_to_active_hash :shipping_region
- has_one :purchase_status
- belongs_to_active_hash :days_until_shipping

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## purchase_statusテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item