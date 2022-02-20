class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :order_status;
end
