class CreateAllUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :all_users do |t|
      t.string :user_name
      t.string :role
      t.string :name
      t.string :user_password
      t.integer :user_id


      t.timestamps
    end
  end
end
