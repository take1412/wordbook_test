# アプリ名
  **Wordbook**(サイトタイトルはwordlist)
  ![e4c724e3c36f329958c6b1b970c26d42](https://user-images.githubusercontent.com/73679908/106473781-8d8d4200-64e7-11eb-9229-d56882e08acc.jpg)  


# 概要
  **単語帳**を登録、管理、公開、表示できるアプリです。  
  非公開・公開機能を備えており、非公開で登録すると、自分だけが見る事ができる単語帳も登録する事が可能です。  
  また、ランダム表示機能も備えており、登録した単語をランダムで表示する事ができます。  

# 制作背景
  プログラミングには英単語がたくさん出てきます。  
  高校生のうちに単語帳等を使ってもっと英単語を覚えておけばよかったと思ったのがきっかけです。  
  高校生をスポットにして考えた結果、単語帳を使う際に以下の問題点がありました。  

-  単語帳を複数持っていると、荷物がかさばり管理が大変  
-  電車やバスで移動中、つり革等に掴まっていると片手で単語帳を裏返しづらい  
-  単語帳の共有がオフラインでしかできない  

  **この問題を全て解決するため、単語帳アプリを作りました。**

# 工夫したポイント
-  お気に入り登録動作を非同期化し、ページ遷移のストレスを無くしました。
-  単語を順番に表示させる昨日とは別に、単語をランダムで表示させる機能を追加しました。
-  他のアプリとの差別化を意識（ユーザー検索機能と単語帳共有機能を実装）
-  実際にアプリを使用してもらい、レビューをもらい反映する。 

# 機能一覧
  ## ユーザー管理機能
  deviseを使用しユーザー管理機能を実装
  <img width="1680" alt="ea3eb32fc954b34776c9d771a8e86faf" src="https://user-images.githubusercontent.com/73679908/106474921-bd891500-64e8-11eb-93ec-aee5a0986ea7.png">
  ニックネーム、ユーザーコード（単語帳共有用コード）。メールアドレス、パスワードを入力し。アカウントを登録します。
  ログイン、ログアウト、マイページではユーザーの編集、削除が行えます。  

  ## リスト管理機能
  ログイン後、新規リスト作成ボタンをクリックしてリストの名前と説明文を入力するとリストが登録できます。  
  登録したリストをクリックするとリスト詳細画面が表示されます。  
  リスト詳細画面では以下の事が可能です。  

-    単語の登録・編集・削除
-    リストの編集・削除
-    リストを共有するユーザーのユーザーコードを登録
-    単語を表示・単語をランダム表示

  ![08c1803ddcbf64f71284e89aa1d05f0d](https://user-images.githubusercontent.com/73679908/106480980-4d31c200-64ef-11eb-8d9d-0635927a0168.jpg)  

  ## リスト公開・非公開機能
  リスト作成画面・編集画面でリストを**公開**するか**非公開**にするかを選ぶ事ができます。  
  公開にするとトップページに表示される様になります、  
  非公開にするとトップページに表示されません。マイページにのみ表示されます。  
  ![ba6e9a9b9aad90ef150172445bb95076](https://user-images.githubusercontent.com/73679908/106494162-70fc0480-64fd-11eb-8d95-cb298159a676.jpg)  

  ## 単語表示・単語ランダム表示機能
  単語を覚えるボタンをクリックすると、リスト内の単語を表示するページに遷移します。  
  単語は1単語ずつ表示されます。 
  単語をクリックすると裏返り、単語の意味が表示されます。  
  ページネーション機能を実装していますので、次をクリックすると次の単語が表示されます。（ランダム表示の場合は表示順序がランダムになっています）  
  ![result](https://user-images.githubusercontent.com/73679908/106491693-77d54800-64fa-11eb-954b-e109da16e54c.gif)  

  ## 検索機能
  ヘッダーの検索バーからリストを登録したユーザーやリストを検索できます。  
  非公開のものは表示されません。  

  ## お気に入り機能
  他のユーザーのリスト詳細画面に遷移し、**☆**をクリックする事でお気に入り登録する事ができます。  
  ヘッダーのお気に入りボタンをクリックすると、お気に入り登録したリストの一覧が表示されます。  
  ![result](https://user-images.githubusercontent.com/73679908/106498090-3cd71280-6502-11eb-905f-618d5aa6dc27.gif)  

  ## リスト共有機能
  自分が登録したリストの詳細画面でリストを他のユーザーと共有するボタンをクリックします。  
  ユーザーコードを入力して登録すると、登録したユーザーコードが一致するユーザーはリストの編集、単語の登録・編集を行う事ができる様になります。  
  ![result](https://user-images.githubusercontent.com/73679908/106499351-d652f400-6503-11eb-885f-de740ab25183.gif)
  ![7b0c1fef81846bfba8daf4361c5762d8](https://user-images.githubusercontent.com/73679908/106499580-1c0fbc80-6504-11eb-929b-0f41998d4c77.jpg)  

  # 使用技術
-    HTML / SCSS
-    Javascript
-    JQuery
-    Ruby 2.6.5
-    Rails 6.0.0
-    MySQL2
-    AWS(EC2, VPC)
-    RSpec  

  # 今後実装したい事
-    dockerの本番環境構築
-    CircleCIを使った自動デプロイ
-    RDSを導入し、データベースを切り離す
-    Route53による独自ドメイン設定  

  # DB設計
## Usersテーブル

| Column             | Type    | Option      |
| ------------------ | ------- | ----------- |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| nickname           | string  | null: false |
| user_code          | integer | null: false |

## Association
- has_many :wordbooks
- has_many :words
- has_many :favorites


## Wordlistsテーブル

| Column     | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| listname   | string     | null: false                    |
| text       | text       | null: false                    |
| release_id | integer    | null: false                    |
| user       | references | null: false, foreign_key: true | 

## Association

- belongs_to :user
- has_many :words
- has_many :favorites
- has_many :Authorities

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

## Authoritiesテーブル

| Column              | Type       | Option                         |
| ------------------- | ---------- | ------------------------------ |
| authority_user_code | integer    | null: false                    |
| wordlist            | references | null: false, foreign_key: true |

- belongs_to :wordlist