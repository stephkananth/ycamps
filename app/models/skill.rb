# frozen_string_literal: true

class Skill < ApplicationRecord
  # relationships
  has_many :badges

  # validations
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates_presence_of :category
  validate :skill_is_not_a_duplicate, on: :create

  # scopes
  scope :alphabetical, -> {order('name')}

  # callbacks

  # public methods
  def number_of_badges
    badges.to_a.size
  end

  def skill_is_not_a_duplicate
    return true if category.nil? || name.nil?
    if already_exists?
      errors.add(:base, 'already exists')
    end
  end

  def already_exists?
    Skill.where(category: category, name: name) == 1
  end

  # private methods
end
