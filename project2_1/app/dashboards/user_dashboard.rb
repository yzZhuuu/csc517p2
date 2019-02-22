require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    tours: Field::HasMany,
    reviews: Field::HasMany,
    photos: Field::HasMany,
    id: Field::Number,#.with_options(prefix: "USER",),
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    created_at: Field::DateTime.with_options(format: "%b %d %Y  %H:%M:%S"),
    updated_at: Field::DateTime.with_options(format: "%b %d %Y  %H:%M:%S"),
    role: Field::String,
    name: Field::String,
    password: PasswordField,
    password_confirmation: PasswordField,

  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
      :id,
      :role,
      :name,
      :email,
      :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
      :name,
      :id,
      :role,
      :email,
      :created_at,
      :updated_at,
      :tours,
      :reviews,
      :photos,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
      :name,
      :email,
      :password,
      :password_confirmation,
      :role,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "#{user.name} (#{user.role})"
  end

  # def valid_action?(name, resource = resource_class)
  #   %w[edit destroy].exclude?(name.to_s) && super
  # end
end
