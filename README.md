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

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth              | date   | null: false               |

### Association
- has_many :items
- has_many :olders



## items テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| content   | text       | null: false                    |
| category  | integer    | null: false                    |
| condition | integer    | null: false                    |
| postage   | integer    | null: false                    |
| area      | integer    | null: false                    |
| number    | integer    | null: false                    |
| price     | integer    | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :items



## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :departs



## departs テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_cord      | string     | null: false                    |
| genre          | integer    | null: false, foreign_key: true |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| telephone      | string     | null: false                    |

### Association

- belongs_to :older