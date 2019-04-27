# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # validations
  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :role, inclusion: { in: %w[admin counselor parent], message: 'is not a recognized role in system' }
  validates_presence_of :password, on: :create
  validates_presence_of :password_confirmation, on: :create
  validates_confirmation_of :password, message: 'does not match'
  validates_length_of :password, minimum: 8, message: 'must be at least 8 characters long', allow_blank: true
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil))\z/i, message: 'is not a valid format'
  validate :user_is_not_a_duplicate, on: :create

  # scopes
  scope :search, ->(term) { where('email LIKE ?', "#{term}%") }

  # for use in authorizing with CanCan
  ROLES = [['Admin', :admin], ['Counselor', :counselor], ['Parent', :parent]].freeze

  # additional functions
  def user_is_not_a_duplicate
    return true if email.nil?

    errors.add(:base, 'already exists') if already_exists?
  end

  def already_exists?
    User.where(email: email).size == 1
  end

  def role?(authorized_role)
    return false if role.nil?

    role.downcase.to_sym == authorized_role
  end

  # login by email
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
