class ItemClass < ActiveHash::Base
  self.data = [
    { id: 0, name: 'その他' },
    { id: 1, name: 'メイン料理' },
    { id: 2, name: 'サブ料理' },
    { id: 3, name: '汁物' },
    { id: 4, name: '飲み物' },
    { id: 5, name: 'デザート' },
    { id: 6, name: '雑用' }
  ]
  include ActiveHash::Associations
  has_many :items
end
