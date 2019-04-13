# frozen_string_literal: true

class CamperCampBadgeTask < ApplicationRecord
  # relationships
  belongs_to :camper_camp_badge
  belongs_to :task

  # validations
  validates_presence_of :camper_camp_badge_id, :task_id

  # scopes
  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }

  # callbacks
  after_update do
    camper_camp_badge.completed = true if camper_camp_badge.completed?
  end

  # public methods

  # private methods
end
