class CreateWaitlists < ActiveRecord::Migration[5.2]
  def change
    create_table :waitlists do |t|
      t.integer :tour_id
      t.integer :user_id

      t.integer :wait_num #a user may reserve serval seats in waitlist


      t.timestamps
    end
  end
end
