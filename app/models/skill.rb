# frozen_string_literal: true

class Skill < ApplicationRecord
  # relationships
  has_many :badges

  # validations
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates_presence_of :category

  # scopes
  scope :alphabetical, -> {order('name')}

  # callbacks

  # public methods
  def number_of_badges
    badges.to_a.size
  end

  # private methods
end
