class HomeController < ApplicationController
  def index
  	if logged_in? && (current_user.role?(:admin))
    	@current_camps = Camp.all.current.alphabetical
    elsif logged_in? && (current_user.role?(:parent))
        @parent = Parent.where(user_id: current_user).first
        @campers = @parent.campers
    elsif logged_in? && (current_user.role?(:counselor))
    	@counselor = Counselor.where(user_id: current_user).first
    	@current_camp = @counselor.camps.current.first
    	@class = @counselor.camp_badges.where(camp_id: @current_camp.id).first
    	# byebug
    end
  end
end
