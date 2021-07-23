FactoryBot.define do
  factory :flight do
    departure_date { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    time { Faker::Number.positive }
    departure { Faker::Nation.nationality }
    arrival  { Faker::Nation.nationality }
    flight_length { Faker::Number.positive }
    number_of_seats { Faker::Number.number(digits: 2) }
  end
end
