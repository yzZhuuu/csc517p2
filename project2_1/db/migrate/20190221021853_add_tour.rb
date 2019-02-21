class AddTour < ActiveRecord::Migration[5.2]
  change_table :users do |t|
    #t.remove :description, :name
    t.string :role
    t.string :name
    #t.rename :upccode, :upc_code
  end
end
