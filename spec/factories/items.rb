FactoryBot.define do
  factory :item do
    name        { 'test' }
    price       { '1000' }
    retailer    { 'ネットスーパー' }
    explanation { Faker::Lorem.sentence }
    quantity    { Faker::Number.between(from: 0, to: 100) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image_png')
    end
  end
end
