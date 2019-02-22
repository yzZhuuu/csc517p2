require "administrate/base_dashboard"

class TourDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    reviews: Field::HasMany,
    photos: Field::HasMany,
    users: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    created_at: Field::DateTime.with_options(format: "%b %d %Y  %H:%M:%S"),
    updated_at: Field::DateTime.with_options(format: "%b %d %Y  %H:%M:%S"),
    total_seat: Field::Number,
    aval_seat: Field::Number,
    status: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
      :id,
    :user,
    :name,
    #:status,
    :aval_seat,
    :created_at,
    :reviews,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
      :name,
      :user,
      :id,
      :created_at,
      :updated_at,
      :description,
      :status,
      :total_seat,
      :aval_seat,
      #:photos,
      :reviews,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :name,
    :description,
    :total_seat,
  #:review,
  #:photos,
  ].freeze

  # Overwrite this method to customize how tours are displayed
  # across all pages of the admin dashboard.
  #
   def display_resource(tour)
     tour.name
   end

end
