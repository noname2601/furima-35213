# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| ---------------------| ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| family_name_kana     | string | null: false |
| first_name_kana      | string | null: false |
| birth_day            | date   | null: false |

### Association

- has_one :purchase 
- has_one :card
- has_many :item 

## purchases テーブル

| Column           | Type    | Options                      |
| --------         | ------  | ---------------------------- |
| post_code        | string  | null: false                  |
| prefecture_id    | integer | null: false                  |
| city             | string  | null: false                  |
| adress           | string  | null: false                  |
| building_name    | string  |                              |
| phone_number     | string  | null: false                  |
| user_id          | integer | null: false,foreign_key:true |
| card_id          | integer | null: false,foreign_key:true |

### Association

- belongs_to :user




## items テーブル

| Column              | Type    | Options                      |
| ------------------- | ------  | ---------------------------- |
| name                | string  | null: false,unique: true     |
| introduction        | text    | null: false                  |
| category            | string  | null: false                  |
| item_condition_id   | integer | null: false                  |
| shipping_free_id    | integer | null: false                  |
| shipping_area_id    | integer | null: false                  |
| ship_day_id         | integer | null: false                  |
| selling_price       | string  | null: false                  |
| shipping_id         | string  | null: false                  |
| user_id             | integer | null: false,foreign_key:true |

### Association

- belongs_to :user 
- belongs_to :category 
- belongs_to :brand 
- has_many :images 







