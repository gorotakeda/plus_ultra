class Age < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '〜19' },
    { id: 2, name: '20 〜 30' },
    { id: 3, name: '30 〜 40' },
    { id: 4, name: '40 〜 50' },
    { id: 5, name: '60〜 ' },
  ]
  include ActiveHash::Associations
  has_many :posts
end
