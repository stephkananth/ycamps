# frozen_string_literal: true

class Camper < ApplicationRecord
  # relationships
  belongs_to :parent
  has_many :camper_registrations
  has_many :camps, through: :camper_registrations
  has_many :camper_camp_badges
  has_many :camp_badges, through: :camper_camp_badges
  has_many :badges, through: :camp_badges

  # validations
  validates_presence_of :first_name, :last_name
  validates_numericality_of :parent_id, only_integer: true, greater_than: 0
  validate :camper_is_not_a_duplicate, on: :create

  # scopes
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :alphabetical, -> { order('last_name, first_name') }

  # public methods
  def self.not_in_system?(camper)
    # used in importer
    Camper.where(first_name: camper.first_name, last_name: camper.last_name).empty?
  end

  def name
    last_name + ', ' + first_name
  end

  def proper_name
    first_name + ' ' + last_name
  end

  def current_camp_badge
    camper_camp_badges.each do |camper_camp_badge|
      if camper_camp_badge.camp_badge.camp.current?
        return camper_camp_badge.camp_badge
      end
    end
  end

  def current_badge
    camper_camp_badges.each do |camper_camp_badge|
      if camper_camp_badge.camp_badge.camp.current?
        return camper_camp_badge.camp_badge.badge
      end
    end
  end

  def current_tasks
    if camper_camp_badges.count != 0
      current_badge.camper_camp_badges.where(camper_id: id, camp_badge_id: current_camp_badge.id).first.camper_camp_badge_tasks
    end
  end

  private

  # private methods
  def camper_is_not_a_duplicate
    return true if first_name.nil? || last_name.nil? || parent_id.nil?

    errors.add(:base, 'already exists') if already_exists?
  end

  def already_exists?
    Camper.where(first_name: first_name, last_name: last_name, parent_id: parent_id).size == 1
  end
end
