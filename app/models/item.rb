class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :item_class_id
    validates :quantity,
              numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100,
                              message: 'は0~100の値を半角数値で入力してください' }
    validates :image, presence: { message: 'を選択してください' }
  end
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10_000, message: 'は1~10000の値を半角数値で入力してください' }, allow_nil: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_class
end
