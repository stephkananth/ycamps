class Counselor < ApplicationRecord
  belongs_to :user
  has_many :counselor_camp_badges
  has_many :camp_badges, through: :counselor_camp_badges
  has_many :camps, through: :camp_counselors

  # validations
  validates_numericality_of :user_id, only_integer: true, greater_than: 0

  # scopes
  scope :active, -> {where(active: true)}
  scope :inactive, -> {where(active: false)}
  scope :alphabetical, -> {joins(:user).order('last_name, first_name')}

  # callbacks
  # before_destroy do
  #   cannot_destroy_object
  # end

  # methods
  def name
    user.last_name + ', ' + user.first_name
  end

  def proper_name
    user.first_name + ' ' + user.last_name
  end

  def first_name
    user.first_name
  end

  def last_name
    user.last_name
  end
end
