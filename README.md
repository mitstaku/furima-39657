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
| category_id       | integer    | null: false                   |
| status_id         | integer    | null: false                   |
| delivery_charge_id| integar    | null: false                   |
| prefecture_id     | integer    | null: false                   |
| delivery_day_id   | integar    | null: false                   |
| price             | integar    | null: false                   |
| user              | references | null: false, foreign_key: true|

### Association

- has_one :order
- belongs_to :user


## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_address

## delivery_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| street_address   | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |


### Association
- belongs_to :order