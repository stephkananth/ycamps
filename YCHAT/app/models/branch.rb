class Branch < ApplicationRecord
	has_many :locations
	has_many :camps, through: :locations
	
	# validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }

	# scopes
	scope :alphabetical, -> { order('name') }
	scope :search, ->(term) { where('name LIKE ?', "#{term}%") }
end
