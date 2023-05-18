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

## users table

| Column               | Type                | Options                   |
|----------------------|---------------------|---------------------------|
| nickname             | string              | null: false               |
| email                | string              | null: false, unique: true |
| encrypted_password   | string              | null: false               |
| surname              | string              | null: false               |
| giben_name           | string              | null: false               |
| surname_katakana     | string              | null: false               |
| giben_name_katakana  | string              | null: false               |
| date_of_bith         | date                | null: false               |

### Association
has_many :items
has_many :purchases


## items table

| Column            | Type                | Options                        |
|-------------------|---------------------|--------------------------------|
| item              | string              | null: false                    |
| item_comment      | text                | null: false                    |
| item_category_id  | integer             | null: false                    |
| item_situation_id | integer             | null: false                    |
| delivery_money_id | integer             | null: false                    |
| send_region_id    | integer             | null: false                    |
| send_day_id       | integer             | null: false                    |
| price             | integer             | null: false                    |
| user              | references          | null: false, foreign_key: true |
 

### Association
belongs_to :user
has_one :purchase


## purchases table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user               | references          | null: false, foreign_key: true |
| item               | references          | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :delivery


## deliverys table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| post_code          | string              | null: false                    |
| send_region_id     | integer             | null: false                    |
| municipality       | string              | null: false                    |
| address            | string              | null: false                    |
| building_name      | string              |                                |
| tel                | string              | null: false                    |
| purchase           | references          | null: false, foreign_key: true |

### Association
belongs_to :purchase

