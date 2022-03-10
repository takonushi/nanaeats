FactoryBot.define do
  factory :order do
    order_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    order_comment { Faker::Lorem.sentence }
    order_status_id { Faker::Number.between(from: 1, to: 4) }
    association :item
    association :user
  end
end
