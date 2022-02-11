class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :quantity, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100, message: "is invalid"}
    validates :image
  end  
end
