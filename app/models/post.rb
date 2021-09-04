class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :sex
  belongs_to :age
  belongs_to :style
  belongs_to :purpose
  has_many :reviews, dependent: :destroy

  with_options presence: true do
   validates :title
   validates :workout
   validates :meal
  end

  with_options numericality: { other_than: 0 } do
    validates :sex_id
    validates :age_id
    validates :style_id
    validates :purpose_id
  end
end
