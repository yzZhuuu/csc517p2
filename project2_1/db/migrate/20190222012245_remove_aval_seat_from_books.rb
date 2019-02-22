class RemoveAvalSeatFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :aval_seat
  end
end
