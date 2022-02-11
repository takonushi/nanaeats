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
| price                | integer    |                                |
| retailer             | string     |                                |
| explanation          | text       |                                |
| quantity             | integer    | num: false                     |
| user                 | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - has_one :order

## orders テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| order_date           | date       | null: false                    |
| order_comment        | text       |                                |
| used_item            | integer    | null: false
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |

### Association
 - belongs_to :user
 - belongs_to :item
