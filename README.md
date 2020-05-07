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

# DocumentManager DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :documents, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :sections
- has_many :user_sections, dependent: :destroy
- has_many :participate_sections, through: :user_sections, source: section

## sectionsテーブル

|Column|Type|Options|
|------|----|-------|
|section_name|string|null: false|
|ancestry|string||
|disclosure|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :documents
- has_many :user_sections
- has_many :participate_users, through: :user_sections, source: user

## documentsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string||
|note|text||
|src|string||
|section|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- has_many :comments, dependent: :destroy
- belongs_to :section, optional: true
- belongs_to :user

## user_sectionsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|section|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :section

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|document|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :document
- belongs_to :user
