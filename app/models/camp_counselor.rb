class CampCounselor < ApplicationRecord
  belongs_to :camp
  belongs_to :counselor

  # validations
  validates :camp_id, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :counselor_id, presence: true, numericality: { greater_than: 0, only_integer: true }

end
