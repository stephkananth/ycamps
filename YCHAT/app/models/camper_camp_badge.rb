class CamperCampBadge < ApplicationRecord
	# relationships
  belongs_to :camp_badge
  belongs_to :camper
  has_many :camper_camp_badge_tasks
	
	# validations
	

	# scopes

	# callbacks

	# public methods

	# private methods

end
