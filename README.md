# アプリケーション名
NANAEATS

# アプリケーション概要
(家庭向け)食材の在庫管理・料理作成依頼アプリケーション

# URL
https://nanaeats.herokuapp.com/

# テスト用アカウント
・Basic認証パスワード： xxxx  
・Basic認証用ID: admin  
・メールアドレス： testuser@test.com  
・パスワード： test1234  


# 利用方法

## 食材登録
1. トップページより登録したユーザーにてログインを行う  
2. トップページの[マスター管理]より、登録したい食材の内容(商品画像・商品名・商品分類・商品の説明・購入先・価格・在庫)を入力し、[登録する]を押す。

## 注文管理
1. トップページより登録したユーザーにてログインを行う
2. 利用者は調理して欲しい食材の画像を選択する。(トップページにある検索ボタンや[詳細検索]ボタンより検索が可能)
3. [詳細画面]が表示されるので[注文画面に進む]を押す。
4. 注文コメント(任意)を入力し、[注文する]を押す。
5. (現段階では実装者のみ)LINEに注文が行われた旨の通知が届く。
6. 調理者は注文内容を確認する。必要に応じてステータス変更や在庫の数量変更を行う。
7. 調理完了後はトップページの[オーダークリア]を押すと注文状態のクリアが行われる。

## スケジュール確認
1. トップページより登録したユーザーにてログインを行う。
2. トップページの[スケジュール表]を押す。
3. 調理者が料理可能かどうかの確認や[New Schedule]よりスケジュールの登録を行うことができる。

# アプリケーションを作成した背景
開発者は夫婦共働きでコロナ禍となり在宅勤務をすることが多くなった。
その際に奥様が仕事帰りに食べたいものを選んで注文することで要望に沿った料理を作って待っていたいという想いよりアプリを開発しました。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/19llQ6NsXxpbO7JDfHrssogeq17g7dGya8-WhdZcv1Ys/edit?usp=sharing

# 実装した機能についての画像やGIF及びその説明

# 実装予定の機能
・ページネーション機能  
・行動評価システム(査定管理)  

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/2469b94cb6164358cb7635c56690bc18.png)](https://gyazo.com/2469b94cb6164358cb7635c56690bc18)

# 画面遷移図

# 開発環境

# ローカルでの動作方法

# 工夫したポイント

# テーブル設計

## users テーブル
| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |

### Association
 - has_many :items
 - has_many :orders

## items テーブル ※商品画像はActiveStorageによる実装
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| item_class_id        | integer    | null: false                    |
| price                | integer    |                                |
| retailer             | string     |                                |
| explanation          | text       |                                |
| quantity             | integer    | num: false                     |
| user                 | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - has_one :order

## orders テーブル order_statusはActiveHashによる実装
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| order_date           | date       | null: false                    |
| order_comment        | text       |                                |
| order_status_id      | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :item
