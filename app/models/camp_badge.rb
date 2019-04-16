# frozen_string_literal: true

class CampBadge < ApplicationRecord
  # relationships
  belongs_to :badge
  belongs_to :camp
  has_many :camper_camp_badges
  has_many :counselor_camp_badges

  # validations
  validates_presence_of :badge_id, :camp_id

  # scopes
  scope :alphabetical, -> {joins(:camp).order('name')}

  # callbacks
  before_destroy do
    cannot_destroy_object
  end
  # after_rollback :check_upcoming_camps

  # public methods

  # private methods

  private

  # def check_upcoming_camps
  #   if camps.upcoming.empty?
  #     self.active = false
  #   else
  #     errors.add(:base, 'There are upcoming camps associated with this curriculum so it cannot be made inactive.')
  #   end
  # end
end
