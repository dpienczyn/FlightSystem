class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.date :departure_date
      t.integer :time
      t.string :departure
      t.string :arrival
      t.integer :flight_length
      t.integer :number_of_seats

      t.timestamps
    end
  end
end
