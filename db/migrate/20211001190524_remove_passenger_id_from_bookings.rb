class RemovePassengerIdFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_index :bookings, :passenger_id
    remove_column :bookings, :passenger_id, :integer
  end
end
