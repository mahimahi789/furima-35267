# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false, unique: true |
| encrypted_password | string | null: false |
| j.name   | string | null: felse |
| j.k.name | string | null: false |
| j.k.n.name | string | null: false |
| j.k.n.c.name | string | null: false |
| birthday | date | null: false |

### Association

- has_many :items

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
| price    | integer | null: false, foreign_key: true |
| image    | 

### Association

- has_one :sadress

## saddress テーブル

| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------  |
| area_id     | integer | null: false, foreign_key: true |
| municipality | string | null: false  ｜
| address | string | null: false  ｜
| building | string |      ｜
| phonenum | string | null: false  ｜

### Association

- has_one :items

## buy_manage テーブル

| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------  |
| name | string | null: false |
| item_name | text | null: false |

### Association

- has_many :items