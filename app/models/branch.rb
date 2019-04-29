# frozen_string_literal: true

class Branch < ApplicationRecord
  # relationships
  has_many :locations
  has_many :camps, through: :locations

  # validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validate :branch_is_not_a_duplicate, on: :create

  # scopes
  scope :alphabetical, -> { order('name') }

  # public methods

  def self.not_in_system?(branch)
    # used in importer
    Branch.where(name: branch.name).empty?
  end

  private

  # private methods
  def branch_is_not_a_duplicate
    return true if name.nil?

    errors.add(:base, 'already exists') if already_exists?
  end

  def already_exists?
    Branch.where(name: name).size == 1
  end
end
