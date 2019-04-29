# frozen_string_literal: true

class Parent < ApplicationRecord
  # relationships
  belongs_to :user
  has_many :campers

  # scopes
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :alphabetical, -> { joins(:user).order('last_name, first_name') }

  # validations
  validates_numericality_of :user_id, only_integer: true, greater_than: 0

  # public methods
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
