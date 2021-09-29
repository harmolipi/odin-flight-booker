class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.references :from_airport, references: :airport, null: false, foreign_key: { to_table: :airports }
      t.references :to_airport, references: :airport, null: false, foreign_key: { to_table: :airports }
      t.datetime :departure
      t.integer :duration
      t.string :flight_number

      t.timestamps
    end
  end
end
