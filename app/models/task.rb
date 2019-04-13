# frozen_string_literal: true

class Task < ApplicationRecord
  # relationships
  belongs_to :badge

  # validations
  validates_presence_of(:badge_id)

  # scopes
  scope :in_order, -> { order('level') }

  # callbacks

  # public methods

  # private methods
end
