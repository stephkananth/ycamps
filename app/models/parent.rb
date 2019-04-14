class Parent < ApplicationRecord
  # relationships
  belongs_to :user
  has_many :campers

  # scopes
  scope :alphabetical, -> {order('user.last_name, user.first_name')}

end
