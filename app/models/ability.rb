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
      can :read, Location
      can :read, Instructor
      can :read, Camp

      # they can read their own profile
      can :show, User do |u|  
        u.id == user.id
      end

      # they can update their own profile
      can :update, User do |u|  
        u.id == user.id
      end

      can :show, Instructor do |this_instructor|  
        Instructor.where(user_id: user).first == this_instructor
      end

      can :update, Instructor do |this_instructor|  
        Instructor.where(user_id: user).first == this_instructor
      end

      # they can read their own students' data
      can :show, Student do |this_student|  
        my_camps = Instructor.where(user_id: user).first.camps
        my_students = my_camps.map{|c| c.students }.flatten
        my_students.include? this_student 
      end

      # they can read their own students' family data
      can :show, Family do |this_family|  
        my_camps = Instructor.where(user_id: user).first.camps
        my_students = my_camps.map{|c| c.students }.flatten
        my_families = my_students.map{|s| s.family}.flatten
        my_families.include? this_family
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
      can :read, Camp
      can :read, Curriculum
      can :read, Location
      can :instructors, Camp
      can :students, Camp
      
      can :create, User
      can :create, Family
    end
  end
end