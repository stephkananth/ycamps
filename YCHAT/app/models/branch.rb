class Branch < ApplicationRecord
	# relationships
	has_many :locations
	has_many :camps, through: :locations

	# validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }

	# scopes
	scope :alphabetical, -> { order('name') }

	# callbacks

	# public methods

	# private methods
end
