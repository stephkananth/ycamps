# frozen_string_literal: true

class CamperCampBadge < ApplicationRecord
  # relationships
  belongs_to :camp_badge
  belongs_to :camper
  has_many :camper_camp_badge_tasks

  # validations
  validates_presence_of :camp_badge_id, :camper_id
  validate :camper_camp_badge_is_not_a_duplicate, on: :create

  # scopes
  scope :completed, -> {where(completed: true)}
  scope :incomplete, -> {where(completed: false)}

  # callbacks

  # public methods
  def completed?
    camper_camp_badge_tasks.completed.count == camp_badge.badge.tasks.count
  end

  def complete
    if completed?
      self.completed = true
      save!
    end
  end

  def tasks
    camper_camp_badge_tasks
  end

  def camper_camp_badge_is_not_a_duplicate
    return true if camp_badge_id.nil? || camper_id.nil?
    if already_exists?
      errors.add(:base, 'already exists')
    end
  end

  def already_exists?
    CamperCampBadge.where(camp_badge_id: camp_badge_id, camper_id: camper_id).size == 1
  end
  # private methods
end
