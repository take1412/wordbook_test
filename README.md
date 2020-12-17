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