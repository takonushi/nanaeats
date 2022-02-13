FactoryBot.define do
  factory :user do
    nickname              {'suzuki'}
    email                 { Faker::Internet.free_email }
    password              { 'test1234' }
    password_confirmation { password }

  end
end
