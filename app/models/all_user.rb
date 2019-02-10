class AllUser < ApplicationRecord
  validates :name, :role, :user_id, :user_password, :user_name, presence: true
  validates :name, :user_id, :user_name, uniqueness: true
  validates_format_of :user_name,:with => Devise::email_regexp
  # repalce Devise with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

end
