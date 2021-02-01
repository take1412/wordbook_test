・アプリ名
  Wordbook(サイトタイトルはwordlist)
  ![e4c724e3c36f329958c6b1b970c26d42](https://user-images.githubusercontent.com/73679908/106473781-8d8d4200-64e7-11eb-9229-d56882e08acc.jpg)


・概要
  単語帳を登録、管理、公開、表示できるアプリです。
  非公開・公開機能を備えており、非公開で登録すると、自分だけが見る事ができる単語帳も登録する事が可能です。
  また、ランダム表示機能も備えており、登録した単語をランダムで表示する事ができます。


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
  高校生のうちに単語帳等を使ってもっと英単語を覚えておけばよかったと思ったのがきっかけです。
  高校生をスポットにして考えた結果、単語帳を使う際に以下の問題点がありました。
    ・単語帳を複数持っていると、荷物がかさばり管理が大変
    ・電車やバスで移動中、つり革等に掴まっていると片手で単語帳を裏返しづらい
    ・単語帳の共有がオフラインでしかできない
  
  この問題を全て解決するため、単語帳アプリを作りました。

・工夫したポイント
  ・お気に入り登録動作を非同期化し、ページ遷移のストレスを無くしました。
  ・単語を順番に表示させる昨日とは別に、単語をランダムで表示させる機能を追加しました。
  ・他のアプリとの差別化を意識（ユーザー検索機能と単語帳共有機能を実装）
  ・実際にアプリを使用してもらい、レビューをもらい反映する。

・機能一覧
  ・ユーザー管理機能
    deviseを使用しユーザー管理機能を実装
    <img width="1680" alt="ea3eb32fc954b34776c9d771a8e86faf" src="https://user-images.githubusercontent.com/73679908/106474921-bd891500-64e8-11eb-93ec-aee5a0986ea7.png">
    ニックネーム、ユーザーコード（単語帳共有用コード）。メールアドレス、パスワードを入力し。アカウントを登録します。
    ログイン、ログアウト、マイページではユーザーの編集、削除が行えます。

  ・リスト管理機能
    ログイン後、新規リスト作成ボタンをクリックしてリストの名前と説明文を入力するとリストが登録できます。
    登録したリストをクリックするとリスト詳細画面が表示されます。
    リスト詳細画面では以下の事が可能です。
      ・単語の登録・編集・削除
      ・リストの編集・削除
      ・リストを共有するユーザーのユーザーコードを登録
      ・単語を表示・単語をランダム表示
    ![08c1803ddcbf64f71284e89aa1d05f0d](https://user-images.githubusercontent.com/73679908/106480980-4d31c200-64ef-11eb-8d9d-0635927a0168.jpg)

  ・単語表示・単語ランダム表示機能
    ![result](https://user-images.githubusercontent.com/73679908/106488746-5e7ecc80-64f7-11eb-91ca-d20912021ebd.gif)

















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