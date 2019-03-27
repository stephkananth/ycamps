class CampBadge < ApplicationRecord
	# relationships
	belongs_to :badge
	belongs_to :camp

	# validations
	validates_presence_of :badge_id, :camp_id

	# scopes
	scope :alphabetical, -> { joins(:camp).order('name') }

	# callbacks

	# public methods

	# private methods

end
