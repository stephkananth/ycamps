class Location < ApplicationRecord
	belongs_to :branch
	has_many :camps

	# validations
	validates :name, presence: true, uniqueness: { case_sensitive: false }

	# scopes
	scope :alphabetical, -> { order('name') }
	scope :search, ->(term) { where('name LIKE ?', "#{term}%") }
end
