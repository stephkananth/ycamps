class Camper < ApplicationRecord
  belongs_to :parent
  has_many :camp_registrations
  has_many :camps, through: :camp_registrations

   def proper_name
    first_name + " " + last_name
  end
end
