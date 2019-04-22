# frozen_string_literal: true

class CampBadge < ApplicationRecord
  # relationships
  belongs_to :badge
  belongs_to :camp
  has_many :camper_camp_badges
  has_many :counselor_camp_badges
  has_many :counselors, through: :counselor_camp_badges

  # validations
  validates_presence_of :badge_id, :camp_id
  validate :camp_badge_is_not_a_duplicate, on: :create

  # scopes
  scope :alphabetical, -> {joins(:camp).order('name')}

  # public methods
  def camp_badge_is_not_a_duplicate
    return true if badge_id.nil? || camp_id.nil?
    if already_exists?
      errors.add(:base, 'already exists')
    end
  end

  def already_exists?
    CampBadge.where(badge_id: badge_id, camp_id: camp_id) > 0
  end

  # private methods
end
