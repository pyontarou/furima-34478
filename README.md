# テーブル設計

## users テーブル

| Column                | Type   | Options                  |
| --------------------- | ------ | ------------------------ |
| nickname              | string | null: false              |
| email                 | string | null: false, unique:true |
| encrypted_password    | string | null: false              |
| family_name           | string | null: false              |
| first_name            | string | null: false              |
| family_name_kana      | string | null: false              |
| first_name_kana       | string | null: false              |
| birth_day             | date   | null: false              |

### Association

- has_many :items
- has_many :orders
- has_many :messages
- has_many :likes

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| state_id         | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| prefectures_id   | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_many :messages
- has_one :likes

## orders テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column             | Type       | Options                        |
| -----------------  | ---------- | ------------------------------ |
| prefecture_code    | string     | null: false                    |
| prefectures_id     | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order

## messages テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| comment    | string     | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## likes テーブル

| Column     | Type       | Options                        |
| ---------  | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
