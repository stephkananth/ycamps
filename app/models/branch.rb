# frozen_string_literal: true

class Branch < ApplicationRecord
  # relationships
  has_many :locations
  has_many :camps, through: :locations

  # validations
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validate :branch_is_not_a_duplicate, on: :create

  # scopes
  scope :alphabetical, -> {order('name')}
  scope :search, ->(term) {where('name LIKE ?', "#{term}%")}

  # callbacks

  # public methods
  def self.not_in_system?(branch)
    Branch.where(name: branch.name).empty?
  end 
  
  def branch_is_not_a_duplicate
    return true if name.nil?
    if already_exists?
      errors.add(:base, 'already exists')
    end
  end

  def already_exists?
    Branch.where(name: name).size == 1
  end

  # private methods
end
