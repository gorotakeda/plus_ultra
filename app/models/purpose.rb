class Purpose < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'ダイエット' },
    { id: 2, name: '筋力アップ' },
    { id: 3, name: '健康維持' },
  ]
  include ActiveHash::Associations
  has_many :posts
end
