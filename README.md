# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nick_name          | string | null: false              |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :orders
- has_many :items

## Items テーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| name              | string     | null: false                   |
| description       | text       | null: false                   |
| category          | integer    | null: false                   |
| status            | integer    | null: false                   |
| delivery_charge   | integar    | null: false                   |
| delivery_area     | integer    | null: false                   |
| delivery_day      | integar    | null: false                   |
| price             | decimal    | null: false                   |
| user              | references | null: false, foreign_key: true|

### Association

- has_one :order
- belongs_to :user
- belongs_to_active_hash :status
- belongs_to_active_hash :category
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_day


## orders テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| user             | integer | null: false, foreign_key: true |
| item             | integer | null: false, foreign_key: true |
| delivery_address | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :delivery_address

## delivery_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| street_address   | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| order            | integer    | null: false, foreign_key: true |


### Association
- belongs_to :order