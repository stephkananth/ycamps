class CamperRegistration < ApplicationRecord
  belongs_to :camp
  belongs_to :camper
end
