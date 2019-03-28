class Badge < ApplicationRecord

	# relationships
	belongs_to :skill
	has_many :camps

	# validations
	validates_presence_of :skill_id
	validates :name, presence: true, uniqueness: { case_sensitive: false }

	# scopes
	scope :alphabetical, -> { order('name') }

	# callbacks

	# public methods

	# private methods
end
