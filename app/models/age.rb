class Age < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '10代' },
    { id: 2, name: '20代' },
    { id: 3, name: '30代' },
    { id: 4, name: '40代〜' },
    { id: 5, name: '60代〜 ' },
  ]
  include ActiveHash::Associations
  has_many :posts
end
