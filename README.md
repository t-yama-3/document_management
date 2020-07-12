# Bookmark Repository

## Top Page

![ed8bf7af37b2e414e15d2dce91d76975](https://user-images.githubusercontent.com/58378333/87249378-bdb4bb00-c499-11ea-98b3-a124189299e5.png)

## アプリケーション概要

### 基本情報
本アプリは、WEBページの登録及び表示を行うブックマークツールです。<br>
ブックマークにメモを残すことで、後からの検索を容易にできるとともに、会社内や友人同士で共有することで、WEBサイトの効率的な利用をサポートすることを目的としています。

### 主な機能

|機能|概要|
|---|---|
|WEBページ登録|WEBページの登録・編集・削除のほか、検索・閲覧などができる|
|グループ作成|テーマごとにメンバーを指定してグループの作成・編集ができる|
|コメント投稿・いいねボタン|閲覧権限があれば、コメント投稿、いいねボタンの使用ができる|
|友人申請・メッセージ送信|友人申請が承認されれば、ダイレクトメッセージの送受信ができる|

## Contents Page

![2181478e48e23dba729eae9af6f50148](https://user-images.githubusercontent.com/58378333/87249932-f73af580-c49c-11ea-81b9-3c56bfa2d2b7.png)

## Responsive Design
スマートフォンでも閲覧できるように、レスポンシブデザインを採用しています.
ダイレクトメール機能では、既読・未読の表示がされます。

<p align="center">
  <img src="https://user-images.githubusercontent.com/58378333/87250103-e343c380-c49d-11ea-8ef1-1c6f3847c0a8.png" width=30%>        <img src="https://user-images.githubusercontent.com/58378333/87250166-2140e780-c49e-11ea-90d2-67c9864c2d4d.png" width=30%>        <img src="https://user-images.githubusercontent.com/58378333/87250212-54837680-c49e-11ea-90f0-a0a8c6386fad.png" width=30%>
</p>

## 接続情報
URL http://3.113.77.116/

## 開発状況
Ruby on Rails / MySQL / Github / AWS / Visual Studio Code


## アクセス制限

|対象画面・機能|ログインしていない|サイト登録者|グループ管理者|グループメンバー|その他|備考|
|----|---|---|---|---|---|---|
|トップページ閲覧|○|○|○|○|○||
|参加グループ一覧の閲覧|×|○|○|○|○|自分が参加しているグループのみ表示される|
|登録サイト詳細閲覧（非公開）|×|○|△|○|×|グループ管理者はメンバーに入っていることが要件|
|登録サイト詳細閲覧（公開）|○|○|○|○|○|誰でもアクセス可|
|新規グループ作成|×|○|○|○|○|ログインしていれば新規グループは誰でも作成可|
|既存グループ編集|×|×|○|×|×|グループの編集権限は管理者のみ|
|新規登録サイト作成|×|○|○|○|○|所属しないグループには作成できない|
|新規登録サイト編集|×|○|×|×|×|編集できるのはサイト登録者のみ|
|代替テキスト入力・編集|×|○|×|×|×|同上|
|コメント投稿（非公開情報）|×|○|△|○|×|グループ管理者はメンバーに入っていることが要件|
|コメント投稿（公開情報）|×|○|○|○|○|アクセス権があればコメント可（要ログイン）|
|マイページ閲覧|×|○|○|○|○|自身のマイページのみアクセスできる|
|索引機能（非公開情報）|×|○|○|○|×|検索結果にはアクセス可能な情報のみ表示|
|索引機能（公開情報）|○|○|○|○|○|公開情報は誰でも閲覧可|


## DB設計

<img width="954" alt="スクリーンショット 2020-07-12 23 54 42" src="https://user-images.githubusercontent.com/58378333/87249628-1afd3c00-c49b-11ea-88a1-3136a96257f5.png">

### usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false, unique: true|
|password|string|null: false|

#### Association
- has_many :documents, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :sections
- has_many :user_sections, dependent: :destroy
- has_many :participate_sections, through: :user_sections, source: :section

### sectionsテーブル

|Column|Type|Options|
|------|----|-------|
|section_name|string|null: false|
|ancestry|string||
|gist|text||
|disclosure|integer|null: false|
|user|references|null: false, foreign_key: true|

#### Association
- belongs_to :user
- has_many :documents
- has_many :user_sections
- has_many :participate_users, through: :user_sections, source: :user

### documentsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string||
|note|text||
|alt|text||
|src|string||
|section|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

#### Association
- has_many :comments, dependent: :destroy
- belongs_to :section, optional: true
- belongs_to :user

### user_sectionsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|section|references|null: false, foreign_key: true|

#### Association
- belongs_to :user
- belongs_to :section

### commentsテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|document|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|

#### Association
- belongs_to :document
- belongs_to :user

