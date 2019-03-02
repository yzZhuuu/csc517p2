class Tour < ApplicationRecord
#class Tour < ActiveRecord::Base
  # include Filterable
  #
  # filterrific(
  #     default_filter_params: { sorted_by: 'created_at_desc' },
  #     available_filters: [
  #         :sorted_by,
  #         :search_query,
  #         :with_country_id,
  #         :with_created_at_gte
  #     ]
  #)

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
  validates :start_location, format: { with: /\A([a-zA-Z]+(?:[\s-]*[a-zA-Z]+)?)+\z/, message: 'format is not correct'}

  validate :country_state_size_must_match
  validates :name, uniqueness: true
  validates :name, :price, :total_seat, :aval_seat, :start_location, :status, :country, :state, :user_id, presence: true

  # validates :country, format: { with: /\A(([a-zA-Z]+\ ?)\ ?\;?\ ?)+\z/, message: 'country format is not correct'}
  # validates :state, format: { with: /\A(([a-zA-Z]+\ ?)\,?\ ?\;?\ ?)+\z/, message: 'state format is not correct'}

  def self.search(search)
    where("name LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%")
  end

  private

  def country_state_size_must_match
    return unless country and state
    errors.add(:country, "must be the same number as states") unless
        country.split(';').length == state.split(';').length
  end

end
