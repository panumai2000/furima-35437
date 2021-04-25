## Users テーブル

| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false              |
| email               | string | null: false unique: true |
| encrypted_password  | string | null: false              |
| last_name_japanese  | string | null: false              |
| first_name_japanese | string | null: false              |
| last_name_katakane  | string | null: false              |
| first_name_katakane | string | null: false              |
| birthday            | date   | null: false              |

### Association

- has_many :items
- has_many :records

## Items テーブル

| Column                  | Type       | Options                       |
| ----------------------- | ---------- | ----------------------------- |
| item_name               | string     | null: false                   |
| description             | text       | null: false                   |
| category_id             | integer    | null: false                   |
| status_id               | integer    | null: false                   |
| delivery_burden_id      | integer    | null: false                   |
| delivery_prefectures_id | integer    | null: false                   |
| delivery_days_id        | integer    | null: false                   |
| price                   | integer    | null: false                   |
| user                    | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one :record

## Orders テーブル

| Column                  | Type       | Options                       |
| ----------------------- | ---------- | ----------------------------- |
| postal_code             | string     | null: false                   |
| delivery_prefectures_id | integer    | null: false                   |
| city                    | string     | null: false                   |
| address                 | string     | null: false                   |
| building                | string     |
| phone_number            | string     | null: false                   |
| record                  | references | null: false foreign_key: true |

### Association

- belongs_to :record

## Records テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false foreign_key: true |
| item   | references | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order