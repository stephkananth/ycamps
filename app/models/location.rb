# frozen_string_literal: true

class Location < ApplicationRecord
  # relationships
  has_many :camps
  belongs_to :branch

  # validations
  validates_presence_of :branch_id
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validate :location_is_not_a_duplicate, on: :create

  # scopes
  scope :alphabetical, -> { order('name') }

  # public methods
  def self.not_in_system?(location)
    # used in importer
    Location.where(name: location.name).empty?
  end

  private

  # private methods
  def location_is_not_a_duplicate
    return true if branch_id.nil? || name.nil?

    errors.add(:base, 'already exists') if already_exists?
  end

  def already_exists?
    Location.where(branch_id: branch_id, name: name).size == 1
  end
end
