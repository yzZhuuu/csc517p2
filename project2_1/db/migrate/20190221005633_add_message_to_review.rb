class AddMessageToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :message, :text
  end
end
