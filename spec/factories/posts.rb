FactoryBot.define do
  factory :post do
    title      { Faker::Lorem.sentence }
    meal       { Faker::Lorem.sentence }
    workout    { Faker::Lorem.sentence }
    sex_id     { 1 }
    age_id     { 1 }
    style_id   { 1 }
    purpose_id { 1 }
    association :user
  end
end
