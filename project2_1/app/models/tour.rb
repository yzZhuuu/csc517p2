class Tour < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :photos
  has_many :books
  has_many :waitlists
  has_many :bookmarks

  has_many :users,through: :reviews
  has_many :users,through: :photos
  has_many :users,through: :waitlists
  has_many :users,through: :books
  has_many :users,through: :bookmarks

  validates :total_seat, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }





  # validates :book_seat, numericality: { only_integer: true }
end
