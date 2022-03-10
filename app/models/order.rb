class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :order_date
    validates :order_status_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order_status
end
