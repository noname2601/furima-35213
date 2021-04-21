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

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| user_password   | string | null: false |
| family_name     | string | null: false |
| first_name      | string | null: false |
| family_name_kana| string | null: false |
| first_name_kana | string | null: false |
| post_code       | string | null: false |
| city            | string | null: false |
| house_number    | string | null: false |
| building_name   | string | null: false |
| phone_number    | string | null: false |
| birth_day       | date   | null: false |

### Association

- has_one :purchase 
- has_one :card
- has_many :item 

## purchase テーブル

| Column           | Type    | Options                      |
| --------         | ------  | ---------------------------- |
| post_code        | string  | null: false                  |
| prefecture       | string  | null: false                  |
| city             | string  | null: false                  |
| adress           | string  | null: false                  |
| building_name    | string  | null: false                  |
| phone_number     | string  | null: false                  |
| user_id          | integer | null: false,foreign_key:true |
| card_id          | integer | null: false,foreign_key:true |

### Association

- belongs_to :user

## card テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| customer_id   | references | null: false                    |
| card_id       | references | null: false                    |

### Association

- belongs_to :user



## items テーブル

| Column           | Type    | Options                      |
| --------         | ------  | ---------------------------- |
| name             | string  | null: false                  |
| introduction     | text    | null: false                  |
| category         | string  | null: false                  |
| item_condition   | string  | null: false                  |
| shipping_free    | string  | null: false                  |
| shipping_area    | string  | null: false                  |
| ship_day         | string  | null: false                  |
| selling_price    | string  | null: false                  |
| judgment         | string  | null: false                  |
| category_id      | string  | null: false                  |
| shipping_id      | string  | null: false                  |
| user_id          | integer | null: false,foreign_key:true |

### Association

- belongs_to :user 
- belongs_to :category 
- belongs_to :brand 
- has_many :images 


## category テーブル

| Column  | Type        | Options                        |
| -------  | ---------- | ------------------------------ |
| name     | string     | null: false                    |

### Association

- has_many :item


## images テーブル

| Column     | Type        | Options                        |
| -------    | ----------  | ------------------------------ |
| image      | string      | null: false                    |
| item_id    | integer     | null: false,foreign_key:true   |
| product_id | integer     | null: false,foreign_key:true   |

### Association

- belongs_to :items


## brands テーブル

| Column  | Type        | Options                         |
| -------  | ---------- | ------------------------------  |
| name     | string     | index:true                      |


### Association

- has_many :items

## item_conditions テーブル

| Column         | Type        | Options                        |
| -------        | ---------- | ------------------------------  |
| item_condition | integer     | null: false                    |


### Association

- has_many :items

## shipping_frees テーブル

| Column        | Type        | Options           |
| --------------| ---------- | ------------------ |
| shipping_free | integer     | null: false       |


### Association

- has_many :item

## ship_days テーブル

| Column   | Type        | Options                      |
| -------  | ---------- | ------------------------------|
| ship_day | integer     | null: false                  |


### Association

- has_many :items

## selling_prices テーブル

| Column  | Type        | Options                       |
| -------  | ---------- | ------------------------------|
| selling_price     | integer     | null: false         |


### Association

- has_many :items