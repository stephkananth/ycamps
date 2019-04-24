class CounselorCampBadge < ApplicationRecord
  # relationships
  belongs_to :camp_badge
  belongs_to :counselor

  # validations
  validates_presence_of :camp_badge_id, :counselor_id

  # scopes

  # callbacks

  # public methods

  # private methods
end
