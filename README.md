# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_kana      | string | null: false |
| first_name_kana       | string | null: false |
| birth_year            | string | null: false |
| birth_month           | string | null: false |
| birth_day             | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| title            | string     | null: false                    |
| description      | string     | null: false                    |
| state            | string     | null: false                    |
| postage          | string     | null: false                    |
| region           | string     | null: false                    |
| shipping_date    | string     | null: false                    |
| price            | integer    | null: false                    |
| sales_commission | integer    | null: false                    |
| sales_profit     | integer    | null: false                    |
| seller_user_id   | references | null: false, foreign_key: true |
| shipping_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| expiration_date | string     | null: false                    |
| security_code   | string     | null: false                    |
| postal_code     | string     | null: false                    |
| prefectures     | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | string     | null: false                    |
| buyer_user_id   | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping

## shippings テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| expiration_date | string     | null: false                    |
| security_code   | string     | null: false                    |
| postal_code     | string     | null: false                    |
| prefectures     | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     | null: false                    |
| phone_number    | string     | null: false                    |
| orders_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :order

