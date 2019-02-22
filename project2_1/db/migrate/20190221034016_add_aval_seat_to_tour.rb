class AddAvalSeatToTour < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :aval_seat, :integer
  end
end
