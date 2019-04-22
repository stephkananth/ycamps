class CamperRegistration < ApplicationRecord
  belongs_to :camp
  belongs_to :camper

  validate :camper_is_not_already_registered_to_another_camp_at_same_time, on: :create
  validate :registration_is_not_a_duplicate, on: :create


  def registration_is_not_a_duplicate
    return true if camp_id.nil? || camper_id.nil?
    if already_exists?
      errors.add(:base, 'already exists')
    end
  end

  def already_exists?
    CamperRegistration.where(camp_id: camp_id, camper_id: camper_id) > 0
  end

  def camper_is_not_already_registered_to_another_camp_at_same_time
    return true if camp.nil? || student.nil?
    other_campers_registered_at_that_time = Camp.where(start_date: camp.start_date).map(&:campers).flatten
    if other_campers_registered_at_that_time.include?(student)
      errors.add(:base, 'Camper is already registered for another camp at this time')
    end
  end
end