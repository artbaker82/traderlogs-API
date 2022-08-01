FactoryBot.define do
  factory :trading_system do
    user
    name { Faker::Book.title }
  end
end