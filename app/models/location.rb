# frozen_string_literal: true

class Location < ApplicationRecord
  # relationships
  has_many :camps
  belongs_to :branch

  # validations
  validates_presence_of :branch_id
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  # scopes
  scope :alphabetical, -> {order('name')}
  scope :search, ->(term) {where('name LIKE ?', "#{term}%")}

  # callbacks

  # public methods
  def self.not_in_system?(location)
    Location.where(name: location.name).empty?
  end

  # private methods
end
