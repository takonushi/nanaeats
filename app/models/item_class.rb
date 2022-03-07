class ItemClass < ActiveHash::Base
  self.data = [
    { id: 0, name: 'その他' },
    { id: 1, name: 'ご飯' },
    { id: 2, name: '汁物' },
    { id: 3, name: '麺類' },
    { id: 4, name: '肉' },
    { id: 5, name: '魚' }
  ]
  include ActiveHash::Associations
  has_many :items
end
