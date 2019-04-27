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

  # scopes
  scope :alphabetical, -> { joins(:camp).order('name') }
end
