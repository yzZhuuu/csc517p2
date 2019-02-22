class AddTotalSeatToTour < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :total_seat, :integer
  end
end
