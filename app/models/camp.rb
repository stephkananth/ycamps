# frozen_string_literal: true

class Camp < ApplicationRecord
  # relationships
  belongs_to :location
  has_one :branch, through: :location
  has_many :camp_badges
  has_many :badges, through: :camp_badges
  has_many :camper_camp_badges, through: :camp_badges
  has_many :campers, through: :camper_camp_badges
  has_many :counselor_camp_badges, through: :camp_badges
  has_many :counselors, through: :camp_counselors

  has_many :campers, through: :camp_registrations

  # validations
  validates_presence_of :location_id, :name, :program, :start_date, :end_date
  # validates_date :start_date, on_or_after: -> { Date.today }, on_or_after_message: 'cannot be in the past', on: :create
  validates_date :end_date, on_or_after: :start_date
  validate :camp_is_not_a_duplicate, on: :create

  # scopes
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :alphabetical, -> { order('name') }
  scope :chronological, -> { order('start_date', 'end_date') }
  scope :upcoming, -> { where('start_date > ?', Date.today) }
  scope :past, -> { where('end_date < ?', Date.today) }
  scope :current, -> { where('start_date <= ? and end_date >= ?', Date.today, Date.today) }

  # callbacks
  # before_destroy do
  #   check_if_has_registrations
  #   if errors.present?
  #     @destroyable = false
  #     throw(:abort)
  #   end
  # end

  # public methods
  def campers
    result = []
    camp_badges.each do |camp_badge|
      result << CamperCampBadge.where(camp_badge_id: camp_badge.id).map(&:camper)
    end
    result
  end

  def already_exists?
    Camp.where(location_id: location_id, name: name, program: program, start_date: start_date, end_date: end_date).size == 1
  end

  def current?
    (start_date <= Date.today) && (end_date >= Date.today)
  end

  # private methods

  private

  def camp_is_not_a_duplicate
    return true if start_date.nil? || location_id.nil?

    if already_exists?
      errors.add(:start_date, 'already exists for start date and location')
    end
  end

  def check_if_has_campers
    errors.add(:base, 'Cannot be deleted because there are current registrations.') unless campers.empty?
  end
end
