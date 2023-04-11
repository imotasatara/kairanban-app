
## アプリケーション名
回覧板

## アプリケーション概要
地域のお知らせや情報を素早く発信でき、地域住民のコミュニケーションの場を設ける。

## 利用方法
## お知らせ機能
・ユーザー登録者のみがお知らせを閲覧可能
・情報を共有したいユーザーが新規投稿で内容（写真、タイトル、お知らせ内容）を投稿する
・投稿された情報は一覧で閲覧できる
## コメント機能
・お知らせの詳細ページにコメントを投稿できる

## アプリケーションを作成した背景
回覧板を回す順序が(1回/年)変わり、どこに回せばいいのかわからず困ったことがあったためです。
また、コロナ禍の中回覧板を複数の家で回すことに抵抗を感じたことでも必要性を深く感じました。
さらに延長線として、老人の一人暮らしを地域で見守ることができたり、核家族の子育てサポートなど地域でもっとフォローし合える場を設けることで、あまり交流のない地域住民同士が知り合いとなり、コミュニケーションが生まれるととてもいいのではないかと思い開発することにしました。

## 洗い出した要件
https://docs.google.com/spreadsheets/d/1g5urLQHSROBIiSHcLKzTbdUkcFx_a5xFnZtvJC7UJyE/edit?usp=sharing

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/83a01695c50078e55f7f447cdae244d2.png)](https://gyazo.com/83a01695c50078e55f7f447cdae244d2)

## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/9faec8c925e2c644b7802a63c2b9587c.png)](https://gyazo.com/9faec8c925e2c644b7802a63c2b9587c)

## users_table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| postal_code        | string  | null: false               |
| address            | text    | null: false               |
| phone_number       | string  | null: false               |
| relationship_id    | integer | null: false               |
| emergency_contact  | string  | null: false               |

### Association

- has_many :comments
- has_many :informations


## informations_table

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| title   | string     | null: false                    |
| content | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user


## comments_talbe

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| content     | text       | null: false                    |
| information | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :information
