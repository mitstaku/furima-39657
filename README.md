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

## Items テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| name              | string  | null: false |
| description       | text    | null: false |
| status            | string  | null: false |
| category          | string  | null: false |
| delivery_charge   | integar | null: false |
| delivery_area     | string  | null: false |
| delivery_day      | integar | null: false |
| price             | integar | null: false |

### Association

- has_many :orders
- belongs_to_active_hash :status
- belongs_to_active_hash :category
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_day


## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## delivery_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | string     | null: false                    |
| state            | text       | null: false                    |
| city             | string     | null: false                    |
| street_address   | string     | null: false                    |
| building_name    | string     | null: false                    |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |


### Association
- belongs_to :orders