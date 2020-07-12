# README


https://user-images.githubusercontent.com/58378333/87248793-93153300-c496-11ea-9d08-9cdc779bdc48.png

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
- has_many :participate_sections, through: :user_sections, source: :section

## sectionsテーブル

|Column|Type|Options|
|------|----|-------|
|section_name|string|null: false|
|ancestry|string||
|gist|text||
|disclosure|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :documents
- has_many :user_sections
- has_many :participate_users, through: :user_sections, source: :user

## documentsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string||
|note|text||
|alt|text||
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


# 追加予定機能（実装優先順）

## お気に入り機能
- markings table

|Column|Type|Options|
|user|references|null: false, foreign_key: true|
|document|references|null: false, foreign_key: true|

## 友人登録機能（メッセージ機能）
- friends table

|Column|Type|Options|
|user|references|null: false, foreign_key: true|
|friend_user_id|references|null: false, foreign_key: { to_table: :users }|
|status|integer|null: false|

request = 0:申請状態、1:承諾状態、2:拒否状態、3:絶縁状態
（解消はレコードを削除するのみ）

- messages table

|Column|Type|Options|
|text|text|null: false|
|friend|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

## 自己紹介ページ
- profiles table

|Column|Type|Options|
|introduction|text|null: true|
|prefecture|integer|null: true|
|private|integer|null: true|
|user|references|null: false, foreign_key: true|

(要検討)private = 0(null): ニックネーム・自己紹介・所在地, 1: 0+所属区分・管理区分・登録サイト, 2: 1+友人一覧

## 詳細な検索機能
## 未読・既読の判定
## 新着お知らせ機能
