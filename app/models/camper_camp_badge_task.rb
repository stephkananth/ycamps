# frozen_string_literal: true

class CamperCampBadgeTask < ApplicationRecord
  # relationships
  belongs_to :camper_camp_badge
  belongs_to :task

  # validations
  validates_presence_of :camper_camp_badge_id
  validates_presence_of :task_id
  validate :camper_camp_badge_task_is_not_a_duplicate, on: :create

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

  # private methods
  def camper_camp_badge_task_is_not_a_duplicate
    return true if camper_camp_badge_id.nil? || task_id.nil?

    errors.add(:base, 'already exists') if already_exists?
  end

  def already_exists?
    CamperCampBadgeTask.where(camper_camp_badge_id: camper_camp_badge_id, task_id: task_id).size == 1
  end

  def mark_as_completed
    camper_camp_badge.complete
  end
end
