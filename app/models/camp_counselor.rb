class CampCounselor < ApplicationRecord
  belongs_to :camp
  belongs_to :counselor

  # validations
  validates :camp_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :counselor_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validate :counselor_is_not_already_assigned_to_camp, on: :create
  validate :counselor_is_not_already_assigned_to_another_camp_at_same_time, on: :create
  validate :counselor_is_active_in_system
  validate :camp_is_active_in_system

  private
  def counselor_is_not_already_assigned_to_camp
    return true if self.camp.nil? || self.counselor.nil?
    unless CampCounselor.where(camp_id: self.camp_id, counselor_id: self.counselor_id).to_a.empty?
      errors.add(:base, "Counselor has already been assigned to this camp")
    end
  end

  def counselor_is_not_already_assigned_to_another_camp_at_same_time
    return true if self.camp.nil? || self.counselor.nil?
    other_counselors_teaching_at_that_time = Camp.where(start_date: self.camp.start_date, time_slot: self.camp.time_slot).map{|c| c.instructors }.flatten
    if other_counselors_teaching_at_that_time.include?(self.counselor)
      errors.add(:base, "Counselor is already assigned to another camp at this time")
    end
  end

  def counselor_is_active_in_system
    is_active_in_system(:counselor)
  end

  def camp_is_active_in_system
    is_active_in_system(:camp)
  end
end
