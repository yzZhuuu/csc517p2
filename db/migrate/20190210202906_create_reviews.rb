class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :review_id
      t.integer :user_id
      t.string :subject
      t.text :message


      t.timestamps
    end
  end
end
