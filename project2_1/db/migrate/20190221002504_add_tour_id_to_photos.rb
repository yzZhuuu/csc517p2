class AddTourIdToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_reference :photos, :tour, foreign_key: true
  end
end
