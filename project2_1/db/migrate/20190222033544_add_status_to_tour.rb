class AddStatusToTour < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :status, :string
  end
end
