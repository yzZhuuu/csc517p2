class AddOptionToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :choice, :string
  end
end
