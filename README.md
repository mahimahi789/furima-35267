# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| j.name   | string | null: felse |
| j.k.name | string | null: false |
| birthday | string | null: false |

### Association



## items テーブル

| Column   | Type       | Options                        |
| ------   | ---------- | ------------------------------ |
| itemname | text       | null: false |
| itemdescription   | text | null: false |
| category | references | null: false, foreign_key: true |
| condiion | references | null: false, foreign_key: true |
| burden   | references | null: false, foreign_key: true |
| area     | references | null: false, foreign_key: true |
| days     | references | null: false, foreign_key: true |
| price    | references | null: false, foreign_key: true |
| cardinfo | references | null: false, foreign_key: true |
| plice    | references | null: false, foreign_key: true |
| image    | activestorageで実装

### Association

- has_one :sadress

## saddress テーブル

| Column  | Type       | Options                         |
| ------- | ---------- | ------------------------------  |
| cardinfo | references | null: false, foreign_key: true |
| exdate  | references | null: false, foreign_key: true  ｜
| postcode | string    | null: false  ｜
| Prefectures | references | null: false, foreign_key: true  ｜
| municipality | string | null: false  ｜
| address | string | null: false  ｜
| building | string |      ｜
| phonenum | string | null: false  ｜

### Association

- has_one :items
