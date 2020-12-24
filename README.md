・アプリ名
  Wordlist

・概要
  ユーザー登録後リストを作成できます。リスト作成後にリスト詳細画面に行き、単語・単語の意味を登録すれば、クリックして裏返る単語表示機能が使える様になります。

・機能一覧
★ユーザー管理機能
  リスト管理機能
  単語登録機能
  単語表示機能
  単語ランダム表示機能
  リスト公開・非公開機能
  検索機能
  リスト共有機能
  お気に入り機能

・制作背景
  プログラミングには英単語がたくさん出てきます。
  高校生のうちに単語帳等を使ってもっと英単語を覚えておけばよかったなと思ったのがきっかけです。

  


















## Usersテーブル

| Column             | Type   | Option      |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |

## Association
- has_many :wordbooks
- has_many :words
- has_many :favorites


## Wordlistsテーブル

| Column      | Type       | Option                         |      |
| ----------- | ---------- | ------------------------------ | ---- |
| listname    | string     | null: false                    |      |
| text        | text       | null: false                    |      |
| release_id  | integer    | null: false                    | ※あとで |
| category_id | integer    | null: false                    | ※あとで |
| user        | references | null: false, foreign_key: true |      |

## Association

- belongs_to :user
- has_many :words
- has_many :favorites


## Wordsテーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| wordname | string     | null: false                    |
| mean     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| wordlist | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :wordlist

## Favoriteテーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| wordlist | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :wordlist