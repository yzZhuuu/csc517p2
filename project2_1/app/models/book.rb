class Book < ApplicationRecord

  belongs_to :user
  belongs_to :tour

  validates :book_seat, numericality: { only_integer: true, greater_than: 0 }
end
