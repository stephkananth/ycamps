class Camper < ApplicationRecord
  belongs_to :parent
  has_many :camp_registrations
  has_many :camps, through: :camp_registrations
  has_many :camper_camp_badges
  has_many :camp_badges, through: :camper_camp_badges
  has_many :camps, through: :camp_badges

  validates_presence_of :first_name, :last_name
  validates_numericality_of :parent_id, only_integer: true, greater_than: 0

  scope :active, -> {where(active: true)}
  scope :inactive, -> {where(active: false)}
  scope :alphabetical, -> {order('last_name, first_name')}

  def self.not_in_system?(camper)
    Camper.where(first_name: camper.first_name, last_name: camper.last_name).empty?
  end

  def name
    last_name + ', ' + first_name
  end

  def proper_name
    first_name + ' ' + last_name
  end
end
