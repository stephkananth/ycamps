class Counselor < ApplicationRecord
  belongs_to :user

  def proper_name
    self.user.first_name + " " + self.user.last_name
  end
end
