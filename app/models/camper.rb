# frozen_string_literal: true

class Camper < ApplicationRecord
  belongs_to :parent
  has_many :camper_registrations
  # has_many :camps, through: :camper_registrations
  has_many :camper_camp_badges
  has_many :camp_badges, through: :camper_camp_badges
  has_many :camps, through: :camp_badges
  has_many :badges, through: :camp_badges

  validates_presence_of :first_name, :last_name
  validates_numericality_of :parent_id, only_integer: true, greater_than: 0

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :alphabetical, -> { order('last_name, first_name') }

  def name
    last_name + ', ' + first_name
  end

  def proper_name
    first_name + ' ' + last_name
  end

  def current_badge
    camper_camp_badges.each do |camper_camp_badge|
      if camper_camp_badge.camp_badge.camp.current?
        return camper_camp_badge.camp_badge.badge
      end
    end
  end
end
