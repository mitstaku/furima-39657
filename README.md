# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nick_name          | string | null: false              |
| email              | string | null: false, unique: true|
| password           | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :orders

## Items テーブル

| Column            | Type      | Options                        |
| ----------------- | --------- | ------------------------------ |
| name              | string    | null: false                    |
| description       | text      | null: false                    |
| status_id         | reference | null: false, foreign_key: true |
| category_id       | reference | null: false, foreign_key: true |
| delivery_charge_id| reference | null: false, foreign_key: true |
| delivery_day_id   | reference | null: false, foreign_key: true |

### Association

- has_many :orders
- belongs_to :users
- belongs_to :status
- belongs_to :item_images
- belongs_to :categorys
- belongs_to :delivery_charges
- belongs_to :delivery_days

## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| items_id         | text       | null: false                    |
| card_number      | references | null: false                    |
| zip_code         | references | null: false                    |
| city             | references | null: false                    |
| street_address   | references | null: false                    |
| building_name    | references | null: false                    |
| telephone_number | references | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- has_many :users
- belongs_to :items

## status テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | text       | null: false                    |

### Association
- belongs_to :items

## item_images テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| image     | text       | null: false                    |
| item_id   | text       | null: false, foreign_key: true |

### Association
- belongs_to :items

## categorys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| category  | text       | null: false                    |

### Association
- belongs_to :items

## delivery_charges テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| delivery_charge | text       | null: false                    |

### Association
- belongs_to :items

## delivery_days テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| delivery_day | text       | null: false                    |

### Association
- belongs_to :items