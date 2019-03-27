class CounselorCampBadge < ApplicationRecord
	# relationships
	belongs_to :camp_badge
	belongs_to :counselor

	# validations
	validates_presence_of :camp_badge_id, :counselor_id
  validate :counselor_is_not_already_assigned_to_camp, on: :create
  validate :counselor_is_not_already_assigned_to_another_camp_at_same_time, on: :create

	# scopes

	# callbacks

	# public methods

	# private methods
  private

  def counselor_is_not_already_assigned_to_camp
    return true if camp.nil? || counselor.nil?
    unless CounselorCampBadge.where(camp_id: camp_id, counselor_id: counselor_id).to_a.empty?
      errors.add(:base, 'counselor has already been assigned to this camp')
    end
  end

  def counselor_is_not_already_assigned_to_another_camp_at_same_time
    return true if camp.nil? || counselor.nil?
    other_counselors_teaching_at_that_time = Camp.where(start_date: camp.start_date).map(&:counselors).flatten
    if other_counselors_teaching_at_that_time.include?(counselor)
      errors.add(:base, 'counselor is already assigned to another camp at this time')
    end
  end
end
