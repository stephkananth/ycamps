# frozen_string_literal: true

class CamperCampBadgeTask < ApplicationRecord
  # relationships
  belongs_to :camper_camp_badge
  belongs_to :task

  # validations
  validates_presence_of :camper_camp_badge_id
  validates_presence_of :task_id

  # scopes
  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }

  # callbacks
  after_update do
    mark_as_completed if camper_camp_badge.completed?
  end

  # public methods
  def complete
    self.completed = true
    camper_camp_badge.complete if camper_camp_badge.completed?
    save!
  end

  private

  def mark_as_completed
    camper_camp_badge.complete
  end

  # private methods
end
