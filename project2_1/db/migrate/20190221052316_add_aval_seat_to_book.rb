class AddAvalSeatToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :aval_seat, :integer
  end
end
