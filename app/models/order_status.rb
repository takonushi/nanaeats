class OrderStatus < ActiveHash::Base
  self.data = [
    {id: 1, name: '注文依頼中' },
    {id: 2, name: '注文承諾済み' },
    {id: 3, name: '調理完了済み' },
  ]
  include ActiveHash::Associations
    has_many :orders
end