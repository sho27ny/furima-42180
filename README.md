## users テーブル

| Column              | Type        | Option       |
|:-------------------:|:-----------:|:------------:|
| email               | string      | null: false, unique: true|
| encrypted_password  | string      | null: false  |
| nickname            | string      | null: false  |
| last_name           | string      | null: false  |
| first_name          | string      | null: false  |
| last_name_kana      | string      | null: false  |
| first_name_kana     | string      | null: false  |
| birth_date          | string      | null: false  |

### Association 
- has_many :items
- has_many :orders


## items テーブル　商品情報

| Column              | Type        | Option       |
|:-------------------:|:-----------:|:------------:|
| name                | string      | null: false  |
| description         | text        | null: false  |
| category_id         | integer     | null: false  |
| condition_id        | integer     | null: false  |
| shipping_cost_id    | integer     | null: false  |
| prefecture_id       | integer     | null: false  |
| shipping_time_id    | integer     | null: false  |
| price               | integer     | null: false  |
| user                | references	| null: false,foreign_key: true  |
 

### Association 
- belongs_to :user
- has_one :order


## order テーブル　購入記録

| Column              | Type        | Option       |
|:-------------------:|:-----------:|:------------:|
| user                | references	| null: false,foreign_key: true  |
| item                | references	| null: false,foreign_key: true  |


### Association 
- belongs_to :user
- belongs_to :item
- has_one :address


## address テーブル 発送先情報

| Column              | Type        | Option       |
|:-------------------:|:-----------:|:------------:|
| postal_code         | string      | null: false  |
| prefecture_id       | integer     | null: false  |
| city                | string      | null: false  |
| house_number        | string      | null: false  |
| building_name       | string      |              |
| phone_number        | string      | null: false  |
| order               | references	| null: false,foreign_key: true  |

### Association 
- belongs_to :order