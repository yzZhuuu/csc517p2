class CreateTourItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :tour_itineraries do |t|

      t.integer :tour_id
      t.string :country
      t.string :state_province

      t.timestamps
    end
  end
end
