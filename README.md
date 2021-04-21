# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false, unique: true|
| encrypted_password | string | null: false |
| j_name   | string | null: felse |
| j_k_name | string | null: false |
| j_k_n_name | string | null: false |
| j_k_n_c_name | string | null: false |
| birthday | date | null: false |

### Association

- has_many :items
- has_many :buy_manage

## items テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| item_name | text       | null: false |
| item_description   | text | null: false |
| category_id | integer | null: false, foreign_key: true |
| condiion_id | integer | null: false, foreign_key: true |
| burden_id   | integer | null: false, foreign_key: true |
| area_id     | integer | null: false, foreign_key: true |
| days_id     | integer | null: false, foreign_key: true |
| plice    | integer | null: false, foreign_key: true |
| user_id  | integer | null: false, foreign_key: true |
| image    |

### Association

- has_one :addresse
- belongs_to :user

## addresses テーブル

| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------  |
| area_id     | integer | null: false, foreign_key: true |
| municipality | string | null: false  ｜
| address | string | null: false  ｜
| building | string |      ｜
| phone_num | string | null: false  ｜
| post_num | string | null: false  |
| buy_manage_id | integer | null: false, foreign_key: true |

### Association



## buy_manages テーブル

| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------  |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :user
- has_one :addresse


