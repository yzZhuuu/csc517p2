class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :tour_name
      t.integer :tour_id
      t.text :description
      # need to have a photo column!!
      t.integer :price
      t.date :book_deadline
      t.date :start_time
      t.date :end_time
      t.string :start_location
      t.string :contact_info
      t.integer :total_seat
      t.integer :available_seat
      t.string :status

      # t.string :booked_user_id; already has a table for bookmark
      # t.integer :waitlist; already has a table for waitlist


      t.timestamps
    end
  end
end
