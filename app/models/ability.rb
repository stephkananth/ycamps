# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # set user to new User if not logged in
    user ||= User.new # i.e., a guest user

    # set authorizations for different user roles
    if user.role? :admin
      # they get to do it all
      can :manage, :all

    elsif user.role? :counselor

      # can read curriculums, locations, and camps
      can :read, Curriculum
      can :read, Camper
      can :read, Skill
      can :read, Camp
      can :read, Badge

      # they can read their own profile
      can :show, User do |u|
        u.id == user.id
      end

      # they can update their own profile
      can :update, User do |u|
        u.id == user.id
      end

      can :update, Counselor do |this_counselor|
        Counselor.where(user_id: user).first == this_counselor
      end

      # they can read their own students' data
      can :show, Camper do |this_camper|
        my_camps = Counselor.where(user_id: user).first.camps
        my_campers = my_camps.map(&:campers).flatten
        my_campers.include? this_camper
      end

    elsif user.role? :parent
      # can read curriculums and camps
      can :show, Badge
      can :show, Camper

      can :instructors, Camp
      can :students, Camp

      # they can read their own profile
      can :show, User do |u|
        u.id == user.id
      end

      # they can update their own profile
      can :update, User do |u|
        u.id == user.id
      end

      can :show, Camper do |this_camper|
        pid = Parent.where(user_id: current_user.id).first
        my_campers = Camper.where(parent_id: pid).first.campers.map(&:id)
        my_campers.include? this_camper.id
      end

      can :update, Camper do |this_camper|
        pid = Parent.where(user_id: current_user.id).first
        my_campers = Camper.where(parent_id: pid).first.campers.map(&:id)
        my_campers.include? this_camper.id
      end
    else
      nil
    end
  end
end
