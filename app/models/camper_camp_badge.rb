# frozen_string_literal: true

class CamperCampBadge < ApplicationRecord
  # relationships
  belongs_to :camp_badge
  belongs_to :camper
  has_many :camper_camp_badge_tasks

  # validations
  validates_presence_of :camp_badge_id, :camper_id

  # scopes
  scope :completed, -> {where(completed: true)}
  scope :incomplete, -> {where(completed: false)}

  # callbacks

  # public methods
  def completed?
    camper_camp_badge_tasks.completed.count == 4
  end

  # private methods
end
