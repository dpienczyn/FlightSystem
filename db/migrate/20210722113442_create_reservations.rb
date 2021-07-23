class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :number
      t.references :flight, foregin_key: true
      t.references :user, foregin_key: true
      
      t.timestamps
    end
  end
end
