# frozen_string_literal: true

class Branch < ApplicationRecord
  # relationships
  has_many :locations
  has_many :camps, through: :locations

  # validations
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  # scopes
  scope :alphabetical, -> {order('name')}
  scope :search, ->(term) {where('name LIKE ?', "#{term}%")}
  scope :not_in_system?, ->(branch) { where(name: branch.name) }

  # callbacks

  # public methods

  # private methods
end
