class CamperRegistration < ApplicationRecord
  belongs_to :camp
  belongs_to :camper

  def self.not_in_system?(camp, camper)
    CamperRegistration.where(camp: camp, camper: camper).empty?
  end
end
