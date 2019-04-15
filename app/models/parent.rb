class Parent < ApplicationRecord
  # relationships
  belongs_to :user
  has_many :campers

  def proper_name
    self.user.first_name + " " + self.user.last_name
  end
end
