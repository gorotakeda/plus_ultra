FactoryBot.define do
  factory :review do
    user { nil }
    post { nil }
    content { "MyString" }
    score { 1 }
  end
end
