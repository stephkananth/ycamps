class HomeController < ApplicationController
  def index
    @current_camps = Camp.all.current.alphabetical
     if logged_in? && (current_user.role?(:parent))
        @parent = Parent.where(user_id: current_user).first
        @campers = @parent.campers
    end
  end
end
