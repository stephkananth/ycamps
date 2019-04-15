class Camper < ApplicationRecord
  belongs_to :parent

   def proper_name
    first_name + " " + last_name
  end
end
