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

| Column               | Type   | Options                  |
| ---------------------| ------ | -------------------------|
| nickname             | string | null: false              |
| email                | string | null: false,unique: true |
| encrypted_password   | string | null: false              |
| family_name          | string | null: false              |
| first_name           | string | null: false              |
| family_name_kana     | string | null: false              |
| first_name_kana      | string | null: false              |
| birth_day            | date   | null: false              |

### Association
 
- has_many :items 
- has_many :managements

## purchases テーブル

| Column           | Type    | Options                      |
| --------         | ------  | ---------------------------- |
| post_code        | string  | null: false                  |
| area_id          | integer | null: false                  |
| city             | string  | null: false                  |
| adress           | string  | null: false                  |
| building_name    | string  |                              |
| phone_number     | string  | null: false                  |
| management_id    | integer | null: false,foreign_key:true |


### Association

- belongs_to :management




## items テーブル

| Column              | Type    | Options                      |
| ------------------- | ------  | ---------------------------- |
| name                | string  | null: false                  |
| introduction        | text    | null: false                  |
| category_id         | integer | null: false                  |
| item_condition_id   | integer | null: false                  |
| shipping_free_id    | integer | null: false                  |
| area_id             | integer | null: false                  |
| ship_day_id         | integer | null: false                  |
| selling_price       | integer | null: false                  |
| user_id             | integer | null: false,foreign_key:true |

### Association

- belongs_to :user 
- has_one :management

## managements テーブル

| Column              | Type    | Options                      |
| ------------------- | ------  | ---------------------------- |
| user_id             | integer | null: false,foreign_key:true |
| item_id             | integer | null: false,foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item 
- has_one :purchase









