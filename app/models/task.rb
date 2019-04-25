# frozen_string_literal: true

class Task < ApplicationRecord
  # relationships
  belongs_to :badge

  # validations
  validates_presence_of(:badge_id)
  validate :task_is_not_a_duplicate, on: :create

  # scopes
  scope :alphabetical, -> {order(name: :asc)}
  scope :in_order, -> {order(order: :asc)}

  # callbacks

  # public methods
  def task_is_not_a_duplicate
    return true if badge_id.nil? || name.nil? || order.nil?

    errors.add(:base, 'already exists') if already_exists?
  end

  def already_exists?
    Task.where(badge_id: badge_id, name: name, order: order).size == 1
  end

  # private methods
end
