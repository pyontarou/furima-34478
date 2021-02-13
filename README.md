# テーブル設計

## users テーブル

| Column                | Type   | Options                  |
| --------------------- | ------ | ------------------------ |
| nickname              | string | null: false              |
| email                 | string | null: false, unique:true |
| password              | string | null: false              |
| password_confirmation | string | null: false              |
| family_name           | string | null: false              |
| first_name            | string | null: false              |
| family_name_kana      | string | null: false              |
| first_name_kana       | string | null: false              |
| birth_day             | date   | null: false              |

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
| region_id        | string     | null: false                    |
| shipping_date    | string     | null: false                    |
| price            | integer    | null: false                    |
| sales_commission | integer    | null: false                    |
| sales_profit     | integer    | null: false                    |
| seller_user      | references | null: false, foreign_key: true |
| shipping         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column     | Type       | Options                        |
| -----------| ---------- | ------------------------------ |
| buyer_user | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| address    | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping

## shippings テーブル

| Column   | Type       | Options                        |
| ---------| ---------- | ------------------------------ |
| order    | references | null: false, foreign_key: true |
| address  | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures_id  | string     | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     | null: false                    |

### Association

- has_many :orders
- has_many :shippings