FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1q' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end