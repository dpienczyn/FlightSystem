json.extract! flight, :id, :departure_date, :time, :departure, :arrival, :flight_length, :number_of_seats, :created_at, :updated_at
json.url flight_url(flight, format: :json)
