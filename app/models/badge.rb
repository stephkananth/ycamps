# frozen_string_literal: true

class Badge < ApplicationRecord
  # relationships
  belongs_to :skill
  has_many :camp_badges
  has_many :tasks
  has_many :camper_camp_badges, through: :camp_badges

  # validations
  validates_presence_of :skill_id
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validate :badge_is_not_a_duplicate, on: :create

  # scopes
  scope :alphabetical, -> {order('name')}

  # callbacks

  # public methods
  def camps
    CampBadge.where(badge_id: id).map(&:camp)
  end

  # private methods
  def badge_is_not_a_duplicate
    return true if name.nil? || level.nil? || skill_id.nil?

    errors.add(:base, 'already exists') if already_exists?
  end

  def already_exists?
    Badge.where(name: name, level: level, skill_id: skill_id).size == 1
  end
end
