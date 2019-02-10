class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|

      t.integer :booking_id
      t.integer :user_id
      t.integer :tour_id
      t.integer :booked_seat


      t.timestamps
    end
  end
end
