class Style < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'ジムトレーニング' },
    { id: 2, name: '自重トレーニング' },
  ]
  include ActiveHash::Associations
  has_many :posts
end
