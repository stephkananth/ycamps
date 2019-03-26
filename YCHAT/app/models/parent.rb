class Parent < ApplicationRecord
	# relationships
	belongs_to :user
	has_many :campers
end
