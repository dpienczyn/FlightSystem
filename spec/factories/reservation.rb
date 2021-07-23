FactoryBot.define do
  factory :reservation do
    number { Faker::Number.unique.number(digits: 2) }

    flight
    user
  end
end
