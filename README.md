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
| password             | string              | null: false               |
| password_confimation | string              | null: false               |
| surname              | string              | null: false               |
| giben_name           | string              | null: false               |
| surname_katakana     | string              | null: false               |
| giben_name_katakana  | string              | null: false               |
| date_of_bith         | datetime            | null: false               |

### Association
has_many :items
has_many :purchases


## items table

| Column         | Type                | Options                        |
|----------------|---------------------|--------------------------------|
| item           | string              | null: false                    |
| item_comment   | text                | null: false                    |
| item_category  | string              | null: false                    |
| item_situation | string              | null: false                    |
| delivery_money | string              | null: false                    |
| send_region    | string              | null: false                    |
| send_day       | datetime            | null: false                    |
| price          | integer             | null: false                    |
| user           | references          | null: false, foreign_key: true |
| purchase       | references          | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :purchase


## purchases table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| credit_card        | integer             | null: false                    |
| credit_deadline    | datetime            | null: false                    |
| credit_security    | integer             | null: false                    |
| user               | references          | null: false, foreign_key: true |
| item               | references          | null: false, foreign_key: true |
| delivery           | references          | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
belongs_to :delivery


## deliverys table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| post_code          | integer             | null: false                    |
| prefectures        | string              | null: false                    |
| municipality       | string              | null: false                    |
| address            | integer             | null: false                    |
| tel                | integer             | null: false                    |
| purchase           | references          | null: false, foreign_key: true |

### Association
belongs_to :purchase

