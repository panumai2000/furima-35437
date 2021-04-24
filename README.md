## Users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| name(japanese) | string | null: false |
| name(katakane) | string | null: false |
| birthday       | date   | null: false |

### Association

- has_many :item
- has_many :record

## Items テーブル

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| item_name            | string     | null: false                   |
| description          | text       | null: false                   |
| category             | string     | null: false                   |
| status               | string     | null: false                   |
| delivery_burden      | string     | null: false                   |
| delivery_prefectures | string     | null: false                   |
| delivery_days        | integer    | null: false                   |
| price                | integer    | null: false                   |
| user                 | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_one :record

## Orders テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefectures  | string  | null: false |
| city         | string  | null: false |
| address      | string  | null: false |
| building     | string  |
| phone_number | integer | null: false |

### Association

- belongs_to :item

## Records テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false foreign_key: true |
| item   | references | null: false foreign_key: true |

### Association

- belongs_to :user
- belongs_to ;item