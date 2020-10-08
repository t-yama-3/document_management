# Bookmark Repository

## Introduction
本アプリは、WEBページの登録及び表示を行うブックマークツールです。<br>
ブックマークにメモを残すことで、後からの検索を容易にするとともに、会社内や友人同士で共有することで、WEBサイトの効率的な利用をすることができます。<br>

![ed8bf7af37b2e414e15d2dce91d76975](https://user-images.githubusercontent.com/58378333/87249378-bdb4bb00-c499-11ea-98b3-a124189299e5.png)

<br>

## Summary

### Feature
ブックマークを辞書的に使えるように、各種の機能を備えています。

|機能|概要|
|---|---|
|WEBページ登録|WEBページの登録・グループ管理・編集・削除などができる|
|WEBページ検索・表示|ブックマーク内容を検索し、アプリ内でのサイト閲覧もできる|
|グループ作成|テーマごとにメンバーを指定してグループの作成・編集ができる|
|コメント投稿・いいねボタン|閲覧権限があれば、コメント投稿、いいねボタンの使用ができる|
|友人申請・メッセージ送信|友人申請が承認されれば、ダイレクトメッセージの送受信ができる|

### Contents Page
ブックマークには、タイトル・説明（メモ）・グループ区分を自由に登録します。<br>
登録サイトは、アプリのフレーム内にも表示され、一目で内容が分かります。<br>
ユーザー同士でコメントを投稿したり、Goodボタンを押すことで情報の重要性も客観的に把握できます。<br>

![2181478e48e23dba729eae9af6f50148](https://user-images.githubusercontent.com/58378333/87249932-f73af580-c49c-11ea-81b9-3c56bfa2d2b7.png)

<br>

## Responsive Design
使用するデバイスの画面に合わせて表示できるように、レスポンシブデザインを採用しています。<br>
スマートフォンでも閲覧・使用をすることができます。<br>

<p align="center">
  <img src="https://user-images.githubusercontent.com/58378333/87250103-e343c380-c49d-11ea-8ef1-1c6f3847c0a8.png" width=30%>___<img src="https://user-images.githubusercontent.com/58378333/87250166-2140e780-c49e-11ea-90d2-67c9864c2d4d.png" width=30%>___<img src="https://user-images.githubusercontent.com/58378333/87256558-bc51b580-c4ce-11ea-843f-a150d24f494f.png" width=30%>
</p>

<br>

## Direct Mail
友人登録を行うことで、ダイレクトメールの送受信をすることができます。<br>
受信者がメールを閲覧したか否かが分かるように、既読・未読の表示がされます。<br>

<p align="center">
  <img src="https://user-images.githubusercontent.com/58378333/87256606-1d798900-c4cf-11ea-85dc-ef74e726c467.png" width=30%>___<img src="https://user-images.githubusercontent.com/58378333/87250212-54837680-c49e-11ea-90f0-a0a8c6386fad.png" width=30%>___<img src="https://user-images.githubusercontent.com/58378333/87256651-9082ff80-c4cf-11ea-9a07-1a182c287aad.png" width=30%>
</p>

<br>

## Link
URL http://3.113.77.116/

<br>

## Programming Language
Ruby on Rails / MySQL / Github / AWS / Visual Studio Code

<br>

## DB Design

<img width="954" alt="スクリーンショット 2020-07-12 23 54 42" src="https://user-images.githubusercontent.com/58378333/87249628-1afd3c00-c49b-11ea-88a1-3136a96257f5.png">

<br>

## Access Restriction

|対象画面・機能|未ログイン|サイト登録者|グループ管理者|グループメンバー|その他|
|----|---|---|---|---|---|
|トップページ閲覧|○|○|○|○|○||
|参加グループ一覧の閲覧|×|○|○|○|○|
|登録サイト詳細閲覧（非公開）|×|○|△|○|×|
|登録サイト詳細閲覧（公開）|○|○|○|○|○|
|新規グループ作成|×|○|○|○|○|
|既存グループ編集|×|×|○|×|×|
|新規登録サイト作成|×|○|○|○|○|
|新規登録サイト編集|×|○|×|×|×|
|代替テキスト入力・編集|×|○|×|×|×|
|コメント投稿（非公開情報）|×|○|△|○|×|
|コメント投稿（公開情報）|×|○|○|○|○|
|マイページ閲覧|×|○|○|○|○|
|索引機能（非公開情報）|×|○|○|○|×|
|索引機能（公開情報）|○|○|○|○|○|
