class AddItineraryToTour < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :country, :string
    add_column :tours, :state, :string
  end
end
