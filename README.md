# アプリケーション名
NANAEATS

# アプリケーション概要
(家庭向け)食材の在庫管理・料理作成依頼アプリケーション

# URL
https://nanaeats.herokuapp.com/

# テスト用アカウント
・Basic認証パスワード： xxxx  (※未記載)
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
トップページ  
[![Image from Gyazo](https://i.gyazo.com/b2193417b8bedc0c8e5f2fc0d2c11103.png)](https://gyazo.com/b2193417b8bedc0c8e5f2fc0d2c11103)
マスター登録
[![Image from Gyazo](https://i.gyazo.com/5a39c060da53e2cf7229f0a9d3832f19.png)](https://gyazo.com/5a39c060da53e2cf7229f0a9d3832f19)
商品詳細
[![Image from Gyazo](https://i.gyazo.com/fe65094281960df6f260e37f06e00a90.png)](https://gyazo.com/fe65094281960df6f260e37f06e00a90)
商品注文
[![Image from Gyazo](https://i.gyazo.com/9205f1d8e53e304a332dd5c32ae74a18.png)](https://gyazo.com/9205f1d8e53e304a332dd5c32ae74a18)
詳細検索
[![Image from Gyazo](https://i.gyazo.com/d952a7dcbedbeada82bae9faa757a4f5.png)](https://gyazo.com/d952a7dcbedbeada82bae9faa757a4f5)
スケジュール表
[![Image from Gyazo](https://i.gyazo.com/9df607ab2d1f06a6170fb4c9280126b0.png)](https://gyazo.com/9df607ab2d1f06a6170fb4c9280126b0)
在庫一括修正
[![Image from Gyazo](https://i.gyazo.com/16f7f0773cc0e456904f4f15c4931bd9.png)](https://gyazo.com/16f7f0773cc0e456904f4f15c4931bd9)


# 実装予定の機能
・ページネーション機能  
・行動評価システム(査定管理)  
・注文履歴の管理、閲覧  
・カート機能の実装  


# データベース設計
[![Image from Gyazo](https://i.gyazo.com/2469b94cb6164358cb7635c56690bc18.png)](https://gyazo.com/2469b94cb6164358cb7635c56690bc18)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/e30367d8fef6e2a45c01d85732a6e095.png)](https://gyazo.com/e30367d8fef6e2a45c01d85732a6e095)

# 開発環境
Ruby on Rails / JavaScript

# ローカルでの動作方法
未記載

# 工夫したポイント
注文時に通知を受け取る為にLINE Notifyと連携し、通知設定を行いました。  
利便性を上げる為になるべく画面遷移回数が少なくなるような画面設計をしました。  
注文承諾時に在庫の数量も変更出来る様に複数テーブル(item/order)をまたぐ更新処理を実装しました。
画面はレスポンシブデザインでの実装を行い、スマートフォンからでも見易い画面となる様に実装を行いました。


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
